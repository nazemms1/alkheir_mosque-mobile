import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/ui/themes/dark.dart';
import 'package:alkheir_mosque/ui/themes/light.dart';

/// نموذج يطابق شكل نماذج الوحدة: أقسام، حقول تاريخ ومفتاح، وزر حفظ.
Widget _form(ThemeData theme) {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final notes = TextEditingController();
  return MaterialApp(
    theme: theme,
    debugShowCheckedModeBanner: false,
    locale: AppLanguage.current,
    supportedLocales: AppLanguage.supported,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: Scaffold(
      appBar: AdminAppBar(title: tr('تعديل المعلم')),
      body: ModuleFormPage(
        formKey: formKey,
        children: [
          ModuleFormSection(
            title: tr('بيانات المعلم'),
            icon: Icons.school_rounded,
            children: [
              moduleTextField(
                controller: name,
                label: tr('الاسم الأول'),
                required: true,
              ),
              Builder(
                builder: (context) => moduleDateField(
                  context: context,
                  controller: notes,
                  label: tr('تاريخ التعيين'),
                ),
              ),
            ],
          ),
          ModuleFormSection(
            title: tr('حساب الدخول'),
            icon: Icons.lock_person_rounded,
            children: [
              moduleTextField(
                controller: TextEditingController(),
                label: tr('كلمة المرور الجديدة'),
                helper: tr('8 أحرف على الأقل، أو اتركها فارغة'),
                obscure: true,
              ),
              moduleSwitch(
                label: tr('الحساب نشط'),
                value: true,
                onChanged: (_) {},
              ),
            ],
          ),
          ModuleSaveButton(saving: false, onPressed: () {}, label: tr('حفظ')),
        ],
      ),
    ),
  );
}

void main() {
  tearDown(() => AppLanguage.current = AppLanguage.arabic);

  for (final theme in [lightTheme, darkTheme]) {
    for (final lang in AppLanguage.supported) {
      testWidgets(
        'form page lays out without overflow: ${theme.brightness.name} / '
        '${lang.languageCode} / 320px',
        (tester) async {
          tester.view.physicalSize = const Size(320, 640);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(tester.view.resetPhysicalSize);
          addTearDown(tester.view.resetDevicePixelRatio);

          AppLanguage.current = lang;
          await tester.pumpWidget(_form(theme));
          await tester.pump();

          expect(tester.takeException(), isNull);
          expect(find.text(tr('بيانات المعلم')), findsOneWidget);
          expect(find.text(tr('حفظ')), findsOneWidget);
        },
      );
    }
  }
}
