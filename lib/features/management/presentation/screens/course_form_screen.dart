import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import '../widgets/module_form_fields.dart';
import '../widgets/module_widgets.dart';

/// نموذج إنشاء كورس أو تعديله. السنة الدراسية تُختار من السنوات النشطة فقط،
/// ويضاف غير النشط منها عند التعديل فقط (كما في الموقع).
class CourseFormScreen extends StatefulWidget {
  final AuthToken token;
  final CourseItem? course;

  const CourseFormScreen({super.key, required this.token, this.course});

  @override
  State<CourseFormScreen> createState() => _CourseFormScreenState();
}

class _CourseFormScreenState extends State<CourseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = ManagementRepositoryImpl();
  final _name = TextEditingController();
  final _startsOn = TextEditingController();
  final _endsOn = TextEditingController();
  final _description = TextEditingController();

  List<RefItem> _years = const [];
  bool _loadingYears = true;
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
    _loadYears();
  }

  @override
  void dispose() {
    for (final c in [_name, _startsOn, _endsOn, _description]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _loadYears() async {
    List<RefItem> years = const [];
    try {
      years = await _service.reference(
        'academic-years',
        includeInactive: _isEdit,
      );
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _years = years;
      _loadingYears = false;
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_endsOn.text.compareTo(_startsOn.text) < 0) {
      showModuleSnack(
        context,
        tr('تاريخ النهاية يجب أن يكون بعد تاريخ البداية'),
        error: true,
      );
      return;
    }
    if (_academicYearId == null) {
      showModuleSnack(context, tr('اختر السنة الدراسية'), error: true);
      return;
    }
    setState(() => _saving = true);
    try {
      await _service.saveCourse(widget.course?.id, {
        'name': _name.text.trim(),
        'academic_year_id': _academicYearId,
        'starts_on': _startsOn.text,
        'ends_on': _endsOn.text,
        'description': nullIfBlank(_description.text),
        'awards_points': _awardsPoints,
        'is_default': _isDefault,
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
    final editable = _isEdit
        ? ModuleAccess.canUpdateCourses(t)
        : ModuleAccess.canCreateCourses(t);
    return ModuleScaffold(
      title: _isEdit ? tr('تعديل الكورس') : tr('كورس جديد'),
      body: !editable
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                moduleTextField(
                  controller: _name,
                  label: tr('اسم الكورس'),
                  required: true,
                ),
                if (_loadingYears)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: LinearProgressIndicator(),
                  )
                else
                  _yearDropdown(),
                moduleDateField(
                  context: context,
                  controller: _startsOn,
                  label: tr('تاريخ البداية'),
                  required: true,
                ),
                moduleDateField(
                  context: context,
                  controller: _endsOn,
                  label: tr('تاريخ النهاية'),
                  required: true,
                ),
                moduleTextField(
                  controller: _description,
                  label: tr('الوصف'),
                  maxLines: 3,
                ),
                moduleSwitch(
                  label: tr('يمنح نقاطاً'),
                  value: _awardsPoints,
                  onChanged: (v) => setState(() => _awardsPoints = v),
                ),
                moduleSwitch(
                  label: tr('الكورس الافتراضي'),
                  subtitle:
                      tr('يُستخدم تلقائياً في الشاشات التي لا تحدد كورساً'),
                  value: _isDefault,
                  onChanged: (v) => setState(() => _isDefault = v),
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

  Widget _yearDropdown() {
    final selected =
        _years.any((y) => y.id == _academicYearId) ? _academicYearId : null;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<int>(
        initialValue: selected,
        isExpanded: true,
        decoration: InputDecoration(labelText: tr('السنة الدراسية')),
        items: [
          for (final year in _years)
            DropdownMenuItem(
              value: year.id,
              child: Text(
                year.isActive ? year.name : '${year.name} (${tr('غير نشطة')})',
              ),
            ),
        ],
        onChanged: (value) => setState(() => _academicYearId = value),
        validator: (value) => value == null ? tr('اختر السنة الدراسية') : null,
      ),
    );
  }
}
