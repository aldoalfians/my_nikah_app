part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final String email;
  final String name;
  final String nik;
  final String password;
  final String confirmPassword;

  const RegisterButtonPressed({
    required this.email,
    required this.name,
    required this.nik,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [email, name, nik, password, confirmPassword];

  @override
  String toString() =>
      'RegisterButtonPressed {email: $email, name: $name, nik: $nik, password: $password, confirmPassword: $confirmPassword}';
}
