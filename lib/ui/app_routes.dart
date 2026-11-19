import 'package:alkheir_mosque/ui/themes/font_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/presentation/screens/login_screen.dart';
import 'package:alkheir_mosque/features/splash/presentation/screens/splash_screen.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey;

  NavigationService({
    GlobalKey<NavigatorState>? navKey,
    GlobalKey<ScaffoldMessengerState>? messengerKey,
  })  : navigatorKey = navKey ?? GlobalKey<NavigatorState>(),
        rootScaffoldMessengerKey = messengerKey ?? GlobalKey<ScaffoldMessengerState>();

  BuildContext? get currentContext => navigatorKey.currentContext;

  String? get currentRoute {
    final context = navigatorKey.currentContext;
    if (context != null) {
      try {
        return GoRouterState.of(context).uri.toString();
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  void go(String location, {Object? extra}) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      context.go(location, extra: extra);
    }
  }

  Future<T?> push<T>(String location, {Object? extra}) async {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return context.push<T>(location, extra: extra);
    }
    return null;
  }

  void replace(String location, {Object? extra}) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      context.replace(location, extra: extra);
    }
  }

  void pop<T>([T? result]) {
    final context = navigatorKey.currentContext;
    if (context != null && context.canPop()) {
      context.pop<T>(result);
    }
  }

  void showSnackBar(
    String message, {
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red.shade700 : null,
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

abstract final class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';

  static GoRouter buildRouter(GlobalKey<NavigatorState> navigatorKey) {
    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: splash,
      debugLogDiagnostics: false,
      routes: <RouteBase>[
        GoRoute(
          path: splash,
          name: 'splash',
          builder: (context, state) => const SplashScreen(),
        ),
        // /home يمرّ عبر شاشة البداية لأنها التي تحدد الجلسة والدور والشاشة المناسبة.
        GoRoute(
          path: home,
          name: 'home',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: login,
          name: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: AppColors.error),
              const SizedBox(height: 16),
              Text(
                '${tr('الصفحة غير موجودة')}: ${state.uri}',
                textAlign: TextAlign.center,
                style: appTextStyle(fontSize: FontSize.title, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.go(splash),
                child: Text(tr('العودة للرئيسية')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
