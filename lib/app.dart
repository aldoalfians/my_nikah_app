import 'package:flutter/material.dart';
import 'package:my_nikah_booking/config/app_router.dart';
import 'package:my_nikah_booking/config/app_theme.dart';
import 'package:my_nikah_booking/screens/auth/auth_screen.dart';
import 'package:my_nikah_booking/screens/main/main_tab_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyNikah',
      theme: appThemeData[AppTheme.light],
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      home: const AuthMainScreen(),
    );
  }
}
