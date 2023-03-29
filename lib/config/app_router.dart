import 'package:flutter/material.dart';
import 'package:my_nikah_booking/screens/main/main_tab_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainTabScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MainTabScreen(),
        );
    }
  }

  static Map<String, dynamic> getRouteArgs(RouteSettings settings) {
    if (settings.arguments == null) {
      return {};
    }

    return settings.arguments as Map<String, dynamic>;
  }
}
