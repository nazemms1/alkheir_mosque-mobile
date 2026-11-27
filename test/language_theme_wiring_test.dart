import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/di/di_locator.dart';

/// يتحقق من أن تبديل اللغة والمظهر يصل إلى MaterialApp (`languageProvider` / `themeProvider`)
/// وإلى دالة tr() معاً، وأنهما يُحفظان ويُستعادان عند الإقلاع.
void main() {
  late SharedPreferences prefs;

  ProviderContainer newContainer() => ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  });

  tearDown(() => AppLanguage.current = AppLanguage.arabic);

  test('language toggle updates the locale and tr() together', () async {
    final container = newContainer();
    addTearDown(container.dispose);

    expect(container.read(languageProvider).languageCode, 'ar');
    expect(AppLanguage.isArabic, isTrue);

    await container.read(languageProvider.notifier).toggleLanguage();

    expect(container.read(languageProvider).languageCode, 'en');
    expect(AppLanguage.isArabic, isFalse);
    expect(tr('نشط'), 'Active');
    expect(AppLanguage.intlCode, 'en');

    await container.read(languageProvider.notifier).toggleLanguage();

    expect(AppLanguage.isArabic, isTrue);
    expect(tr('نشط'), 'نشط');
    expect(AppLanguage.intlCode, 'ar');
  });

  test('chosen language is restored on the next launch', () async {
    final first = newContainer();
    addTearDown(first.dispose);
    await first.read(languageProvider.notifier).setLanguage('en');

    final relaunched = newContainer();
    addTearDown(relaunched.dispose);

    expect(relaunched.read(languageProvider).languageCode, 'en');
    expect(AppLanguage.isArabic, isFalse);
  });

  test('theme toggle switches ThemeMode and persists it', () async {
    final container = newContainer();
    addTearDown(container.dispose);

    expect(container.read(themeProvider), ThemeMode.system);

    await container.read(themeProvider.notifier).toggleTheme();

    expect(container.read(themeProvider), ThemeMode.dark);
    expect(prefs.getString('app_theme_mode'), 'dark');

    final relaunched = newContainer();
    addTearDown(relaunched.dispose);
    expect(relaunched.read(themeProvider), ThemeMode.dark);
  });
}
