import 'package:flutter/material.dart';
import 'package:todobooks/views/home.dart';
import 'package:todobooks/views/login.dart';
import 'package:todobooks/views/splash.dart';

enum RouteEnum {
  splash,
  login,
  main,
  active,
  done,
}

extension RouteEnumExtention on RouteEnum {
  String get path {
    switch (this) {
      case RouteEnum.splash:
        return '/';
      case RouteEnum.login:
        return '/login';
      case RouteEnum.main:
        return '/main';
      case RouteEnum.active:
        return '/task/active';
      case RouteEnum.done:
        return '/task/done';
    }
  }

  Widget page(settings) {
    switch (this) {
      case RouteEnum.splash:
        return const SplashPage();
      case RouteEnum.login:
        return const LoginPage();
      // case RouteEnum.login:
      //   return const HomePage(); // thought so. Doesn't work since there's no token issued yet.
      case RouteEnum.main:
        return const HomePage();
      case RouteEnum.active:
        return const HomePage();
      case RouteEnum.done:
        return const HomePage();
    }
  }

  RouteTransitionEnum get transition {
    switch (this) {
      case RouteEnum.splash:
        return RouteTransitionEnum.fadeOut;
      case RouteEnum.login:
        return RouteTransitionEnum.fadeOut;
      case RouteEnum.main:
        return RouteTransitionEnum.fadeOut;
      default:
        return RouteTransitionEnum.slideRight;
    }
  }

  Route packRoute(RouteSettings settings) => transition.pack(page(settings));
}

extension RouteEnumParser on String? {
  RouteEnum get parse {
    if (this == null) {
      return RouteEnum.splash;
    }
    return RouteEnum.values.firstWhere(
      (e) => this == e.path,
      orElse: () => RouteEnum.splash,
    );
  }
}

enum RouteTransitionEnum { slideRight, fadeOut }

extension RouteTransitionEnumExtension on RouteTransitionEnum {
  Route pack(Widget page) {
    switch (this) {
      case RouteTransitionEnum.slideRight:
        return SlideRightRoute(page: page);
      case RouteTransitionEnum.fadeOut:
        return FadeOutRoute(page: page);
    }
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          settings: RouteSettings(
            name: page.toString(),
          ),
        );
}

class FadeOutRoute extends PageRouteBuilder {
  final Widget page;
  FadeOutRoute({
    required this.page,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          settings: RouteSettings(
            name: page.toString(),
          ),
        );
}

Route mainRoutes(RouteSettings settings) {
  RouteEnum route = RouteEnumParser(settings.name).parse;
  debugPrint(route.path);
  return route.packRoute(settings);
}
