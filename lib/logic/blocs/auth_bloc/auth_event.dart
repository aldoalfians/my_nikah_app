part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final LoginUser loginUser;
  const LoggedIn(this.loginUser);

  @override
  List<Object> get props => [loginUser];
}

class SignUp extends AuthEvent {
  final String token;

  const SignUp({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'SignUp { token: $token }';
}

class Logout extends AuthEvent {}

class LoggedOut extends AuthEvent {}
