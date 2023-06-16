import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/data/repositories/auth_repository.dart';
import 'package:my_nikah_booking/logic/blocs/login_bloc/login_bloc.dart';
import 'package:my_nikah_booking/screens/auth/register/register_screen.dart';
import 'package:my_nikah_booking/screens/main/main_tab_screen.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/app_elevated_button.dart';
import 'package:textless/textless.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  _LoginFormState();

  final _nikController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _nikController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Gagal Login"),
              backgroundColor: context.errorColor,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
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
                          child: "Masuk".text.bold.size(24),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      labelText: "Email",
                      labelStyle: context.theme.textTheme.bodyMedium,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: context.theme.primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                    controller: _nikController,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 150,
                        child: state is LoginLoading
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: CircularProgressIndicator(
                                            backgroundColor:
                                                context.backgroundColor,
                                            color: context.primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  AppElevatedButton(
                                    large: true,
                                    type: ElevatedButtonType.primary,
                                    onPressed: _onLoginButtonPressed,
                                    child: "Masuk".text,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                    onPressed: () => context
                                        .rootNav()
                                        .pushNamed(
                                            RegistrationScreen.routeName),
                                    child: "Daftar".text.bold.size(16),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
