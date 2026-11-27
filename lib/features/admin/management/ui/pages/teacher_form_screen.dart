import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/features/admin/management/data/params/management_params.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';

/// نموذج إنشاء معلم أو تعديله، مع حساب الدخول المرتبط به.
class TeacherFormScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final TeacherItem? teacher;

  const TeacherFormScreen({super.key, required this.token, this.teacher});

  @override
  ConsumerState<TeacherFormScreen> createState() => _TeacherFormScreenState();
}

class _TeacherFormScreenState extends ConsumerState<TeacherFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _phone = TextEditingController();
  final _hiredAt = TextEditingController();
  final _notes = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();

  late final _refsProvider = screenDataProvider(_loadReferences);
  List<CourseItem> get _courses =>
      ref.watch(_refsProvider).valueOrNull?.courses ?? const [];
  List<RefItem> get _jobTitles =>
      ref.watch(_refsProvider).valueOrNull?.titles ?? const [];
  bool get _loadingRefs => ref.watch(_refsProvider).isLoading;
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
  Future<({List<CourseItem> courses, List<RefItem> titles})>
      _loadReferences() async {
    List<CourseItem> courses = const [];
    List<RefItem> titles = const [];
    try {
      courses = (await ref
              .read(managementActionsControllerProvider.notifier)
              .query((r) => r.courses(perPage: 100)))
          .items;
    } catch (_) {}
    try {
      titles = await ref
          .read(managementActionsControllerProvider.notifier)
          .query((r) => r.reference('teacher-job-titles'));
    } catch (_) {}
    return (courses: courses, titles: titles);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final password = _password.text.trim();
    if (password.isNotEmpty && password.length < 8) {
      showModuleSnack(
        context,
        L10nGateway.current.passwordMustBeAtLeast,
        error: true,
      );
      return;
    }
    setState(() => _saving = true);
    final outcome = await ref
        .read(managementActionsControllerProvider.notifier)
        .run((r) => r.saveTeacher(
            widget.teacher?.id,
            SaveTeacherParams(
                firstName: _firstName.text.trim(),
                lastName: _lastName.text.trim(),
                phone: _phone.text.trim(),
                courseId: _courseId,
                teacherJobTitleId: _jobTitleId,
                hiredAt: nullIfBlank(_hiredAt.text),
                isHelping: _isHelping,
                notes: nullIfBlank(_notes.text),
                accountUsername: nullIfBlank(_username.text),
                accountPassword: (password.isNotEmpty) ? password : null,
                accountIsActive: _accountActive)));
    if (!mounted) return;
    if (outcome.error case final error?) {
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    final allowed = _isEdit
        ? ModuleAccess.canUpdateTeachers(t)
        : ModuleAccess.canCreateTeachers(t);
    return ModuleScaffold(
      title: _isEdit ? context.l10n.editTeacher : context.l10n.newTeacher,
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                ModuleFormSection(
                  title: context.l10n.teacherDetails,
                  icon: Icons.school_rounded,
                  children: [
                    moduleTextField(
                      controller: _firstName,
                      label: context.l10n.firstName,
                      required: true,
                    ),
                    moduleTextField(
                      controller: _lastName,
                      label: context.l10n.lastName,
                      required: true,
                    ),
                    moduleTextField(
                      controller: _phone,
                      label: context.l10n.phoneNumber,
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
                      label: context.l10n.hireDate,
                    ),
                    moduleSwitch(
                      context,
                      label: context.l10n.assistingTeacher,
                      value: _isHelping,
                      onChanged: (v) => setState(() => _isHelping = v),
                    ),
                  ],
                ),
                ModuleFormSection(
                  title: context.l10n.loginAccount,
                  icon: Icons.lock_person_rounded,
                  children: [
                    moduleTextField(
                      controller: _username,
                      label: context.l10n.username,
                      helper: context.l10n.leaveEmptyToUseThe,
                    ),
                    moduleTextField(
                      controller: _password,
                      label: context.l10n.newPassword,
                      helper: context.l10n.charactersMinimumOrLeaveBlank,
                      obscure: true,
                    ),
                    moduleSwitch(
                      context,
                      label: context.l10n.accountActive,
                      value: _accountActive,
                      onChanged: (v) => setState(() => _accountActive = v),
                    ),
                  ],
                ),
                ModuleFormSection(
                  title: context.l10n.additionalInformation,
                  icon: Icons.notes_rounded,
                  children: [
                    moduleTextField(
                      controller: _notes,
                      label: context.l10n.notes,
                      maxLines: 3,
                    ),
                  ],
                ),
                ModuleSaveButton(
                  saving: _saving,
                  onPressed: _save,
                  label: context.l10n.save,
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
        decoration: InputDecoration(labelText: L10nGateway.current.course),
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
        decoration: InputDecoration(labelText: L10nGateway.current.jobTitle),
        items: [
          for (final title in _jobTitles)
            DropdownMenuItem(value: title.id, child: Text(title.name)),
        ],
        onChanged: (value) => setState(() => _jobTitleId = value),
      ),
    );
  }
}
