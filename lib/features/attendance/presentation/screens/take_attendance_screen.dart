import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/models/records_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/operations/data/repositories/operations_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/pickers.dart';

/// أخذ حضور حلقة في يوم محدد: كل طالب نشط بحالته. الحالات تأتي من الخادم
/// بنطاق `student`، والخادم يرفض الطلاب الذين لا يتبعون الحلقة.
class TakeAttendanceScreen extends StatefulWidget {
  final AuthToken token;

  const TakeAttendanceScreen({super.key, required this.token});

  @override
  State<TakeAttendanceScreen> createState() => _TakeAttendanceScreenState();
}

class _TakeAttendanceScreenState extends State<TakeAttendanceScreen> {
  final _operations = OperationsRepositoryImpl();
  final _notes = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  PickerItem? _group;
  List<RefItem> _statuses = const [];
  List<EnrollmentRecord> _enrollments = const [];
  final Map<int, int> _chosen = {};
  bool _loading = false;
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _notes.dispose();
    _date.dispose();
    super.dispose();
  }

  /// كل التسجيلات النشطة للحلقة عبر كل الصفحات.
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

  Future<void> _loadGroup(PickerItem group) async {
    setState(() {
      _group = group;
      _loading = true;
      _error = null;
    });
    try {
      final results = await Future.wait([
        _activeEnrollments(group.id),
        _operations.attendanceStatuses('student'),
      ]);
      if (!mounted) return;
      final enrollments = results[0] as List<EnrollmentRecord>;
      final statuses = results[1] as List<RefItem>;
      final defaultStatus = statuses.firstWhere(
        (s) => s.code == 'present',
        orElse: () => statuses.isEmpty
            ? const RefItem(
                id: 0, name: '', code: null, isActive: true, isCurrent: false)
            : statuses.first,
      );
      setState(() {
        _enrollments = enrollments;
        _statuses = statuses;
        _chosen
          ..clear()
          ..addEntries(
              enrollments.map((e) => MapEntry(e.id, defaultStatus.id)));
        _loading = false;
      });
    } catch (error) {
      if (!mounted) return;
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

  Future<void> _save() async {
    final group = _group;
    if (group == null) {
      showModuleSnack(context, tr('اختر الحلقة أولاً'), error: true);
      return;
    }
    if (_enrollments.isEmpty) {
      showModuleSnack(context, tr('لا يوجد طلاب نشطون في هذه الحلقة'),
          error: true);
      return;
    }
    setState(() => _saving = true);
    try {
      await _operations.takeGroupAttendance(
        groupId: group.id,
        attendanceDate: _date.text,
        notes: nullIfBlank(_notes.text),
        records: [
          for (final e in _enrollments)
            {
              'enrollment_id': e.id,
              'attendance_status_id': _chosen[e.id],
            },
        ],
      );
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!ModuleAccess.canTakeStudentAttendance(widget.token)) {
      return ModuleScaffold(
        title: tr('أخذ الحضور'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('أخذ الحضور'),
      body: ListView(
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
          else if (_group != null && _enrollments.isEmpty)
            ModuleMessage(text: tr('لا يوجد طلاب نشطون في هذه الحلقة'))
          else
            for (final e in _enrollments)
              _StudentRow(
                name: e.studentName,
                statuses: _statuses,
                value: _chosen[e.id],
                onChanged: (id) => setState(() => _chosen[e.id] = id),
              ),
          const SizedBox(height: 12),
          ModuleSaveButton(
            saving: _saving,
            onPressed: _save,
            label: tr('حفظ الحضور'),
          ),
        ],
      ),
    );
  }
}

class _StudentRow extends StatelessWidget {
  final String name;
  final List<RefItem> statuses;
  final int? value;
  final ValueChanged<int> onChanged;

  const _StudentRow({
    required this.name,
    required this.statuses,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ModuleCard(
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: appTextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 150,
            child: DropdownButtonFormField<int>(
              initialValue: statuses.any((s) => s.id == value) ? value : null,
              isExpanded: true,
              decoration: const InputDecoration(isDense: true),
              items: [
                for (final s in statuses)
                  DropdownMenuItem(
                      value: s.id,
                      child: Text(s.name, style: appTextStyle(fontSize: 12))),
              ],
              onChanged: (id) {
                if (id != null) onChanged(id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
