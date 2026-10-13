import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/server_config.dart';
import 'core/i18n/app_language.dart';
import 'core/session/theme_provider.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  ServerConfig.load(prefs);

  await initializeDateFormatting('ar');
  await initializeDateFormatting('en');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
      child: const AlkheirMosqueApp(),
    ),
  );
}

class AlkheirMosqueApp extends ConsumerWidget {
  const AlkheirMosqueApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);

    // تغيير اللغة يعيد بناء التطبيق كاملاً حتى تُقرأ كل النصوص من جديد.
    // الاتجاه (RTL/LTR) يأتي تلقائياً من اللغة عبر Localizations.
    return KeyedSubtree(
      key: ValueKey('app-${locale.languageCode}'),
      child: MaterialApp(
        title: tr('مسجد الخير - البوابة التعليمية'),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: mode,
        themeAnimationStyle: AnimationStyle(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
        locale: locale,
        supportedLocales: AppLanguage.supported,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const SplashScreen(),
      ),
    );
  }
}
