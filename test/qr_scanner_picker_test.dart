import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/features/admin/presentation/screens/qr_scanner_screen.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';

AuthToken _account(List<String> permissions) {
  return AuthToken(
    token: 'test-token',
    tokenType: 'Bearer',
    user: AuthUser(
      id: 1,
      name: 'مستخدم',
      username: 'user',
      roles: const ['admin'],
      permissions: permissions,
    ),
  );
}

Widget _app(AuthToken token) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    locale: AppLanguage.current,
    supportedLocales: AppLanguage.supported,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: QrScannerScreen(token: token, groupName: 'حلقة الفجر'),
  );
}

void _useSmallPhone(WidgetTester tester) {
  tester.view.physicalSize = const Size(320, 640);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

/// شاشة اختيار نوع الحضور (قبل تشغيل الكاميرا) — تُختبر بعرض الهاتف الصغير.
void main() {
  tearDown(() => AppLanguage.current = AppLanguage.arabic);

  for (final lang in AppLanguage.supported) {
    testWidgets(
      'QR attendance picker lays out without overflow (${lang.languageCode} / 320px)',
      (tester) async {
        _useSmallPhone(tester);
        AppLanguage.current = lang;

        await tester.pumpWidget(
          _app(_account([Permissions.attendanceStudentTake])),
        );
        await tester.pump();

        expect(tester.takeException(), isNull);
        expect(find.text(tr('اختر نوع الحضور قبل بدء المسح')), findsOneWidget);
        for (final label in ['حضور', 'غياب', 'تأخر', 'مغادرة مبكرة']) {
          expect(find.text(tr(label)), findsOneWidget);
        }
      },
    );
  }

  testWidgets('QR scanner refuses accounts without attendance permission',
      (tester) async {
    _useSmallPhone(tester);

    await tester.pumpWidget(_app(_account([Permissions.groupsView])));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.text(tr('ليس لديك صلاحية لتسجيل الحضور')), findsOneWidget);
    expect(find.text(tr('اختر نوع الحضور قبل بدء المسح')), findsNothing);
  });
}
