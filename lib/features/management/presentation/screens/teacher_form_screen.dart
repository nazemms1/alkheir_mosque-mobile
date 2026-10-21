import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import '../widgets/module_form_fields.dart';
import '../widgets/module_widgets.dart';

/// نموذج إنشاء معلم أو تعديله، مع حساب الدخول المرتبط به.
class TeacherFormScreen extends StatefulWidget {
  final AuthToken token;
  final TeacherItem? teacher;

  const TeacherFormScreen({super.key, required this.token, this.teacher});

  @override
  State<TeacherFormScreen> createState() => _TeacherFormScreenState();
}

class _TeacherFormScreenState extends State<TeacherFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = ManagementRepositoryImpl();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _phone = TextEditingController();
  final _hiredAt = TextEditingController();
  final _notes = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();

  List<CourseItem> _courses = const [];
  List<RefItem> _jobTitles = const [];
  bool _loadingRefs = true;
  int? _courseId;
  int? _jobTitleId;
  bool _isHelping = false;
  bool _accountActive = true;
  bool _saving = false;

  bool get _isEdit => widget.teacher != null;

  @override
  void initState() {
    super.initState();
    final t = widget.teacher;
    if (t != null) {
      _firstName.text = t.firstName;
      _lastName.text = t.lastName;
      _phone.text = t.phone;
      _hiredAt.text = t.hiredAt ?? '';
      _notes.text = t.notes ?? '';
      _courseId = t.courseId;
      _jobTitleId = t.teacherJobTitleId;
      _isHelping = t.isHelping;
      _accountActive = t.isActive;
    }
    _loadReferences();
  }

  @override
  void dispose() {
    for (final c in [
      _firstName,
      _lastName,
      _phone,
      _hiredAt,
      _notes,
      _username,
      _password,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  /// الكورسات ومسميات الوظائف. أي قائمة لا يملك المستخدم صلاحيتها تبقى فارغة
  /// بدل أن تُفشل النموذج كله.
  Future<void> _loadReferences() async {
    List<CourseItem> courses = const [];
    List<RefItem> titles = const [];
    try {
      courses = (await _service.courses(perPage: 100)).items;
    } catch (_) {}
    try {
      titles = await _service.reference('teacher-job-titles');
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _courses = courses;
      _jobTitles = titles;
      _loadingRefs = false;
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final password = _password.text.trim();
    if (password.isNotEmpty && password.length < 8) {
      showModuleSnack(
        context,
        tr('كلمة المرور يجب أن تكون 8 أحرف على الأقل'),
        error: true,
      );
      return;
    }
    setState(() => _saving = true);
    try {
      await _service.saveTeacher(widget.teacher?.id, {
        'first_name': _firstName.text.trim(),
        'last_name': _lastName.text.trim(),
        'phone': _phone.text.trim(),
        'course_id': _courseId,
        'teacher_job_title_id': _jobTitleId,
        'hired_at': nullIfBlank(_hiredAt.text),
        'is_helping': _isHelping,
        'notes': nullIfBlank(_notes.text),
        'account_username': nullIfBlank(_username.text),
        if (password.isNotEmpty) 'account_password': password,
        'account_is_active': _accountActive,
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
        ? ModuleAccess.canUpdateTeachers(t)
        : ModuleAccess.canCreateTeachers(t);
    return ModuleScaffold(
      title: _isEdit ? tr('تعديل المعلم') : tr('معلم جديد'),
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                ModuleFormSection(
                  title: tr('بيانات المعلم'),
                  icon: Icons.school_rounded,
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
                    moduleTextField(
                      controller: _phone,
                      label: tr('رقم الهاتف'),
                      keyboard: TextInputType.phone,
                      required: true,
                    ),
                    if (_loadingRefs)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: LinearProgressIndicator(),
                      )
                    else ...[
                      if (_courses.isNotEmpty) _courseDropdown(),
                      if (_jobTitles.isNotEmpty) _jobTitleDropdown(),
                    ],
                    moduleDateField(
                      context: context,
                      controller: _hiredAt,
                      label: tr('تاريخ التعيين'),
                    ),
                    moduleSwitch(
                      label: tr('معلم مساعد'),
                      value: _isHelping,
                      onChanged: (v) => setState(() => _isHelping = v),
                    ),
                  ],
                ),
                ModuleFormSection(
                  title: tr('حساب الدخول'),
                  icon: Icons.lock_person_rounded,
                  children: [
                    moduleTextField(
                      controller: _username,
                      label: tr('اسم المستخدم'),
                      helper: tr('اتركه فارغاً لاستخدام الافتراضي'),
                    ),
                    moduleTextField(
                      controller: _password,
                      label: tr('كلمة المرور الجديدة'),
                      helper: tr('8 أحرف على الأقل، أو اتركها فارغة'),
                      obscure: true,
                    ),
                    moduleSwitch(
                      label: tr('الحساب نشط'),
                      value: _accountActive,
                      onChanged: (v) => setState(() => _accountActive = v),
                    ),
                  ],
                ),
                ModuleFormSection(
                  title: tr('معلومات إضافية'),
                  icon: Icons.notes_rounded,
                  children: [
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

  Widget _courseDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<int>(
        initialValue: _courses.any((c) => c.id == _courseId) ? _courseId : null,
        isExpanded: true,
        decoration: InputDecoration(labelText: tr('الكورس')),
        items: [
          for (final course in _courses)
            DropdownMenuItem(value: course.id, child: Text(course.name)),
        ],
        onChanged: (value) => setState(() => _courseId = value),
      ),
    );
  }

  Widget _jobTitleDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<int>(
        initialValue:
            _jobTitles.any((j) => j.id == _jobTitleId) ? _jobTitleId : null,
        isExpanded: true,
        decoration: InputDecoration(labelText: tr('المسمى الوظيفي')),
        items: [
          for (final title in _jobTitles)
            DropdownMenuItem(value: title.id, child: Text(title.name)),
        ],
        onChanged: (value) => setState(() => _jobTitleId = value),
      ),
    );
  }
}
