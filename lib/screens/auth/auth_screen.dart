import 'package:flutter/material.dart';
import 'package:textless/textless.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';
import 'package:my_nikah_booking/widgets/app_elevated_button.dart';

class AuthMainScreen extends StatelessWidget {
  static const routeName = '/auth-main';
  const AuthMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Scaffold(
        backgroundColor: context.primaryColor,
        body: Column(
          children: [
            Expanded(
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
            Container(
              height: 300,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 32),
                            child: "Selamat Datang".text.bold.size(24),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //   child: AppElevatedButton(
                  //     large: true,
                  //     child: "Login".text,
                  //     type: ElevatedButtonType.secondary,
                  //     onPressed: () =>
                  //         context.rootNav().pushNamed(LoginScreen.routeName),
                  //   ),
                  // ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //   child: AppOutlinedButton(
                  //     large: true,
                  //     child: "Sign Up".text,
                  //     type: OutlinedButtonType.secondary,
                  //     onPressed: () => context
                  //         .rootNav()
                  //         .pushNamed(RegistrationScreen.routeName),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
