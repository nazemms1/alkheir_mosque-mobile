import 'package:flutter/widgets.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/l10n/app_localizations.dart';

export 'package:alkheir_mosque/app/core/l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

class L10nGateway {
  static AppLocalizations? _current;

  static void update(AppLocalizations l10n) {
    _current = l10n;
  }

  static AppLocalizations get current {
    if (_current != null) {
      return _current!;
    }
    // Before the first frame: follow the saved language like tr() did.
    return lookupAppLocalizations(AppLanguage.current);
  }
}
