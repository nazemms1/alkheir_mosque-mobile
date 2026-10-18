
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/session/theme_provider.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/presentation/screens/login_screen.dart';

void main() {
  setUp(() => AppLanguage.current = AppLanguage.arabic);

  testWidgets('login screen renders with bilingual shell', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
        child: MaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          locale: AppLanguage.english,
          supportedLocales: AppLanguage.supported,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const LoginScreen(),
        ),
      ),
    );
    // نترك مؤقتات الرسوم المتحركة تنتهي دون انتظار استقرار دائم.
    await tester.pump(const Duration(seconds: 2));

    expect(find.byType(LoginScreen), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
