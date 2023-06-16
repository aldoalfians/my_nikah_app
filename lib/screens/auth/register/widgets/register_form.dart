import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/logic/blocs/register_bloc/register_bloc.dart';
import 'package:my_nikah_booking/screens/auth/login/login_screen.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/app_elevated_button.dart';
import 'package:textless/textless.dart';

class RegisterForm extends StatefulWidget {
  // final UserRepository userRepository;

  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  _RegisterFormState();

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _nikController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onRegisterButtonPressed() {
      BlocProvider.of<RegisterBloc>(context).add(
        RegisterButtonPressed(
          email: _emailController.text,
          name: _nameController.text,
          nik: _nikController.text,
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
        ),
      );
    }

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                  "Gagal Membuat Akun Cek kembali password dan konfirmasi password"),
              backgroundColor: context.errorColor,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Berhasil mendaftarkan akun, Silahkan Login"),
              backgroundColor: context.primaryColor,
            ),
          );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Form(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxHeight: double.infinity,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(color: context.cardColor),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 32, bottom: 16, left: 16),
                                        child: "Daftar".text.bold.size(24),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email),
                                    labelText: "Email",
                                    labelStyle:
                                        context.theme.textTheme.bodyMedium,
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
                                  controller: _emailController,
                                  keyboardType: TextInputType.text,
                                  autocorrect: false,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(Icons.person_rounded),
                                    labelText: "Nama",
                                    labelStyle:
                                        context.theme.textTheme.bodyMedium,
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
                                  controller: _nameController,
                                  keyboardType: TextInputType.text,
                                  autocorrect: false,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                        Icons.contact_emergency_rounded),
                                    labelText: "NIK",
                                    labelStyle:
                                        context.theme.textTheme.bodyMedium,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.key),
                                    labelText: "Password",
                                    labelStyle:
                                        context.theme.textTheme.bodyMedium,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.key),
                                    labelText: "Konfirmasi Password",
                                    labelStyle:
                                        context.theme.textTheme.bodyMedium,
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
                                  controller: _confirmPasswordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  autocorrect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 112,
                        child: state is RegisterLoading
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: AppElevatedButton(
                                      large: true,
                                      child: "Buat Akun Baru".text,
                                      type: ElevatedButtonType.primary,
                                      onPressed: _onRegisterButtonPressed,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => context
                                        .rootNav()
                                        .pushNamed(LoginScreen.routeName),
                                    child: "Login".text.bold.size(16),
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
