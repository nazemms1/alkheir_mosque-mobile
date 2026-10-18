import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/i18n/en_dictionary.dart';

void main() {
  tearDown(() => AppLanguage.current = AppLanguage.arabic);

  test('tr returns the Arabic text in Arabic mode', () {
    AppLanguage.current = AppLanguage.arabic;
    expect(tr('نشط'), 'نشط');
  });

  test('tr returns the English entry in English mode', () {
    AppLanguage.current = AppLanguage.english;
    expect(tr('نشط'), 'Active');
  });

  test('tr falls back to Arabic when no English entry exists', () {
    AppLanguage.current = AppLanguage.english;
    expect(tr('نص غير موجود في القاموس'), 'نص غير موجود في القاموس');
  });

  test('trf fills numbered placeholders in both languages', () {
    AppLanguage.current = AppLanguage.english;
    expect(trf('منذ {0} دقيقة', [5]), '5 min ago');
    AppLanguage.current = AppLanguage.arabic;
    expect(trf('منذ {0} دقيقة', [5]), 'منذ 5 دقيقة');
  });

  test('every tr() literal in lib/ has an English entry', () {
    // يلتقط كل نص يُمرَّر إلى tr('...') أو trf('...', ...) في الكود.
    final literal = RegExp(r"trf?\(\s*'((?:\\.|[^'\\])*)'");
    final missing = <String>{};

    final files = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))
        .where((f) => !f.path.contains('i18n'));

    for (final file in files) {
      for (final match in literal.allMatches(file.readAsStringSync())) {
        final raw = match.group(1)!;
        if (raw.contains(r'$')) continue;
        // النصوص داخل الكود تحوي \n كتسلسل؛ القاموس يخزّن السطر الجديد فعلياً.
        final key = raw.replaceAll(r'\n', '\n');
        if (!enDictionary.containsKey(key)) {
          missing.add('${file.path}: $raw');
        }
      }
    }

    expect(
      missing,
      isEmpty,
      reason: 'Add these Arabic keys to lib/app/core/i18n/en_dictionary.dart',
    );
  });
}
