import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/records_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/operations/data/repositories/operations_repository_impl.dart';
import '../widgets/module_form_fields.dart';
import '../widgets/module_widgets.dart';
import '../widgets/pickers.dart';

/// تسمية حالة التسجيل بالنص المترجم (كل نص حرفي ليظهر في فحص الترجمة).
String enrollmentStatusLabel(String status) => switch (status) {
      'active' => tr('نشط'),
      'completed' => tr('مكتمل'),
      'cancelled' => tr('ملغى'),
      _ => status,
    };

/// تسجيلات الطلاب في الحلقات. يمكن حصرها بطالب أو بحلقة.
class EnrollmentsScreen extends StatefulWidget {
  final AuthToken token;
  final int? studentId;
  final String? studentName;
  final int? groupId;
  final String? groupName;

  const EnrollmentsScreen({
    super.key,
    required this.token,
    this.studentId,
    this.studentName,
    this.groupId,
    this.groupName,
  });

  @override
  State<EnrollmentsScreen> createState() => _EnrollmentsScreenState();
}

class _EnrollmentsScreenState extends State<EnrollmentsScreen> {
  final _operations = OperationsRepositoryImpl();
  String? _status;
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  String get _title {
    if (widget.studentName != null) return widget.studentName!;
    if (widget.groupName != null) return widget.groupName!;
    return tr('التسجيلات');
  }

  Future<void> _openForm({EnrollmentRecord? enrollment}) async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => EnrollmentFormScreen(
          token: widget.token,
          enrollment: enrollment,
          studentId: widget.studentId,
          studentName: widget.studentName,
          groupId: widget.groupId,
          groupName: widget.groupName,
        ),
      ),
    );
    if (saved == true) _refresh();
  }

  Future<void> _openSheet(EnrollmentRecord e) async {
    final t = widget.token;
    final choice = await showRecordSheet(
      context,
      title: e.studentName,
      subtitle: e.groupName ?? '',
      rows: [
        MapEntry(tr('الحالة'), enrollmentStatusLabel(e.status)),
        MapEntry(tr('تاريخ الالتحاق'), e.enrolledAt ?? ''),
        MapEntry(tr('تاريخ الخروج'), e.leftAt ?? ''),
        MapEntry(tr('النقاط'), '${e.finalPoints}'),
        MapEntry(tr('الصفحات المحفوظة'), '${e.memorizedPages}'),
        MapEntry(tr('الكورس'), e.courseName ?? ''),
        MapEntry(tr('ملاحظات'), e.notes ?? ''),
      ],
      actions: [
        if (ModuleAccess.canUpdateEnrollments(t))
          SheetAction(id: 'edit', label: tr('تعديل'), icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteEnrollments(t))
          SheetAction(
            id: 'delete',
            label: tr('حذف'),
            icon: Icons.delete_outline_rounded,
            destructive: true,
          ),
      ],
    );
    if (!mounted) return;
    if (choice == 'edit') await _openForm(enrollment: e);
    if (choice == 'delete') await _delete(e);
  }

  Future<void> _delete(EnrollmentRecord e) async {
    final ok = await confirmAction(
      context,
      title: tr('حذف التسجيل'),
      message: tr('سيتم حذف هذا التسجيل من الحلقة.'),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    try {
      await _operations.deleteEnrollment(e.id);
      if (!mounted) return;
      showModuleSnack(context, tr('تم حذف التسجيل'));
      _refresh();
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewEnrollments(t)) {
      return ModuleScaffold(title: _title, body: const ModuleAccessDenied());
    }
    return ModuleScaffold(
      title: _title,
      floatingActionButton: ModuleAccess.canCreateEnrollments(t)
          ? FloatingActionButton.extended(
              onPressed: () => _openForm(),
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.add_rounded, color: Colors.white),
              label: Text(
                tr('تسجيل جديد'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<EnrollmentRecord>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد تسجيلات'),
        header: _StatusFilter(
          selected: _status,
          onSelected: (value) => setState(() {
            _status = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => _operations.enrollments(
          page: page,
          studentId: widget.studentId,
          groupId: widget.groupId,
          status: _status,
        ),
        itemBuilder: (context, e, _) => ModuleCard(
          accent: e.isActive ? AppColors.success : AppColors.textMuted,
          onTap: () => _openSheet(e),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      e.studentName,
                      style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: enrollmentStatusLabel(e.status),
                    color: e.isActive ? AppColors.success : AppColors.textMuted,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${e.groupName ?? ''}  ·  ${e.enrolledAt ?? ''}',
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
              ),
              Text(
                trf('النقاط: {0}  ·  الصفحات: {1}',
                    [e.finalPoints, e.memorizedPages]),
                style: appTextStyle(fontSize: 11, color: moduleMuted(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusFilter extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;

  const _StatusFilter({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final options = <String?, String>{
      null: tr('الكل'),
      'active': tr('نشط'),
      'completed': tr('مكتمل'),
      'cancelled': tr('ملغى'),
    };
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        children: [
          for (final entry in options.entries)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ChoiceChip(
                label: Text(entry.value, style: appTextStyle(fontSize: 12)),
                selected: entry.key == selected,
                onSelected: (_) => onSelected(entry.key),
              ),
            ),
        ],
      ),
    );
  }
}

/// نموذج تسجيل: الطالب والحلقة وتاريخ الالتحاق والحالة.
class EnrollmentFormScreen extends StatefulWidget {
  final AuthToken token;
  final EnrollmentRecord? enrollment;
  final int? studentId;
  final String? studentName;
  final int? groupId;
  final String? groupName;

  const EnrollmentFormScreen({
    super.key,
    required this.token,
    this.enrollment,
    this.studentId,
    this.studentName,
    this.groupId,
    this.groupName,
  });

  @override
  State<EnrollmentFormScreen> createState() => _EnrollmentFormScreenState();
}

class _EnrollmentFormScreenState extends State<EnrollmentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _operations = OperationsRepositoryImpl();
  final _enrolledAt = TextEditingController();
  final _leftAt = TextEditingController();
  final _notes = TextEditingController();
  PickerItem? _student;
  PickerItem? _group;
  String _status = 'active';
  bool _saving = false;
  String? _error;

  bool get _isEdit => widget.enrollment != null;

  @override
  void initState() {
    super.initState();
    final e = widget.enrollment;
    if (e != null) {
      _student = PickerItem(id: e.studentId, label: e.studentName);
      _group = PickerItem(id: e.groupId, label: e.groupName ?? '');
      _enrolledAt.text = e.enrolledAt ?? '';
      _leftAt.text = e.leftAt ?? '';
      _notes.text = e.notes ?? '';
      _status = e.status;
    } else {
      if (widget.studentId != null) {
        _student = PickerItem(
          id: widget.studentId!,
          label: widget.studentName ?? '',
        );
      }
      if (widget.groupId != null) {
        _group = PickerItem(id: widget.groupId!, label: widget.groupName ?? '');
      }
      _enrolledAt.text = isoDate(DateTime.now());
    }
  }

  @override
  void dispose() {
    _enrolledAt.dispose();
    _leftAt.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<List<PickerItem>> _loadStudents(String search) async {
    final page = await ManagementRepositoryImpl().students(search: search);
    return [
      for (final s in page.items)
        PickerItem(id: s.id, label: s.fullName, subtitle: s.studentNumber),
    ];
  }

  Future<List<PickerItem>> _loadGroups(String search) async {
    final page = await ManagementRepositoryImpl().groups();
    final needle = search.toLowerCase();
    return [
      for (final g in page.items)
        if (needle.isEmpty || g.name.toLowerCase().contains(needle))
          PickerItem(id: g.id, label: g.name, subtitle: g.courseName),
    ];
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() {
      _error = _student == null
          ? tr('اختر الطالب')
          : _group == null
              ? tr('اختر الحلقة')
              : null;
    });
    if (!valid || _student == null || _group == null) return;
    setState(() => _saving = true);
    try {
      await _operations.saveEnrollment(widget.enrollment?.id, {
        'student_id': _student!.id,
        'group_id': _group!.id,
        'enrolled_at': _enrolledAt.text,
        'status': _status,
        'left_at': nullIfBlank(_leftAt.text),
        'notes': nullIfBlank(_notes.text),
      });
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
    final t = widget.token;
    final allowed = _isEdit
        ? ModuleAccess.canUpdateEnrollments(t)
        : ModuleAccess.canCreateEnrollments(t);
    return ModuleScaffold(
      title: _isEdit ? tr('تعديل التسجيل') : tr('تسجيل جديد'),
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                PickerField(
                  label: tr('الطالب'),
                  value: _student?.label,
                  error: _error,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: tr('اختر الطالب'),
                      load: _loadStudents,
                    );
                    if (picked != null) setState(() => _student = picked);
                  },
                ),
                PickerField(
                  label: tr('الحلقة'),
                  value: _group?.label,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: tr('اختر الحلقة'),
                      load: _loadGroups,
                    );
                    if (picked != null) setState(() => _group = picked);
                  },
                ),
                moduleDateField(
                  context: context,
                  controller: _enrolledAt,
                  label: tr('تاريخ الالتحاق'),
                  required: true,
                ),
                DropdownButtonFormField<String>(
                  initialValue: _status,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: tr('الحالة')),
                  items: [
                    for (final code in const [
                      'active',
                      'completed',
                      'cancelled'
                    ])
                      DropdownMenuItem(
                        value: code,
                        child: Text(enrollmentStatusLabel(code)),
                      ),
                  ],
                  onChanged: (v) => setState(() => _status = v ?? _status),
                ),
                const SizedBox(height: 12),
                moduleDateField(
                  context: context,
                  controller: _leftAt,
                  label: tr('تاريخ الخروج'),
                ),
                moduleTextField(
                  controller: _notes,
                  label: tr('ملاحظات'),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                ModuleSaveButton(
                  saving: _saving,
                  onPressed: _save,
                  label: tr('حفظ'),
                ),
              ],
            ),
    );
  }
}
