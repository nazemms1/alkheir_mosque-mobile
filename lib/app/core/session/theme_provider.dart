import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../i18n/app_language.dart';

/// نسخة SharedPreferences الجاهزة — تُهيّأ في `main()` عبر override
/// قبل تشغيل التطبيق حتى تكون متاحة بشكل متزامن لبقية المزوّدات.
///
/// ملاحظة: المظهر (فاتح/داكن) واللغة يُداران من `themeProvider` و`languageProvider`
/// في `di/di_locator.dart` — هما المصدر الوحيد الذي يقرؤه `MyApp`.
final sharedPrefsProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(
      tr('يُهيّأ في main() عبر ProviderScope.overrides')),
);
