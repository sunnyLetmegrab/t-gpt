import 'package:flutter/material.dart';
import 'package:t_gpt/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:t_gpt/features/search_page/presentation/pages/search_page.dart';
import 'package:t_gpt/features/splash/presentation/pages/splash_page.dart';

import 'features/history/presentation/pages/history_screen.dart';
import 'features/home/presentation/pages/home_page.dart';

class AppRoutes {
  static const splash = '/';
  static const onboarding = "/onboarding";
  static const home = '/home';
  static const searchPage = '/searchPage';
  static const history = "/history";

  static Route<dynamic>? genearateRoute(RouteSettings settings) {
    var name = settings.name;
    Widget page = const Scaffold(
      body: Placeholder(),
    );
    switch (name) {
      case AppRoutes.splash:
        page = const SplashPage();
      case AppRoutes.onboarding:
        page = const OnBoardingPage();

      case AppRoutes.home:
        page = const HomePage();
      case AppRoutes.history:
      page= const HistoryPage();
      case AppRoutes.searchPage:
        page = const SearchPage();
      default:
        page = page;
    }
    return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return page;
      },
    );
  }
}
