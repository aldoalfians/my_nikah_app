import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/data/repositories/auth_repository.dart';
import 'package:my_nikah_booking/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:my_nikah_booking/logic/blocs/login_bloc/login_bloc.dart';
import 'package:my_nikah_booking/screens/auth/login/widgets/login_form.dart';
import 'package:my_nikah_booking/screens/main/main_tab_screen.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/app_elevated_button.dart';
import 'package:textless/textless.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  final UserRepository userRepository;
  LoginScreen({
    required this.userRepository,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
              userRepository: userRepository,
              authBloc: BlocProvider.of<AuthBloc>(context));
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthAuthenticated) {
              return MainTabScreen();
            }
            return Column(
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
                  height: 400,
                  decoration: BoxDecoration(
                    color: context.theme.cardColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: LoginForm(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
