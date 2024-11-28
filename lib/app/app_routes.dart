import 'package:flutter/material.dart';
import 'package:nounshunt/ui/views/launcher_view.dart';
import 'package:nounshunt/ui/views/splash_view.dart';

class AppRoutes {
  static const String splashView = '/splashView';
  static const String laucherView = '/laucherView';
  static const String dashboardView = '/dashboardView';
}

class AppRouter {
  static const String initialRoute = AppRoutes.splashView;
  static PageRouteBuilder buildPageWithDefaultTransition({
    required Widget page,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return buildPageWithDefaultTransition(
          settings: settings,
          page: const SplashView(),
        );
      case AppRoutes.laucherView:
        return buildPageWithDefaultTransition(
          settings: settings,
          page: const LauncherView(),
        );

      default:
        return buildPageWithDefaultTransition(
          settings: settings,
          page: const RouteNotFoundPage(),
        );
    }
  }
}

class RouteNotFoundPage extends StatelessWidget {
  const RouteNotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Route not found'),
      ),
    );
  }
}
