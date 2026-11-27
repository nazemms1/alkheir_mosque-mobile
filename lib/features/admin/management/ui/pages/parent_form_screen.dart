import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/admin/management/data/params/management_params.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';

/// نموذج إنشاء ولي أمر أو تعديله. الخادم يتحقق من التكرار ويطابق الهواتف.
///
/// عند التعديل يُجلب السجل الحالي من الخادم قبل عرض الحقول، فلا تُعدَّل بيانات
/// قديمة من القائمة. وإن تعذّر الجلب لا يُعرض نموذج فارغ ولا يُسمح بالحفظ.
class ParentFormScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final ParentItem? parent;
  final String? initialFatherName;

  const ParentFormScreen({
    super.key,
    required this.token,
    this.parent,
    this.initialFatherName,
  });

  @override
  ConsumerState<ParentFormScreen> createState() => _ParentFormScreenState();
}

class _ParentFormScreenState extends ConsumerState<ParentFormScreen> {
  final _formKey = GlobalKey<FormState>();
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
  late final _currentProvider = screenDataProvider<ParentItem?>(() async =>
      widget.parent == null
          ? null
          : ref
              .read(managementActionsControllerProvider.notifier)
              .query((r) => r.parent(widget.parent!.id)));
  bool get _loading => ref.watch(_currentProvider).isLoading;
  String? get _loadError {
    final state = ref.watch(_currentProvider);
    return state.hasError ? errorText(state.error!) : null;
  }

  bool get _isEdit => widget.parent != null;

  @override
  void initState() {
    super.initState();
    if (widget.parent == null) {
      final initial = widget.initialFatherName?.trim();
      if (initial != null && initial.isNotEmpty) _fatherName.text = initial;
      return;
    }
    // التعبئة من الخادم مرة عند وصول البيانات.
    ref.listenManual(_currentProvider, (_, next) {
      if (next case AsyncData(:final value?)) setState(() => _fill(value));
    }, fireImmediately: true);
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

  void _fill(ParentItem p) {
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

  void _retryLoad() => ref.invalidate(_currentProvider);

  Future<void> _save() async {
    if (!ref.read(_currentProvider).hasValue) return;
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final outcome2 = await ref
        .read(managementActionsControllerProvider.notifier)
        .run((r) => r.saveParent(
            widget.parent?.id,
            SaveParentParams(
                fatherName: _fatherName.text.trim(),
                fatherWork: nullIfBlank(_fatherWork.text),
                fatherPhone: nullIfBlank(_fatherPhone.text),
                motherName: nullIfBlank(_motherName.text),
                motherPhone: nullIfBlank(_motherPhone.text),
                homePhone: nullIfBlank(_homePhone.text),
                address: nullIfBlank(_address.text),
                notes: nullIfBlank(_notes.text),
                isActive: _isActive)));
    if (!mounted) return;
    if (outcome2.error case final error?) {
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    final savedParent = outcome2.value!;
    Navigator.pop(context, savedParent);
  }

  Widget _buildForm() {
    return ModuleFormPage(
      formKey: _formKey,
      children: [
        ModuleFormSection(
          title: L10nGateway.current.fatherDetails,
          icon: Icons.person_rounded,
          children: [
            moduleTextField(
              controller: _fatherName,
              label: L10nGateway.current.fatherName,
              required: true,
            ),
            moduleTextField(
              controller: _fatherWork,
              label: L10nGateway.current.workplace,
            ),
            moduleTextField(
              controller: _fatherPhone,
              label: L10nGateway.current.fatherSPhone,
              keyboard: TextInputType.phone,
              validator: phoneValidator,
            ),
          ],
        ),
        ModuleFormSection(
          title: L10nGateway.current.motherDetails,
          icon: Icons.face_3_rounded,
          children: [
            moduleTextField(
              controller: _motherName,
              label: L10nGateway.current.motherName,
            ),
            moduleTextField(
              controller: _motherPhone,
              label: L10nGateway.current.motherSPhone,
              keyboard: TextInputType.phone,
              validator: phoneValidator,
            ),
          ],
        ),
        ModuleFormSection(
          title: L10nGateway.current.contactAndAddress,
          icon: Icons.location_on_rounded,
          children: [
            moduleTextField(
              controller: _homePhone,
              label: L10nGateway.current.homePhone,
              keyboard: TextInputType.phone,
              validator: phoneValidator,
            ),
            moduleTextField(
              controller: _address,
              label: L10nGateway.current.address,
            ),
          ],
        ),
        ModuleFormSection(
          title: L10nGateway.current.additionalInformation,
          icon: Icons.notes_rounded,
          children: [
            moduleTextField(
              controller: _notes,
              label: L10nGateway.current.notes,
              maxLines: 3,
            ),
            moduleSwitch(
              context,
              label: L10nGateway.current.accountActive,
              value: _isActive,
              onChanged: (v) => setState(() => _isActive = v),
            ),
          ],
        ),
        ModuleSaveButton(
          saving: _saving,
          onPressed: _save,
          label: L10nGateway.current.save,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    final allowed = _isEdit
        ? ModuleAccess.canUpdateParents(t)
        : ModuleAccess.canCreateParents(t);
    return ModuleScaffold(
      title: _isEdit ? context.l10n.editParent : context.l10n.newParent,
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
                  : _buildForm(),
    );
  }
}
