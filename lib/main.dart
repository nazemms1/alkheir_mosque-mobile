import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:alkheir_mosque/app/app.dart';
import 'package:alkheir_mosque/app/core/config/flavor_config.dart';
import 'package:alkheir_mosque/app/core/config/server_config.dart';
import 'package:alkheir_mosque/app/core/session/theme_provider.dart';
import 'package:alkheir_mosque/di/di_locator.dart';

/// يهيّئ التطبيق ويشغّله. تُستدعى من `main_dev.dart` / `main_prod.dart`
/// بعد تهيئة [FlavorConfig].
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  ServerConfig.load(prefs);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  appProviderContainer = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
      sharedPrefsProvider.overrideWithValue(prefs),
    ],
  );

  runApp(
    UncontrolledProviderScope(
      container: appProviderContainer,
      child: const MyApp(),
    ),
  );
}

/// `flutter run` بلا `-t`: نفس إعداد التطوير.
Future<void> main() async {
  configureDev();
  await bootstrap();
}

// shortcut: dev uses the production server until a staging server exists;
// change baseUrl here when one does.
void configureDev() => FlavorConfig.initialize(
      flavor: AppFlavor.dev,
      appName: 'مسجد الخير',
      baseUrl: 'https://alkheir.saas.alkheir-platform.com',
      apiPrefix: '/api/v1',
    );
