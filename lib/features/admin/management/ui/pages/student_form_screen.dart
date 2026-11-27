import 'package:alkheir_mosque/features/admin/management/domain/entities/records_entity.dart';
import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/shared/operations/data/params/operations_params.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

/// نموذج إنشاء طالب أو تعديله. ولي الأمر والصف والجزء تُختار من قوائم بحث.
class StudentFormScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final int? studentId;

  const StudentFormScreen({super.key, required this.token, this.studentId});

  @override
  ConsumerState<StudentFormScreen> createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends ConsumerState<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
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
  // لا نعرض نموذجاً فارغاً عند فشل التحميل: حفظه كان سيمسح بيانات الطالب الحقيقية.
  late final _currentProvider = screenDataProvider<StudentRecord?>(() async {
    final id = widget.studentId;
    if (id == null) return null;
    return ref
        .read(operationsActionsControllerProvider.notifier)
        .query((r) => r.student(id));
  });
  bool get _loading => ref.watch(_currentProvider).isLoading;
  String? get _loadError {
    final state = ref.watch(_currentProvider);
    return state.hasError ? errorText(state.error!) : null;
  }

  bool _saving = false;
  String? _parentError;

  bool get _isEdit => widget.studentId != null;

  @override
  void initState() {
    super.initState();
    ref.listenManual(_currentProvider, (_, next) {
      if (next case AsyncData(:final value?)) setState(() => _fill(value));
    }, fireImmediately: true);
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

  void _fill(StudentRecord s) {
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
            label: s.quranCurrentJuz == null
                ? ''
                : L10nGateway.current.juz((s.quranCurrentJuz ?? '')),
          );
  }

  void _retryLoad() => ref.invalidate(_currentProvider);

  Future<List<PickerItem>> _loadParents(String search) async {
    final page = await ref
        .read(managementActionsControllerProvider.notifier)
        .query((r) => r.parents(search: search));
    return [
      for (final p in page.items)
        PickerItem(id: p.id, label: p.fatherName, subtitle: p.parentNumber),
    ];
  }

  Future<void> _save() async {
    if (!ref.read(_currentProvider).hasValue) return;
    final valid = _formKey.currentState!.validate();
    setState(() => _parentError =
        _parent == null ? L10nGateway.current.chooseParent : null);
    if (!valid || _parent == null) return;
    setState(() => _saving = true);
    final outcome2 = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.saveStudent(
            widget.studentId,
            SaveStudentParams(
                firstName: _firstName.text.trim(),
                lastName: _lastName.text.trim(),
                birthDate: _birthDate.text,
                parentId: _parent!.id,
                gender: _gender,
                status: _status,
                gradeLevelId: _gradeLevel?.id,
                joinedAt: nullIfBlank(_joinedAt.text),
                quranCurrentJuzId: _juz?.id,
                schoolName: nullIfBlank(_schoolName.text),
                notes: nullIfBlank(_notes.text))));
    if (!mounted) return;
    if (outcome2.error case final error?) {
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
        ? ModuleAccess.canUpdateStudents(t)
        : ModuleAccess.canCreateStudents(t);
    return ModuleScaffold(
      title: _isEdit ? context.l10n.editStudent : context.l10n.newStudent,
      body: !allowed
          ? const ModuleAccessDenied()
          : _loading
              ? const Center(child: CircularProgressIndicator())
              : _loadError != null
                  ? ModuleMessage(
                      text: _loadError!,
                      icon: Icons.error_outline_rounded,
                      color: context.appColors.error,
                      onRetry: _retryLoad,
                    )
                  : ModuleFormPage(
                      formKey: _formKey,
                      children: [
                        ModuleFormSection(
                          title: context.l10n.studentDetails,
                          icon: Icons.person_rounded,
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
                            moduleDateField(
                              context: context,
                              controller: _birthDate,
                              label: context.l10n.dateOfBirth,
                              required: true,
                            ),
                            DropdownButtonFormField<String>(
                              initialValue: _gender,
                              isExpanded: true,
                              decoration: InputDecoration(
                                  labelText: context.l10n.gender),
                              items: [
                                DropdownMenuItem(
                                    value: 'male',
                                    child: Text(context.l10n.male)),
                                DropdownMenuItem(
                                    value: 'female',
                                    child: Text(context.l10n.female)),
                              ],
                              onChanged: (v) => setState(() => _gender = v),
                            ),
                            const SizedBox(height: 12),
                            DropdownButtonFormField<String>(
                              initialValue: _status,
                              isExpanded: true,
                              decoration: InputDecoration(
                                  labelText: context.l10n.status),
                              items: [
                                DropdownMenuItem(
                                    value: 'active',
                                    child: Text(context.l10n.active)),
                                DropdownMenuItem(
                                    value: 'inactive',
                                    child: Text(context.l10n.inactive)),
                                DropdownMenuItem(
                                    value: 'graduated',
                                    child: Text(context.l10n.graduated)),
                                DropdownMenuItem(
                                    value: 'blocked',
                                    child: Text(context.l10n.blocked)),
                              ],
                              onChanged: (v) =>
                                  setState(() => _status = v ?? _status),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                        ModuleFormSection(
                          title: context.l10n.parentAndGrade,
                          icon: Icons.family_restroom_rounded,
                          children: [
                            PickerField(
                              label: context.l10n.parent,
                              value: _parent?.label,
                              error: _parentError,
                              onTap: () async {
                                final picked = await showItemPicker(
                                  context,
                                  title: L10nGateway.current.chooseParent,
                                  load: _loadParents,
                                );
                                if (picked != null) {
                                  setState(() => _parent = picked);
                                }
                              },
                            ),
                            PickerField(
                              label: context.l10n.gradeLevel,
                              value: _gradeLevel?.label,
                              onTap: () async {
                                final picked = await showItemPicker(
                                  context,
                                  title: L10nGateway.current.chooseGradeLevel,
                                  allowClear: true,
                                  load: (s) => referencePickerItems(
                                      'grade-levels',
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
                              label: context.l10n.currentJuz,
                              value: _juz?.label,
                              onTap: () async {
                                final picked = await showItemPicker(
                                  context,
                                  title: L10nGateway.current.chooseJuz,
                                  allowClear: true,
                                  load: (s) => referencePickerItems('quran-juz',
                                      search: s),
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
                              label: context.l10n.enrollmentDate,
                            ),
                          ],
                        ),
                        ModuleFormSection(
                          title: context.l10n.additionalInformation,
                          icon: Icons.notes_rounded,
                          children: [
                            moduleTextField(
                              controller: _schoolName,
                              label: context.l10n.schoolName,
                            ),
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
}
