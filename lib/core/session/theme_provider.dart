import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// نسخة SharedPreferences الجاهزة — تُهيّأ في `main()` عبر override
/// قبل تشغيل التطبيق حتى تكون متاحة بشكل متزامن لبقية المزوّدات.
final sharedPrefsProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('يُهيّأ في main() عبر ProviderScope.overrides'),
);

/// وضع المظهر (فاتح/داكن) — يُحفظ في التخزين المحلي ويُسترجع عند الإقلاع.
///
/// التبديل: `ref.read(themeModeProvider.notifier).toggle();`
class ThemeModeNotifier extends Notifier<ThemeMode> {
  static const _prefsKey = 'isDarkMode';

  @override
  ThemeMode build() {
    final isDark = ref.read(sharedPrefsProvider).getBool(_prefsKey) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggle() async {
    final wasDark = state == ThemeMode.dark;
    state = wasDark ? ThemeMode.light : ThemeMode.dark;
    await ref.read(sharedPrefsProvider).setBool(_prefsKey, !wasDark);
  }
}

final themeModeProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);
