import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../di/di_locator.dart';
import '../i18n/app_language.dart';

export '../../../di/di_locator.dart' show themeProvider, ThemeModeNotifier;

/// نسخة SharedPreferences الجاهزة — تُهيّأ في `main()` عبر override
/// قبل تشغيل التطبيق حتى تكون متاحة بشكل متزامن لبقية المزوّدات.
final sharedPrefsProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(
      tr('يُهيّأ في main() عبر ProviderScope.overrides')),
);

/// وضع المظهر (فاتح/داكن) — يُحفظ في التخزين المحلي ويُسترجع عند الإقلاع.
/// مواءم مع [themeProvider] في `di_locator.dart`.
final themeModeProvider = themeProvider;
