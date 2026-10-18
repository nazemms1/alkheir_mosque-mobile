import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        GoRoute(
          path: home,
          name: 'home',
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Home Screen')),
          ),
        ),
        GoRoute(
          path: login,
          name: 'login',
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Login Screen')),
          ),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Route Not Found: ${state.uri}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go(splash),
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
