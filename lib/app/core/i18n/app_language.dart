import 'package:flutter/material.dart';

import 'en_dictionary.dart';

/// اللغات المدعومة في التطبيق: العربية (الأساسية) والإنجليزية.
abstract final class AppLanguage {
  static const arabic = Locale('ar');
  static const english = Locale('en');
  static const supported = [arabic, english];

  /// اللغة الحالية — تُحدَّث من [LanguageNotifier] (di/di_locator.dart) فقط.
  static Locale current = arabic;

  static bool get isArabic => current.languageCode == 'ar';

  static TextDirection get direction =>
      isArabic ? TextDirection.rtl : TextDirection.ltr;

  /// رمز اللغة لتنسيق التواريخ والأرقام (intl): يتبع اللغة الحالية.
  static String get intlCode => isArabic ? 'ar' : 'en';
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
