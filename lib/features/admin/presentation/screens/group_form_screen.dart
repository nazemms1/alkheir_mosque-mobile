import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/features/admin/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/operations/data/repositories/operations_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/pickers.dart';

/// نموذج إنشاء حلقة أو تعديلها. الكورس والسنة والمعلم والصف تُختار من قوائم
/// بحث بدل إدخال المعرّفات يدوياً. عند التعديل تُحمَّل بيانات الحلقة كاملة.
class GroupFormScreen extends StatefulWidget {
  /// الحساب الحالي — الإنشاء يتطلب `groups.create` والتعديل `groups.update`.
  final AuthToken token;
  final AdminGroupDetail? group;

  const GroupFormScreen({super.key, required this.token, this.group});

  @override
  State<GroupFormScreen> createState() => _GroupFormScreenState();
}

class _GroupFormScreenState extends State<GroupFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _operations = OperationsRepositoryImpl();
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
  bool _loading = true;
  bool _saving = false;
  String? _error;

  int? get _groupId => widget.group?.id;
  bool get _isEdit => _groupId != null;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    for (final c in [_name, _capacity, _monthlyFee, _startsOn, _endsOn]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    final id = _groupId;
    if (id == null) {
      setState(() => _loading = false);
      return;
    }
    try {
      final g = await _operations.group(id);
      if (!mounted) return;
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
      // الحلقة لا ترسل اسم الصف، لذا نبحث عنه في الكتالوج.
      if (g.gradeLevelId != null) {
        final grades = await referencePickerItems('grade-levels');
        for (final item in grades) {
          if (item.id == g.gradeLevelId) _gradeLevel = item;
        }
      }
      if (!mounted) return;
      setState(() => _loading = false);
    } catch (error) {
      if (!mounted) return;
      setState(() => _loading = false);
      showModuleSnack(context, errorText(error), error: true);
    }
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
    final page =
        await ManagementRepositoryImpl().courses(search: search, perPage: 50);
    return [
      for (final c in page.items)
        PickerItem(id: c.id, label: c.name, subtitle: c.academicYear),
    ];
  }

  Future<List<PickerItem>> _loadTeachers(String search) async {
    final page = await ManagementRepositoryImpl().teachers(
      search: search,
      status: 'active',
      perPage: 50,
    );
    return [
      for (final TeacherItem t in page.items)
        PickerItem(id: t.id, label: t.fullName, subtitle: t.phone),
    ];
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() {
      _error = _academicYear == null
          ? tr('اختر السنة الدراسية')
          : _course == null
              ? tr('اختر الكورس')
              : _teacher == null
                  ? tr('اختر المعلم')
                  : null;
    });
    final capacity = int.tryParse(_capacity.text.trim());
    if (capacity == null || capacity < 0) {
      showModuleSnack(
        context,
        tr('أدخل سعة صحيحة أكبر من أو تساوي صفر'),
        error: true,
      );
      return;
    }
    if (!valid || _error != null) return;
    setState(() => _saving = true);
    try {
      await _operations.saveGroup(_groupId, {
        'name': _name.text.trim(),
        'academic_year_id': _academicYear!.id,
        'course_id': _course!.id,
        'teacher_id': _teacher!.id,
        'assistant_teacher_id': _assistant?.id,
        'grade_level_id': _gradeLevel?.id,
        'capacity': capacity,
        'monthly_fee': _monthlyFee.text.trim().isEmpty
            ? null
            : double.parse(_monthlyFee.text.trim()),
        'starts_on': nullIfBlank(_startsOn.text),
        'ends_on': nullIfBlank(_endsOn.text),
        'is_active': _isActive,
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
    final allowed = _isEdit
        ? ModuleAccess.canUpdateGroups(widget.token)
        : ModuleAccess.canCreateGroups(widget.token);
    return ModuleScaffold(
      title: _isEdit ? tr('تعديل الحلقة') : tr('إضافة حلقة'),
      body: !allowed
          ? const ModuleAccessDenied()
          : _loading
              ? const Center(child: CircularProgressIndicator())
              : ModuleFormPage(
                  formKey: _formKey,
                  children: [
                    moduleTextField(
                      controller: _name,
                      label: tr('اسم الحلقة'),
                      required: true,
                    ),
                    PickerField(
                      label: tr('السنة الدراسية'),
                      value: _academicYear?.label,
                      error: _error,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: tr('اختر السنة الدراسية'),
                          load: _loadYears,
                        );
                        if (picked != null) {
                          setState(() => _academicYear = picked);
                        }
                      },
                    ),
                    PickerField(
                      label: tr('الكورس'),
                      value: _course?.label,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: tr('اختر الكورس'),
                          load: _loadCourses,
                        );
                        if (picked != null) setState(() => _course = picked);
                      },
                    ),
                    PickerField(
                      label: tr('المعلم'),
                      value: _teacher?.label,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: tr('اختر المعلم'),
                          load: _loadTeachers,
                        );
                        if (picked != null) setState(() => _teacher = picked);
                      },
                    ),
                    PickerField(
                      label: tr('المعلم المساعد'),
                      value: _assistant?.label,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: tr('اختر المعلم المساعد'),
                          allowClear: true,
                          load: _loadTeachers,
                        );
                        if (picked == null) return;
                        setState(() => _assistant =
                            picked.id == PickerItem.clear.id ? null : picked);
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
                      label: tr('السعة القصوى'),
                      keyboard: TextInputType.number,
                      required: true,
                      helper: tr('عدد صحيح أكبر من أو يساوي صفر'),
                    ),
                    moduleTextField(
                      controller: _monthlyFee,
                      label: tr('الرسوم الشهرية'),
                      keyboard:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                    moduleDateField(
                      context: context,
                      controller: _startsOn,
                      label: tr('تاريخ البدء'),
                    ),
                    moduleDateField(
                      context: context,
                      controller: _endsOn,
                      label: tr('تاريخ الانتهاء'),
                    ),
                    moduleSwitch(
                      label: tr('حلقة نشطة'),
                      value: _isActive,
                      onChanged: (v) => setState(() => _isActive = v),
                    ),
                    const SizedBox(height: 8),
                    ModuleSaveButton(
                      saving: _saving,
                      onPressed: _save,
                      label: _isEdit ? tr('حفظ التعديلات') : tr('إنشاء الحلقة'),
                    ),
                  ],
                ),
    );
  }
}
