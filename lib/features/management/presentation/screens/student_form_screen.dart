import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/operations/data/repositories/operations_repository_impl.dart';
import '../widgets/module_form_fields.dart';
import '../widgets/module_widgets.dart';
import '../widgets/pickers.dart';

/// نموذج إنشاء طالب أو تعديله. ولي الأمر والصف والجزء تُختار من قوائم بحث.
class StudentFormScreen extends StatefulWidget {
  final AuthToken token;
  final int? studentId;

  const StudentFormScreen({super.key, required this.token, this.studentId});

  @override
  State<StudentFormScreen> createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _operations = OperationsRepositoryImpl();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _birthDate = TextEditingController();
  final _joinedAt = TextEditingController();
  final _schoolName = TextEditingController();
  final _notes = TextEditingController();

  PickerItem? _parent;
  PickerItem? _gradeLevel;
  PickerItem? _juz;
  String? _gender;
  String _status = 'active';
  bool _loading = true;
  bool _saving = false;
  String? _parentError;

  bool get _isEdit => widget.studentId != null;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    for (final c in [
      _firstName,
      _lastName,
      _birthDate,
      _joinedAt,
      _schoolName,
      _notes,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    final id = widget.studentId;
    if (id == null) {
      setState(() => _loading = false);
      return;
    }
    try {
      final s = await _operations.student(id);
      if (!mounted) return;
      _firstName.text = s.firstName;
      _lastName.text = s.lastName;
      _birthDate.text = s.birthDate ?? '';
      _joinedAt.text = s.joinedAt ?? '';
      _schoolName.text = s.schoolName ?? '';
      _notes.text = s.notes ?? '';
      _gender = s.gender;
      _status = s.status;
      _parent = s.parentId == null
          ? null
          : PickerItem(id: s.parentId!, label: s.parentName ?? '');
      _gradeLevel = s.gradeLevelId == null
          ? null
          : PickerItem(id: s.gradeLevelId!, label: s.gradeLevelName ?? '');
      _juz = s.quranCurrentJuzId == null
          ? null
          : PickerItem(
              id: s.quranCurrentJuzId!,
              label: trf('الجزء {0}', [s.quranCurrentJuz ?? 0]),
            );
      setState(() => _loading = false);
    } catch (error) {
      if (!mounted) return;
      setState(() => _loading = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  Future<List<PickerItem>> _loadParents(String search) async {
    final page = await ManagementRepositoryImpl().parents(search: search);
    return [
      for (final p in page.items)
        PickerItem(id: p.id, label: p.fatherName, subtitle: p.parentNumber),
    ];
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(
        () => _parentError = _parent == null ? tr('اختر ولي الأمر') : null);
    if (!valid || _parent == null) return;
    setState(() => _saving = true);
    try {
      await _operations.saveStudent(widget.studentId, {
        'first_name': _firstName.text.trim(),
        'last_name': _lastName.text.trim(),
        'birth_date': _birthDate.text,
        'parent_id': _parent!.id,
        'gender': _gender,
        'status': _status,
        'grade_level_id': _gradeLevel?.id,
        'joined_at': nullIfBlank(_joinedAt.text),
        'quran_current_juz_id': _juz?.id,
        'school_name': nullIfBlank(_schoolName.text),
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
        ? ModuleAccess.canUpdateStudents(t)
        : ModuleAccess.canCreateStudents(t);
    return ModuleScaffold(
      title: _isEdit ? tr('تعديل الطالب') : tr('طالب جديد'),
      body: !allowed
          ? const ModuleAccessDenied()
          : _loading
              ? const Center(child: CircularProgressIndicator())
              : ModuleFormPage(
                  formKey: _formKey,
                  children: [
                    ModuleFormSection(
                      title: tr('بيانات الطالب'),
                      icon: Icons.person_rounded,
                      children: [
                        moduleTextField(
                          controller: _firstName,
                          label: tr('الاسم الأول'),
                          required: true,
                        ),
                        moduleTextField(
                          controller: _lastName,
                          label: tr('اسم العائلة'),
                          required: true,
                        ),
                        moduleDateField(
                          context: context,
                          controller: _birthDate,
                          label: tr('تاريخ الميلاد'),
                          required: true,
                        ),
                        DropdownButtonFormField<String>(
                          initialValue: _gender,
                          isExpanded: true,
                          decoration: InputDecoration(labelText: tr('الجنس')),
                          items: [
                            DropdownMenuItem(
                                value: 'male', child: Text(tr('ذكر'))),
                            DropdownMenuItem(
                                value: 'female', child: Text(tr('أنثى'))),
                          ],
                          onChanged: (v) => setState(() => _gender = v),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          initialValue: _status,
                          isExpanded: true,
                          decoration: InputDecoration(labelText: tr('الحالة')),
                          items: [
                            DropdownMenuItem(
                                value: 'active', child: Text(tr('نشط'))),
                            DropdownMenuItem(
                                value: 'inactive', child: Text(tr('غير نشط'))),
                            DropdownMenuItem(
                                value: 'graduated', child: Text(tr('متخرّج'))),
                            DropdownMenuItem(
                                value: 'blocked', child: Text(tr('موقوف'))),
                          ],
                          onChanged: (v) =>
                              setState(() => _status = v ?? _status),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                    ModuleFormSection(
                      title: tr('ولي الأمر والصف'),
                      icon: Icons.family_restroom_rounded,
                      children: [
                        PickerField(
                          label: tr('ولي الأمر'),
                          value: _parent?.label,
                          error: _parentError,
                          onTap: () async {
                            final picked = await showItemPicker(
                              context,
                              title: tr('اختر ولي الأمر'),
                              load: _loadParents,
                            );
                            if (picked != null) {
                              setState(() => _parent = picked);
                            }
                          },
                        ),
                        PickerField(
                          label: tr('الصف الدراسي'),
                          value: _gradeLevel?.label,
                          onTap: () async {
                            final picked = await showItemPicker(
                              context,
                              title: tr('اختر الصف'),
                              allowClear: true,
                              load: (s) => referencePickerItems('grade-levels',
                                  search: s),
                            );
                            if (picked == null) return;
                            setState(() => _gradeLevel =
                                picked.id == PickerItem.clear.id
                                    ? null
                                    : picked);
                          },
                        ),
                        PickerField(
                          label: tr('الجزء الحالي'),
                          value: _juz?.label,
                          onTap: () async {
                            final picked = await showItemPicker(
                              context,
                              title: tr('اختر الجزء'),
                              allowClear: true,
                              load: (s) =>
                                  referencePickerItems('quran-juz', search: s),
                            );
                            if (picked == null) return;
                            setState(() => _juz =
                                picked.id == PickerItem.clear.id
                                    ? null
                                    : picked);
                          },
                        ),
                        moduleDateField(
                          context: context,
                          controller: _joinedAt,
                          label: tr('تاريخ الالتحاق'),
                        ),
                      ],
                    ),
                    ModuleFormSection(
                      title: tr('معلومات إضافية'),
                      icon: Icons.notes_rounded,
                      children: [
                        moduleTextField(
                          controller: _schoolName,
                          label: tr('اسم المدرسة'),
                        ),
                        moduleTextField(
                          controller: _notes,
                          label: tr('ملاحظات'),
                          maxLines: 3,
                        ),
                      ],
                    ),
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
