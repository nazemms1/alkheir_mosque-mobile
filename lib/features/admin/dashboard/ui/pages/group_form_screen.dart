import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/records_entity.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/features/shared/operations/data/params/operations_params.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

/// نموذج إنشاء حلقة أو تعديلها. الكورس والسنة والمعلم والصف تُختار من قوائم
/// بحث بدل إدخال المعرّفات يدوياً. عند التعديل تُحمَّل بيانات الحلقة كاملة.
class GroupFormScreen extends ConsumerStatefulWidget {
  /// الحساب الحالي — الإنشاء يتطلب `groups.create` والتعديل `groups.update`.
  final AuthToken token;
  final AdminGroupDetail? group;

  const GroupFormScreen({super.key, required this.token, this.group});

  @override
  ConsumerState<GroupFormScreen> createState() => _GroupFormScreenState();
}

class _GroupFormScreenState extends ConsumerState<GroupFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _capacity = TextEditingController();
  final _monthlyFee = TextEditingController();
  final _startsOn = TextEditingController();
  final _endsOn = TextEditingController();

  PickerItem? _academicYear;
  PickerItem? _course;
  PickerItem? _teacher;
  PickerItem? _assistant;
  PickerItem? _gradeLevel;
  bool _isActive = true;
  late final _currentProvider = screenDataProvider(_loadCurrent);
  bool get _loading => ref.watch(_currentProvider).isLoading;
  bool _saving = false;
  String? _error;

  int? get _groupId => widget.group?.id;
  bool get _isEdit => _groupId != null;

  @override
  void initState() {
    super.initState();
    ref.listenManual(_currentProvider, (_, next) {
      switch (next) {
        case AsyncData(:final value?):
          setState(() => _fill(value.group, value.grade));
        case AsyncError(:final error):
          showModuleSnack(context, errorText(error), error: true);
        default:
      }
    }, fireImmediately: true);
  }

  @override
  void dispose() {
    for (final c in [_name, _capacity, _monthlyFee, _startsOn, _endsOn]) {
      c.dispose();
    }
    super.dispose();
  }

  /// الحلقة المعدَّلة واسم صفها (الحلقة لا ترسل اسم الصف، فيُبحث عنه في الكتالوج).
  Future<({GroupRecord group, PickerItem? grade})?> _loadCurrent() async {
    final id = _groupId;
    if (id == null) return null;
    final g = await ref
        .read(operationsActionsControllerProvider.notifier)
        .query((r) => r.group(id));
    PickerItem? grade;
    if (g.gradeLevelId != null) {
      final grades = await referencePickerItems('grade-levels');
      for (final item in grades) {
        if (item.id == g.gradeLevelId) grade = item;
      }
    }
    return (group: g, grade: grade);
  }

  void _fill(GroupRecord g, PickerItem? grade) {
    _name.text = g.name;
    _capacity.text = '${g.capacity}';
    _monthlyFee.text = g.monthlyFee == 0 ? '' : '${g.monthlyFee}';
    _startsOn.text = g.startsOn ?? '';
    _endsOn.text = g.endsOn ?? '';
    _isActive = g.isActive;
    _academicYear = _pick(g.academicYearId, widget.group?.academicYear);
    _course = _pick(g.courseId, widget.group?.course);
    _teacher = _pick(g.teacherId, widget.group?.teacher);
    _assistant = _pick(g.assistantTeacherId, widget.group?.assistantTeacher);
    _gradeLevel = grade ?? _gradeLevel;
  }

  /// يبني اختياراً من المعرّف مع الاسم المتاح من القائمة (أو فارغاً).
  PickerItem? _pick(int? id, String? label) =>
      id == null ? null : PickerItem(id: id, label: label ?? '#$id');

  Future<List<PickerItem>> _loadYears(String search) => referencePickerItems(
        'academic-years',
        search: search,
        includeInactive: _isEdit,
      );

  Future<List<PickerItem>> _loadCourses(String search) async {
    final page = await ref
        .read(managementActionsControllerProvider.notifier)
        .query((r) => r.courses(search: search, perPage: 50));
    return [
      for (final c in page.items)
        PickerItem(id: c.id, label: c.name, subtitle: c.academicYear),
    ];
  }

  Future<List<PickerItem>> _loadTeachers(String search) async {
    final page = await ref
        .read(managementActionsControllerProvider.notifier)
        .query((r) => r.teachers(
              search: search,
              status: 'active',
              perPage: 50,
            ));
    return [
      for (final TeacherItem t in page.items)
        PickerItem(id: t.id, label: t.fullName, subtitle: t.phone),
    ];
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() {
      _error = _academicYear == null
          ? L10nGateway.current.chooseAnAcademicYear
          : _course == null
              ? L10nGateway.current.chooseCourse
              : _teacher == null
                  ? L10nGateway.current.chooseTeacher
                  : null;
    });
    final capacity = int.tryParse(_capacity.text.trim());
    if (capacity == null || capacity < 0) {
      showModuleSnack(
        context,
        L10nGateway.current.enterAValidCapacityOf,
        error: true,
      );
      return;
    }
    if (!valid || _error != null) return;
    setState(() => _saving = true);
    final outcome2 = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.saveGroup(
            _groupId,
            SaveGroupParams(
                name: _name.text.trim(),
                academicYearId: _academicYear!.id,
                courseId: _course!.id,
                teacherId: _teacher!.id,
                assistantTeacherId: _assistant?.id,
                gradeLevelId: _gradeLevel?.id,
                capacity: capacity,
                monthlyFee: _monthlyFee.text.trim().isEmpty
                    ? null
                    : double.parse(_monthlyFee.text.trim()),
                startsOn: nullIfBlank(_startsOn.text),
                endsOn: nullIfBlank(_endsOn.text),
                isActive: _isActive)));
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
    final allowed = _isEdit
        ? ModuleAccess.canUpdateGroups(widget.token)
        : ModuleAccess.canCreateGroups(widget.token);
    return ModuleScaffold(
      title: _isEdit ? context.l10n.editGroup : context.l10n.addGroup,
      body: !allowed
          ? const ModuleAccessDenied()
          : _loading
              ? const Center(child: CircularProgressIndicator())
              : ModuleFormPage(
                  formKey: _formKey,
                  children: [
                    moduleTextField(
                      controller: _name,
                      label: context.l10n.groupName,
                      required: true,
                    ),
                    PickerField(
                      label: context.l10n.academicYear,
                      value: _academicYear?.label,
                      error: _error,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: L10nGateway.current.chooseAnAcademicYear,
                          load: _loadYears,
                        );
                        if (picked != null) {
                          setState(() => _academicYear = picked);
                        }
                      },
                    ),
                    PickerField(
                      label: context.l10n.course,
                      value: _course?.label,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: L10nGateway.current.chooseCourse,
                          load: _loadCourses,
                        );
                        if (picked != null) setState(() => _course = picked);
                      },
                    ),
                    PickerField(
                      label: context.l10n.teacher,
                      value: _teacher?.label,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: L10nGateway.current.chooseTeacher,
                          load: _loadTeachers,
                        );
                        if (picked != null) setState(() => _teacher = picked);
                      },
                    ),
                    PickerField(
                      label: context.l10n.assistingTeacher2,
                      value: _assistant?.label,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: L10nGateway.current.chooseAssistingTeacher,
                          allowClear: true,
                          load: _loadTeachers,
                        );
                        if (picked == null) return;
                        setState(() => _assistant =
                            picked.id == PickerItem.clear.id ? null : picked);
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
                          load: (s) =>
                              referencePickerItems('grade-levels', search: s),
                        );
                        if (picked == null) return;
                        setState(() => _gradeLevel =
                            picked.id == PickerItem.clear.id ? null : picked);
                      },
                    ),
                    moduleTextField(
                      controller: _capacity,
                      label: context.l10n.maximumCapacity,
                      keyboard: TextInputType.number,
                      required: true,
                      helper: context.l10n.wholeNumberOfZeroOr,
                    ),
                    moduleTextField(
                      controller: _monthlyFee,
                      label: context.l10n.monthlyFee,
                      keyboard:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                    moduleDateField(
                      context: context,
                      controller: _startsOn,
                      label: context.l10n.startDate2,
                    ),
                    moduleDateField(
                      context: context,
                      controller: _endsOn,
                      label: context.l10n.endDate2,
                    ),
                    moduleSwitch(
                      context,
                      label: context.l10n.activeGroup,
                      value: _isActive,
                      onChanged: (v) => setState(() => _isActive = v),
                    ),
                    const SizedBox(height: 8),
                    ModuleSaveButton(
                      saving: _saving,
                      onPressed: _save,
                      label: _isEdit
                          ? context.l10n.saveChanges
                          : context.l10n.createGroup,
                    ),
                  ],
                ),
    );
  }
}
