import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  final SharedPreferences _prefs;

  static const String _keyLanguageCode = 'app_language_code';
  static const String _keyThemeMode = 'app_theme_mode';
  static const String _keyOnboardingCompleted = 'app_onboarding_completed';

  SharedPrefsService(this._prefs);

  /// Language code management ('ar', 'en')
  String getLanguageCode({String defaultCode = 'ar'}) {
    return _prefs.getString(_keyLanguageCode) ?? defaultCode;
  }

  Future<bool> setLanguageCode(String languageCode) {
    return _prefs.setString(_keyLanguageCode, languageCode);
  }

  /// ThemeMode management (ThemeMode.system, ThemeMode.light, ThemeMode.dark)
  ThemeMode getThemeMode() {
    final mode = _prefs.getString(_keyThemeMode);
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  Future<bool> setThemeMode(ThemeMode mode) {
    return _prefs.setString(_keyThemeMode, mode.name);
  }

  /// Onboarding flag
  bool isOnboardingCompleted() {
    return _prefs.getBool(_keyOnboardingCompleted) ?? false;
  }

  Future<bool> setOnboardingCompleted(bool completed) {
    return _prefs.setBool(_keyOnboardingCompleted, completed);
  }

  /// Generic helpers
  String? getString(String key) => _prefs.getString(key);
  Future<bool> setString(String key, String value) => _prefs.setString(key, value);

  bool? getBool(String key) => _prefs.getBool(key);
  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);

  int? getInt(String key) => _prefs.getInt(key);
  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);

  Future<bool> remove(String key) => _prefs.remove(key);
  Future<bool> clear() => _prefs.clear();
}
