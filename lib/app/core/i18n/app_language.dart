import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../session/theme_provider.dart';
import 'en_dictionary.dart';

/// اللغات المدعومة في التطبيق: العربية (الأساسية) والإنجليزية.
abstract final class AppLanguage {
  static const arabic = Locale('ar');
  static const english = Locale('en');
  static const supported = [arabic, english];

  /// اللغة الحالية — تُحدَّث من [LocaleNotifier] فقط.
  static Locale current = arabic;

  static bool get isArabic => current.languageCode == 'ar';

  static TextDirection get direction =>
      isArabic ? TextDirection.rtl : TextDirection.ltr;
}

/// ترجمة نص عربي إلى اللغة الحالية.
///
/// المفتاح هو النص العربي نفسه؛ إن لم توجد ترجمة يُعاد النص العربي كما هو.
/// لإضافة ترجمة: أضف السطر إلى [enDictionary] في `en_dictionary.dart`.
String tr(String arabic) {
  if (AppLanguage.isArabic) return arabic;
  return enDictionary[arabic] ?? arabic;
}

/// تنسيق نص عربي يحتوي على عناصر نائبة `{0}`, `{1}` …
///
/// مثال: `trf('عدد الطلاب: {0}', [count])`
String trf(String arabic, List<Object?> args) {
  var text = tr(arabic);
  for (var i = 0; i < args.length; i++) {
    text = text.replaceAll('{$i}', '${args[i] ?? ''}');
  }
  return text;
}

/// مزوّد اللغة — يحفظ الاختيار محلياً ويُعيد بناء التطبيق عند تغييرها.
class LocaleNotifier extends Notifier<Locale> {
  static const _prefsKey = 'app_language';

  @override
  Locale build() {
    final code = ref.read(sharedPrefsProvider).getString(_prefsKey);
    final locale = code == 'en' ? AppLanguage.english : AppLanguage.arabic;
    AppLanguage.current = locale;
    return locale;
  }

  Future<void> setLanguage(String languageCode) async {
    final locale =
        languageCode == 'en' ? AppLanguage.english : AppLanguage.arabic;
    AppLanguage.current = locale;
    state = locale;
    await ref
        .read(sharedPrefsProvider)
        .setString(_prefsKey, locale.languageCode);
  }

  Future<void> toggle() =>
      setLanguage(state.languageCode == 'ar' ? 'en' : 'ar');
}

final localeProvider =
    NotifierProvider<LocaleNotifier, Locale>(LocaleNotifier.new);
