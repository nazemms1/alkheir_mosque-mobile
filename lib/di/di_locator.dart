import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/core/http/dio_client.dart';
import '../app/core/i18n/app_language.dart';
import '../app/core/services/package_info_service.dart';
import '../app/core/services/secure_storage_service.dart';
import '../app/core/services/shared_prefs_service.dart';
import '../app/core/services/url_launcher_service.dart';
import '../ui/app_routes.dart';

/// SharedPreferences raw instance provider (must be overridden in main)
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden in ProviderScope');
});

/// SharedPrefsService provider
final sharedPrefsServiceProvider = Provider<SharedPrefsService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPrefsService(prefs);
});

/// SecureStorageService provider
final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});

/// DioClient provider
final dioClientProvider = Provider<DioClient>((ref) {
  final secureStorage = ref.watch(secureStorageServiceProvider);
  final sharedPrefs = ref.watch(sharedPrefsServiceProvider);
  return DioClient(
    secureStorageService: secureStorage,
    sharedPrefsService: sharedPrefs,
  );
});

/// Dio instance provider (for Retrofit and raw requests)
final dioProvider = Provider<Dio>((ref) {
  return ref.watch(dioClientProvider).dio;
});

/// NavigationService provider
final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService();
});

/// GoRouter provider
final appRouterProvider = Provider<GoRouter>((ref) {
  final navService = ref.watch(navigationServiceProvider);
  return AppRoutes.buildRouter(navService.navigatorKey);
});

/// UrlLauncherService provider
final urlLauncherServiceProvider = Provider<UrlLauncherService>((ref) {
  return UrlLauncherService();
});

/// PackageInfoService provider (nullable or overridden in main)
final packageInfoServiceProvider = Provider<PackageInfoService?>((ref) {
  return null;
});

/// ThemeMode Notifier
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final SharedPrefsService _prefs;

  ThemeModeNotifier(this._prefs) : super(_prefs.getThemeMode());

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    await _prefs.setThemeMode(mode);
  }

  Future<void> toggleTheme() async {
    final next = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(next);
  }
}

final themeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final prefs = ref.watch(sharedPrefsServiceProvider);
  return ThemeModeNotifier(prefs);
});

/// Language Locale Notifier
class LanguageNotifier extends StateNotifier<Locale> {
  final SharedPrefsService _prefs;

  LanguageNotifier(this._prefs)
      : super(Locale(_prefs.getLanguageCode(defaultCode: 'ar'))) {
    AppLanguage.current = state;
  }

  /// يحدّث اللغة في MaterialApp (الاتجاه والتوطين) وفي دالة `tr()` معاً،
  /// ثم يحفظ الاختيار.
  Future<void> setLanguage(String languageCode) async {
    state = Locale(languageCode);
    AppLanguage.current = state;
    await _prefs.setLanguageCode(languageCode);
  }

  Future<void> toggleLanguage() async {
    final newCode = state.languageCode == 'ar' ? 'en' : 'ar';
    await setLanguage(newCode);
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  final prefs = ref.watch(sharedPrefsServiceProvider);
  return LanguageNotifier(prefs);
});
