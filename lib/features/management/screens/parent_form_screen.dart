import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/management_model.dart';
import '../../../data/services/management_service.dart';
import '../widgets/module_form_fields.dart';
import '../widgets/module_widgets.dart';

/// نموذج إنشاء ولي أمر أو تعديله. الخادم يتحقق من التكرار ويطابق الهواتف.
class ParentFormScreen extends StatefulWidget {
  final AuthToken token;
  final ParentItem? parent;

  const ParentFormScreen({super.key, required this.token, this.parent});

  @override
  State<ParentFormScreen> createState() => _ParentFormScreenState();
}

class _ParentFormScreenState extends State<ParentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = ManagementService();
  final _fatherName = TextEditingController();
  final _fatherWork = TextEditingController();
  final _fatherPhone = TextEditingController();
  final _motherName = TextEditingController();
  final _motherPhone = TextEditingController();
  final _homePhone = TextEditingController();
  final _address = TextEditingController();
  final _notes = TextEditingController();
  bool _isActive = true;
  bool _saving = false;

  bool get _isEdit => widget.parent != null;

  @override
  void initState() {
    super.initState();
    final p = widget.parent;
    if (p == null) return;
    _fatherName.text = p.fatherName;
    _fatherWork.text = p.fatherWork ?? '';
    _fatherPhone.text = p.fatherPhone ?? '';
    _motherName.text = p.motherName ?? '';
    _motherPhone.text = p.motherPhone ?? '';
    _homePhone.text = p.homePhone ?? '';
    _address.text = p.address ?? '';
    _notes.text = p.notes ?? '';
    _isActive = p.isActive;
  }

  @override
  void dispose() {
    for (final c in [
      _fatherName,
      _fatherWork,
      _fatherPhone,
      _motherName,
      _motherPhone,
      _homePhone,
      _address,
      _notes,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      await _service.saveParent(widget.parent?.id, {
        'father_name': _fatherName.text.trim(),
        'father_work': nullIfBlank(_fatherWork.text),
        'father_phone': nullIfBlank(_fatherPhone.text),
        'mother_name': nullIfBlank(_motherName.text),
        'mother_phone': nullIfBlank(_motherPhone.text),
        'home_phone': nullIfBlank(_homePhone.text),
        'address': nullIfBlank(_address.text),
        'notes': nullIfBlank(_notes.text),
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
    final t = widget.token;
    final allowed = _isEdit
        ? ModuleAccess.canUpdateParents(t)
        : ModuleAccess.canCreateParents(t);
    return ModuleScaffold(
      title: _isEdit ? tr('تعديل ولي الأمر') : tr('ولي أمر جديد'),
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                moduleTextField(
                  controller: _fatherName,
                  label: tr('اسم الأب'),
                  required: true,
                ),
                moduleTextField(
                  controller: _fatherWork,
                  label: tr('جهة العمل'),
                ),
                moduleTextField(
                  controller: _fatherPhone,
                  label: tr('هاتف الأب'),
                  keyboard: TextInputType.phone,
                ),
                moduleTextField(
                  controller: _motherName,
                  label: tr('اسم الأم'),
                ),
                moduleTextField(
                  controller: _motherPhone,
                  label: tr('هاتف الأم'),
                  keyboard: TextInputType.phone,
                ),
                moduleTextField(
                  controller: _homePhone,
                  label: tr('هاتف المنزل'),
                  keyboard: TextInputType.phone,
                ),
                moduleTextField(
                  controller: _address,
                  label: tr('العنوان'),
                ),
                moduleTextField(
                  controller: _notes,
                  label: tr('ملاحظات'),
                  maxLines: 3,
                ),
                moduleSwitch(
                  label: tr('الحساب نشط'),
                  value: _isActive,
                  onChanged: (v) => setState(() => _isActive = v),
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
