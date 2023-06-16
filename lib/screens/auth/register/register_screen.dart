import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/data/repositories/auth_repository.dart';
import 'package:my_nikah_booking/logic/blocs/register_bloc/register_bloc.dart';
import 'package:my_nikah_booking/screens/auth/login/login_screen.dart';
import 'package:my_nikah_booking/screens/auth/register/widgets/register_form.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration';
  final UserRepository userRepository;

  const RegistrationScreen({
    Key? key,
    required this.userRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterCompeleted) {
            return LoginScreen(
              userRepository: userRepository,
            );
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
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
              ),
              Container(
                height: 508,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: RegisterForm(),
              ),
            ],
          );
        },
      ),
    );
  }
}
