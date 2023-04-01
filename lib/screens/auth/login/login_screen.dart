import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_nikah_booking/screens/main/main_tab_screen.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/app_elevated_button.dart';
import 'package:textless/textless.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      "assets/splash-screen/my-nikah.png",
                      height: 200,
                      width: 200,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              color: context.theme.cardColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 32, bottom: 16, left: 16),
                          child: "Login".text.bold.size(24),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.contact_emergency_rounded),
                      labelText: "NIK",
                      labelStyle: context.theme.textTheme.bodyMedium,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key),
                      labelText: "Password",
                      labelStyle: context.theme.textTheme.bodyMedium,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: AppElevatedButton(
                    large: true,
                    type: ElevatedButtonType.primary,
                    onPressed: () =>
                        context.rootNav().pushNamed(MainTabScreen.routeName),
                    child: "Login".text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
