import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../di/di_locator.dart';
import '../ui/themes/dark.dart';
import '../ui/themes/light.dart';
import 'core/config/flavor_config.dart';
import 'core/l10n/l10n_gateway.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(languageProvider);
    final router = ref.watch(appRouterProvider);
    final navService = ref.watch(navigationServiceProvider);

    return MaterialApp.router(
      title: FlavorConfig.isInitialized
          ? FlavorConfig.instance.appName
          : 'Alkheir Mosque',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
      scaffoldMessengerKey: navService.rootScaffoldMessengerKey,
      builder: (context, child) {
        final l10n = AppLocalizations.of(context);
        if (l10n != null) {
          L10nGateway.update(l10n);
        }
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
