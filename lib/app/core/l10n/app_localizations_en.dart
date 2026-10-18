// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Alkheir Mosque';

  @override
  String get errorsConnection =>
      'Unable to connect. Please check your internet connection.';

  @override
  String get errorsServer => 'A server error occurred. Please try again later.';

  @override
  String get errorsUnknown => 'An unexpected error occurred.';

  @override
  String get errorsNotFound => 'The requested resource was not found.';

  @override
  String get errorsUnauthorized =>
      'You are not authorized to perform this action.';

  @override
  String get errorsForbidden => 'Access is forbidden.';

  @override
  String get errorsTimeout => 'The connection timed out. Please try again.';

  @override
  String get errorsBadRequest => 'Invalid request. Please verify your input.';

  @override
  String get maintenanceRetry => 'Retry';

  @override
  String get generalCancel => 'Cancel';

  @override
  String get generalSave => 'Save';
}
