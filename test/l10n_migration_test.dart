import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/l10n/app_localizations.dart';

/// Every ARB string must read exactly what tr()/trf() returned for it.
void main() {
  final en = jsonDecode(File('lib/app/core/l10n/app_en.arb').readAsStringSync())
      as Map<String, dynamic>;
  final ar = jsonDecode(File('lib/app/core/l10n/app_ar.arb').readAsStringSync())
      as Map<String, dynamic>;

  // Keys that predate the migration (never tr() strings).
  const original = {
    'appName',
    'errorsConnection',
    'errorsServer',
    'errorsUnknown',
    'errorsNotFound',
    'errorsUnauthorized',
    'errorsForbidden',
    'errorsTimeout',
    'errorsBadRequest',
    'maintenanceRetry',
    'generalCancel',
    'generalSave',
  };

  tearDown(() => AppLanguage.current = AppLanguage.arabic);

  test('arb English equals tr() in English for every migrated string', () {
    AppLanguage.current = AppLanguage.english;
    var checked = 0;
    for (final key
        in ar.keys.where((k) => !k.startsWith('@') && !original.contains(k))) {
      final arabic = (ar[key] as String)
          .replaceAllMapped(RegExp(r'\{p(\d+)\}'), (m) => '{${m.group(1)}}');
      final translated = tr(arabic);
      // tr() had no English for it: the ARB holds the first translation.
      if (translated == arabic) continue;
      final expected = translated.replaceAllMapped(
          RegExp(r'\{(\d+)\}'), (m) => '{p${m.group(1)}}');
      expect(en[key], expected, reason: key);
      checked++;
    }
    expect(checked, greaterThan(900));
  });

  test('every English string is translated', () {
    final arabic = RegExp('[\u0600-\u06FF]');
    final untranslated = [
      for (final e in en.entries)
        if (!e.key.startsWith('@') && arabic.hasMatch('${e.value}')) e.key,
    ];
    expect(untranslated, isEmpty);
  });

  test('generated getters format placeholders like trf()', () {
    final l10nEn = lookupAppLocalizations(const Locale('en'));
    final l10nAr = lookupAppLocalizations(const Locale('ar'));

    AppLanguage.current = AppLanguage.english;
    expect(l10nEn.noteS(3), trf('{0} ملاحظة', [3]));
    AppLanguage.current = AppLanguage.arabic;
    expect(l10nAr.noteS(3), trf('{0} ملاحظة', [3]));
  });
}
