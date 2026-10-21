import 'package:flutter/material.dart';

import '../../../di/di_locator.dart';
import 'en_dictionary.dart';

export '../../../di/di_locator.dart' show languageProvider, LanguageNotifier;

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

/// مزوّد اللغة المتوافق مع [languageProvider] في `di_locator.dart`
final localeProvider = languageProvider;
