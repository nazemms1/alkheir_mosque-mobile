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

/// نموذج إنشاء كورس أو تعديله. السنة الدراسية تُختار من السنوات النشطة فقط،
/// ويضاف غير النشط منها عند التعديل فقط (كما في الموقع).
class CourseFormScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final CourseItem? course;

  const CourseFormScreen({super.key, required this.token, this.course});

  @override
  ConsumerState<CourseFormScreen> createState() => _CourseFormScreenState();
}

class _CourseFormScreenState extends ConsumerState<CourseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _startsOn = TextEditingController();
  final _endsOn = TextEditingController();
  final _description = TextEditingController();

  late final _yearsProvider = screenDataProvider<List<RefItem>>(() => ref
      .read(managementActionsControllerProvider.notifier)
      .query((r) => r.reference('academic-years', includeInactive: _isEdit))
      .catchError((_) => const <RefItem>[]));
  List<RefItem> get _years => ref.watch(_yearsProvider).valueOrNull ?? const [];
  bool get _loadingYears => ref.watch(_yearsProvider).isLoading;
  int? _academicYearId;
  bool _awardsPoints = false;
  bool _isDefault = false;
  bool _saving = false;

  bool get _isEdit => widget.course != null;

  @override
  void initState() {
    super.initState();
    final c = widget.course;
    if (c != null) {
      _name.text = c.name;
      _startsOn.text = c.startsOn ?? '';
      _endsOn.text = c.endsOn ?? '';
      _description.text = c.description ?? '';
      _academicYearId = c.academicYearId;
      _awardsPoints = c.awardsPoints;
      _isDefault = c.isDefault;
    }
  }

  @override
  void dispose() {
    for (final c in [_name, _startsOn, _endsOn, _description]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_endsOn.text.compareTo(_startsOn.text) < 0) {
      showModuleSnack(
        context,
        L10nGateway.current.endDateMustBeAfter,
        error: true,
      );
      return;
    }
    if (_academicYearId == null) {
      showModuleSnack(context, L10nGateway.current.chooseAnAcademicYear,
          error: true);
      return;
    }
    setState(() => _saving = true);
    final outcome = await ref
        .read(managementActionsControllerProvider.notifier)
        .run((r) => r.saveCourse(
            widget.course?.id,
            SaveCourseParams(
                name: _name.text.trim(),
                academicYearId: _academicYearId,
                startsOn: _startsOn.text,
                endsOn: _endsOn.text,
                description: nullIfBlank(_description.text),
                awardsPoints: _awardsPoints,
                isDefault: _isDefault)));
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
    final editable = _isEdit
        ? ModuleAccess.canUpdateCourses(t)
        : ModuleAccess.canCreateCourses(t);
    return ModuleScaffold(
      title: _isEdit ? context.l10n.editCourse : context.l10n.newCourse,
      body: !editable
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                ModuleFormSection(
                  title: context.l10n.courseDetails,
                  icon: Icons.menu_book_rounded,
                  children: [
                    moduleTextField(
                      controller: _name,
                      label: context.l10n.courseName,
                      required: true,
                    ),
                    if (_loadingYears)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: LinearProgressIndicator(),
                      )
                    else
                      _yearDropdown(),
                    moduleDateField(
                      context: context,
                      controller: _startsOn,
                      label: context.l10n.startDate,
                      required: true,
                    ),
                    moduleDateField(
                      context: context,
                      controller: _endsOn,
                      label: context.l10n.endDate,
                      required: true,
                    ),
                  ],
                ),
                ModuleFormSection(
                  title: context.l10n.courseSettings,
                  icon: Icons.tune_rounded,
                  children: [
                    moduleTextField(
                      controller: _description,
                      label: context.l10n.description,
                      maxLines: 3,
                    ),
                    moduleSwitch(
                      context,
                      label: context.l10n.awardsPoints,
                      value: _awardsPoints,
                      onChanged: (v) => setState(() => _awardsPoints = v),
                    ),
                    moduleSwitch(
                      context,
                      label: context.l10n.defaultCourse,
                      subtitle: context.l10n.usedAutomaticallyInScreensThat,
                      value: _isDefault,
                      onChanged: (v) => setState(() => _isDefault = v),
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

  Widget _yearDropdown() {
    final selected =
        _years.any((y) => y.id == _academicYearId) ? _academicYearId : null;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<int>(
        initialValue: selected,
        isExpanded: true,
        decoration:
            InputDecoration(labelText: L10nGateway.current.academicYear),
        items: [
          for (final year in _years)
            DropdownMenuItem(
              value: year.id,
              child: Text(
                year.isActive
                    ? year.name
                    : '${year.name} (${L10nGateway.current.inactive2})',
              ),
            ),
        ],
        onChanged: (value) => setState(() => _academicYearId = value),
        validator: (value) =>
            value == null ? L10nGateway.current.chooseAnAcademicYear : null,
      ),
    );
  }
}
