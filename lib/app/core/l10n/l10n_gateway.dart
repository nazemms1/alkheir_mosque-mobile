import 'package:flutter/widgets.dart';
import 'app_localizations.dart';

export 'app_localizations.dart';

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
    return lookupAppLocalizations(const Locale('ar'));
  }
}
