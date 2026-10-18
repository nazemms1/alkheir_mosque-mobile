import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'module_widgets.dart';

/// حقول نماذج الوحدات المشتركة (نص، هاتف، تاريخ، مفتاح تشغيل).

/// يُعيد null للنص الفارغ — الخادم يتوقع null للحقول الاختيارية.
String? nullIfBlank(String text) {
  final value = text.trim();
  return value.isEmpty ? null : value;
}

Widget moduleTextField({
  required TextEditingController controller,
  required String label,
  bool required = false,
  TextInputType? keyboard,
  int maxLines = 1,
  int? maxLength,
  String? helper,
  bool obscure = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboard,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscure,
      style: appTextStyle(),
      decoration: InputDecoration(labelText: label, helperText: helper),
      validator: required
          ? (value) => (value == null || value.trim().isEmpty)
              ? tr('هذا الحقل مطلوب')
              : null
          : null,
    ),
  );
}

Widget moduleDateField({
  required BuildContext context,
  required TextEditingController controller,
  required String label,
  bool required = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextFormField(
      controller: controller,
      readOnly: true,
      style: appTextStyle(),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today_rounded, size: 18),
      ),
      onTap: () async {
        final picked = await pickIsoDate(context, current: controller.text);
        if (picked != null) controller.text = picked;
      },
      validator: required
          ? (value) =>
              (value == null || value.isEmpty) ? tr('اختر التاريخ') : null
          : null,
    ),
  );
}

Widget moduleSwitch({
  required String label,
  required bool value,
  required ValueChanged<bool> onChanged,
  String? subtitle,
}) {
  return SwitchListTile.adaptive(
    contentPadding: EdgeInsets.zero,
    activeTrackColor: AppColors.primaryLight,
    title: Text(label,
        style: appTextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    subtitle: subtitle == null
        ? null
        : Text(subtitle, style: appTextStyle(fontSize: 12)),
    value: value,
    onChanged: onChanged,
  );
}

/// زر الحفظ الرئيسي مع حالة الإرسال.
class ModuleSaveButton extends StatelessWidget {
  final bool saving;
  final VoidCallback onPressed;
  final String label;

  const ModuleSaveButton({
    super.key,
    required this.saving,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: saving ? null : onPressed,
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: AppColors.primary,
      ),
      child: saving
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(label,
              style: appTextStyle(
                  fontWeight: FontWeight.w700, color: Colors.white)),
    );
  }
}

/// عمود نموذج صفحة كاملة مع حواف مناسبة للجوال.
class ModuleFormPage extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> children;

  const ModuleFormPage({
    super.key,
    required this.formKey,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
