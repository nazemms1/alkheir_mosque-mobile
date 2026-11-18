import 'dart:async';

import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/app/core/widgets/auto_save.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/models/records_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/operations/data/repositories/operations_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/pickers.dart';
import 'package:alkheir_mosque/features/attendance/presentation/widgets/att_status_row.dart';

/// أخذ حضور حلقة في يوم محدد: كل طالب نشط بحالته.
///
/// - عند اختيار الحلقة والتاريخ يُحمَّل الحضور المسجّل سابقاً لذلك اليوم،
///   فلا يُستبدل بالقيمة الافتراضية عند الحفظ.
/// - كل تغيير في حالة طالب يُحفظ فوراً، والملاحظات بعد توقف الكتابة.
/// - اليوم المغلق أو الكورس المنتهي للقراءة فقط.
///
/// هذا الجزء هو المحتوى فقط (بدون Scaffold) ليُعرض داخل تبويب الشاشة الرئيسية.
class TakeAttendanceBody extends StatefulWidget {
  final AuthToken token;

  const TakeAttendanceBody({super.key, required this.token});

  @override
  State<TakeAttendanceBody> createState() => _TakeAttendanceBodyState();
}

/// الحضور المسجّل سابقاً لحلقة في يوم محدد.
class _ExistingDay {
  final Map<int, int> chosen; // enrollment id -> attendance status id
  final bool locked;

  const _ExistingDay({required this.chosen, required this.locked});
}

class _TakeAttendanceBodyState extends State<TakeAttendanceBody> {
  final _operations = OperationsRepositoryImpl();
  final _notes = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  late final AutoSaveController _autosave = AutoSaveController(_persist);
  Timer? _notesDebounce;

  PickerItem? _group;
  List<RefItem> _statuses = const [];
  List<EnrollmentRecord> _enrollments = const [];
  final Map<int, int> _chosen = {};
  bool _loading = false;
  bool _locked = false;
  bool _hasExisting = false;
  String? _error;

  /// التاريخ الذي تمثله `_chosen` حالياً؛ لا نحفظ إلا إذا تطابق مع حقل التاريخ.
  String _loadedDate = '';

  /// يمنع تطبيق نتيجة تحميل قديمة بعد تغيير الحلقة أو التاريخ.
  int _loadToken = 0;

  @override
  void initState() {
    super.initState();
    _date.addListener(_onDateChanged);
    _notes.addListener(_onNotesChanged);
  }

  @override
  void dispose() {
    _notesDebounce?.cancel();
    _date.removeListener(_onDateChanged);
    _notes.removeListener(_onNotesChanged);
    _autosave.dispose();
    _notes.dispose();
    _date.dispose();
    super.dispose();
  }

  /// كل الطلاب النشطين للحلقة عبر كل الصفحات.
  Future<List<EnrollmentRecord>> _activeEnrollments(int groupId) async {
    final all = <EnrollmentRecord>[];
    var page = 1;
    while (true) {
      final result = await _operations.enrollments(
        page: page,
        groupId: groupId,
        status: 'active',
      );
      all.addAll(result.items);
      if (!result.hasMore || page >= 50) break;
      page++;
    }
    return all;
  }

  RefItem _defaultStatusOf(List<RefItem> statuses) {
    for (final s in statuses) {
      if (s.code == 'present') return s;
    }
    return statuses.isNotEmpty
        ? statuses.first
        : const RefItem(
            id: 0, name: '', code: null, isActive: true, isCurrent: false);
  }

  /// يبحث عن يوم الحضور المسجّل للتاريخ، ثم عن سجل الحلقة داخله.
  /// ملاحظة: معرّف سجل اليوم للحلقة ليس معرّف الحلقة، لذلك تُطابق الحلقة بالاسم.
  Future<_ExistingDay?> _findExistingDay(
    PickerItem group,
    String date,
    List<RefItem> statuses,
  ) async {
    final page =
        await _operations.studentAttendanceDays(dateFrom: date, dateTo: date);
    for (final summary in page.items) {
      if (summary.attendanceDate != date) continue;
      final detail = await _operations.studentAttendanceDay(summary.id);
      for (final groupDay in detail.groups) {
        if (groupDay.groupName != group.label) continue;
        final chosen = <int, int>{};
        for (final record in groupDay.records) {
          for (final s in statuses) {
            if (s.code == record.statusCode) {
              chosen[record.enrollmentId] = s.id;
              break;
            }
          }
        }
        return _ExistingDay(
          chosen: chosen,
          locked: detail.status == 'closed' ||
              detail.courseFinished ||
              groupDay.status == 'closed',
        );
      }
    }
    return null;
  }

  Future<void> _loadGroup(PickerItem group) async {
    setState(() {
      _group = group;
      _enrollments = const [];
      _chosen.clear();
      _hasExisting = false;
      _locked = false;
    });
    await _reload();
  }

  /// يحمّل الطلاب والحضور المسجّل للحلقة والتاريخ الحاليين.
  Future<void> _reload() async {
    final group = _group;
    if (group == null) return;
    final token = ++_loadToken;
    final date = _date.text;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final enrollments = await _activeEnrollments(group.id);
      final statuses = _statuses.isNotEmpty
          ? _statuses
          : await _operations.attendanceStatuses('student');
      if (!mounted || token != _loadToken) return;
      if (statuses.isEmpty) {
        setState(() {
          _loading = false;
          _error = tr('لا توجد حالات حضور مُعرّفة');
        });
        return;
      }
      final existing = await _findExistingDay(group, date, statuses);
      if (!mounted || token != _loadToken) return;
      final fallback = _defaultStatusOf(statuses).id;
      setState(() {
        _statuses = statuses;
        _enrollments = enrollments;
        _chosen
          ..clear()
          ..addEntries(enrollments.map(
            (e) => MapEntry(e.id, existing?.chosen[e.id] ?? fallback),
          ));
        _loadedDate = date;
        _hasExisting = existing != null;
        _locked = existing?.locked ?? false;
        _loading = false;
      });
    } catch (error) {
      if (!mounted || token != _loadToken) return;
      setState(() {
        _loading = false;
        _error = errorText(error);
      });
    }
  }

  Future<void> _pickGroup() async {
    final picked = await showItemPicker(
      context,
      title: tr('اختر الحلقة'),
      load: (search) async {
        final page = await ManagementRepositoryImpl().groups();
        final needle = search.toLowerCase();
        return [
          for (final g in page.items)
            if (needle.isEmpty || g.name.toLowerCase().contains(needle))
              PickerItem(id: g.id, label: g.name, subtitle: g.courseName),
        ];
      },
    );
    if (picked != null) await _loadGroup(picked);
  }

  /// الحفظ الفعلي: يرسل كل سجلات الحلقة لليوم (نفس دلالة زر الحفظ السابق).
  Future<void> _persist() async {
    final group = _group;
    if (group == null || _loading || _locked || _enrollments.isEmpty) return;
    // التاريخ تغيّر ولم تُحمَّل حالته بعد: لا نرسل بيانات يوم بتاريخ آخر.
    if (_date.text != _loadedDate) return;
    await _operations.takeGroupAttendance(
      groupId: group.id,
      attendanceDate: _loadedDate,
      notes: nullIfBlank(_notes.text),
      records: [
        for (final e in _enrollments)
          {
            'enrollment_id': e.id,
            'attendance_status_id': _chosen[e.id],
          },
      ],
    );
    if (mounted && !_hasExisting) setState(() => _hasExisting = true);
  }

  void _setStatus(int enrollmentId, int statusId) {
    if (_locked || _loading) return;
    setState(() => _chosen[enrollmentId] = statusId);
    _autosave.request();
  }

  void _onDateChanged() {
    final text = _date.text;
    if (_group == null || text == _loadedDate) return;
    if (DateTime.tryParse(text) == null) return;
    _reload();
  }

  void _onNotesChanged() {
    _notesDebounce?.cancel();
    _notesDebounce = Timer(const Duration(milliseconds: 800), () {
      if (!mounted || _group == null || _loading || _locked) return;
      _autosave.request();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!ModuleAccess.canTakeStudentAttendance(widget.token)) {
      return const ModuleAccessDenied();
    }
    final hasGroup = _group != null;
    return ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        children: [
          PickerField(
            label: tr('الحلقة'),
            value: _group?.label,
            onTap: _pickGroup,
          ),
          moduleDateField(
            context: context,
            controller: _date,
            label: tr('تاريخ الحضور'),
            required: true,
          ),
          moduleTextField(
            controller: _notes,
            label: tr('ملاحظات عامة'),
            maxLines: 2,
          ),
          if (hasGroup) ...[
            const SizedBox(height: 4),
            AutoSaveIndicator(
              controller: _autosave,
              onRetry: _autosave.request,
            ),
            const SizedBox(height: 10),
          ],
          if (hasGroup && !_loading && _error == null && !_hasExisting)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ModuleMessage(
                text: tr(
                    'لم يُسجَّل حضور هذا اليوم بعد. أول تغيير يحفظ حضور الحلقة كاملاً.'),
                icon: Icons.info_outline_rounded,
              ),
            ),
          if (_locked)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ModuleMessage(
                text: tr('اليوم مغلق أو الكورس منتهٍ — السجل للقراءة فقط'),
                icon: Icons.lock_outline_rounded,
                color: AppColors.warning,
              ),
            ),
          if (_loading)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_error != null)
            ModuleMessage(
              text: _error!,
              icon: Icons.error_outline_rounded,
              color: AppColors.error,
            )
          else if (hasGroup && _enrollments.isEmpty)
            ModuleMessage(text: tr('لا يوجد طلاب نشطون في هذه الحلقة'))
          else
            for (final e in _enrollments)
              AttendanceStatusRow(
                key: ValueKey('att-row-${e.id}'),
                name: e.studentName,
                statuses: _statuses,
                value: _chosen[e.id],
                enabled: !_locked,
                onChanged: (id) => _setStatus(e.id, id),
              ),
        ],
    );
  }
}
