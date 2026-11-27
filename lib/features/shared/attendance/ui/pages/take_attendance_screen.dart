import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/widgets/auto_save.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/records_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';
import 'package:alkheir_mosque/features/shared/attendance/ui/widgets/att_status_row.dart';

/// أخذ حضور حلقة في يوم محدد: كل طالب نشط بحالته.
///
/// - عند اختيار الحلقة والتاريخ يُحمَّل الحضور المسجّل سابقاً لذلك اليوم،
///   فلا يُستبدل بالقيمة الافتراضية عند الحفظ.
/// - كل تغيير في حالة طالب يُحفظ فوراً، والملاحظات بعد توقف الكتابة.
/// - اليوم المغلق أو الكورس المنتهي للقراءة فقط.
///
/// هذا الجزء هو المحتوى فقط (بدون Scaffold) ليُعرض داخل تبويب الشاشة الرئيسية.
class TakeAttendanceBody extends ConsumerStatefulWidget {
  final AuthToken token;

  const TakeAttendanceBody({super.key, required this.token});

  @override
  ConsumerState<TakeAttendanceBody> createState() => _TakeAttendanceBodyState();
}

/// الحضور المسجّل سابقاً لحلقة في يوم محدد.
class _ExistingDay {
  final Map<int, int> chosen; // enrollment id -> attendance status id
  final bool locked;

  const _ExistingDay({required this.chosen, required this.locked});
}

class _TakeAttendanceBodyState extends ConsumerState<TakeAttendanceBody> {
  final _notes = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  late final AutoSaveController _autosave = AutoSaveController(_persist);
  Timer? _notesDebounce;

  PickerItem? _group;
  final Map<int, int> _chosen = {};
  bool _locked = false;
  bool _hasExisting = false;

  /// الطلاب والحضور المسجّل للحلقة والتاريخ الحاليين (إعادة التحميل تُسقط أي
  /// نتيجة قديمة بعد تغيير الحلقة أو التاريخ).
  late final _dayProvider = screenDataProvider(_loadDay);
  List<RefItem> _cachedStatuses = const [];
  List<RefItem> get _statuses =>
      ref.watch(_dayProvider).valueOrNull?.statuses ?? const [];
  List<EnrollmentRecord> get _enrollments =>
      ref.watch(_dayProvider).valueOrNull?.enrollments ?? const [];
  bool get _loading => ref.watch(_dayProvider).isLoading;
  String? get _error {
    final e = ref.watch(_dayProvider).error;
    return e == null ? null : errorText(e);
  }

  /// التاريخ الذي تمثله `_chosen` حالياً؛ لا نحفظ إلا إذا تطابق مع حقل التاريخ.
  String _loadedDate = '';

  @override
  void initState() {
    super.initState();
    _date.addListener(_onDateChanged);
    _notes.addListener(_onNotesChanged);
    ref.listenManual(_dayProvider, (_, next) {
      if (next case AsyncData(:final value?)) {
        setState(() {
          _chosen
            ..clear()
            ..addAll(value.chosen);
          _loadedDate = value.date;
          _hasExisting = value.hasExisting;
          _locked = value.locked;
        });
      }
    });
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
      final result = await ref
          .read(operationsActionsControllerProvider.notifier)
          .query((r) => r.enrollments(
                page: page,
                groupId: groupId,
                status: 'active',
              ));
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
    final page = await ref
        .read(operationsActionsControllerProvider.notifier)
        .query((r) => r.studentAttendanceDays(dateFrom: date, dateTo: date));
    for (final summary in page.items) {
      if (summary.attendanceDate != date) continue;
      final detail = await ref
          .read(operationsActionsControllerProvider.notifier)
          .query((r) => r.studentAttendanceDay(summary.id));
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
      _chosen.clear();
      _hasExisting = false;
      _locked = false;
    });
    await _reload();
  }

  Future<void> _reload() => reloadScreenData(ref, _dayProvider);

  Future<
      ({
        List<RefItem> statuses,
        List<EnrollmentRecord> enrollments,
        Map<int, int> chosen,
        String date,
        bool hasExisting,
        bool locked,
      })?> _loadDay() async {
    final group = _group;
    if (group == null) return null;
    final date = _date.text;
    final enrollments = await _activeEnrollments(group.id);
    final statuses = _cachedStatuses.isNotEmpty
        ? _cachedStatuses
        : _cachedStatuses = await ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.attendanceStatuses('student'));
    if (statuses.isEmpty) {
      throw ApiError(
          type: ApiErrorType.custom,
          message: L10nGateway.current.noAttendanceStatusesDefined);
    }
    final existing = await _findExistingDay(group, date, statuses);
    final fallback = _defaultStatusOf(statuses).id;
    return (
      statuses: statuses,
      enrollments: enrollments,
      chosen: {
        for (final e in enrollments) e.id: existing?.chosen[e.id] ?? fallback,
      },
      date: date,
      hasExisting: existing != null,
      locked: existing?.locked ?? false,
    );
  }

  Future<void> _pickGroup() async {
    final picked = await showItemPicker(
      context,
      title: L10nGateway.current.chooseGroup,
      load: (search) async {
        final page = await ref
            .read(managementActionsControllerProvider.notifier)
            .query((r) => r.groups());
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
    await ref
        .read(operationsActionsControllerProvider.notifier)
        .query((r) => r.takeGroupAttendance(
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
            ));
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
          label: context.l10n.group,
          value: _group?.label,
          onTap: _pickGroup,
        ),
        moduleDateField(
          context: context,
          controller: _date,
          label: context.l10n.attendanceDate,
          required: true,
        ),
        moduleTextField(
          controller: _notes,
          label: context.l10n.generalNotes,
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
              text: context.l10n.attendanceNotTakenYet,
              icon: Icons.info_outline_rounded,
            ),
          ),
        if (_locked)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ModuleMessage(
              text: context.l10n.attendanceReadOnly,
              icon: Icons.lock_outline_rounded,
              color: context.appColors.warning,
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
            color: context.appColors.error,
          )
        else if (hasGroup && _enrollments.isEmpty)
          ModuleMessage(text: context.l10n.noActiveStudentsInThis)
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
