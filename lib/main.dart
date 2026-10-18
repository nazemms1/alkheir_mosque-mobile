import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/core/config/flavor_config.dart';
import 'app/core/config/server_config.dart';
import 'app/core/session/theme_provider.dart';
import 'di/di_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  ServerConfig.load(prefs);

  // Initialize Flavor Configuration
  FlavorConfig.initialize(
    flavor: AppFlavor.dev,
    appName: 'مسجد الخير',
    baseUrl: 'https://www.alkheir-mosque.com',
    apiPrefix: '/api/v1',
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        sharedPrefsProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}
