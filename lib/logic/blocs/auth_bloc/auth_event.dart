part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String token;

  const LoggedIn({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class SignUp extends AuthEvent {
  final String token;

  const SignUp({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'SignUp { token: $token }';
}

class LoggedOut extends AuthEvent {}
