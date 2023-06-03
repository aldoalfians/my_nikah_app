import 'package:flutter/material.dart';
import 'package:my_nikah_booking/data/repositories/auth_repository.dart';
import 'package:my_nikah_booking/screens/auth/auth_screen.dart';
import 'package:my_nikah_booking/screens/auth/login/login_screen.dart';
import 'package:my_nikah_booking/screens/auth/register/register_screen.dart';
import 'package:my_nikah_booking/screens/main/main_tab_screen.dart';
import 'package:my_nikah_booking/screens/modules/booking/screens/inside_booking.dart';
import 'package:my_nikah_booking/screens/modules/booking/screens/outside_booking_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final userRepository = UserRepository();
    switch (settings.name) {
      case MainTabScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MainTabScreen(),
        );
      case AuthMainScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const AuthMainScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(
            userRepository: userRepository,
          ),
        );
      case RegistrationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => RegistrationScreen(
            userRepository: userRepository,
          ),
        );
      case InsideBookingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const InsideBookingScreen(),
        );

      case OutsideBookingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const OutsideBookingScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Halaman tidak ditemukan"),
            ),
          ),
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
