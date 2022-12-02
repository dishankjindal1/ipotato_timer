import 'package:flutter/material.dart';
import 'package:ipotato_timer/presentation/pages/add_timer/add_timer_page.dart';
import 'package:ipotato_timer/presentation/pages/home/home_page.dart';
import 'package:ipotato_timer/presentation/pages/splash/splash_page.dart';

class AppRouter {
  static const splashPage = '/splash';
  static const homePage = '/home';
  static const addTimer = '/add_timer';

  static Route<Object?> onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case splashPage:
        return MaterialPageRoute(builder: (contetx) => const SplashPage());
      case homePage:
        return MaterialPageRoute(builder: (contetx) => const HomePage());
      case addTimer:
        return MaterialPageRoute(builder: (contetx) => const AddTimerPage());
      default:
        return MaterialPageRoute(builder: (contetx) => const HomePage());
    }
  }
}
