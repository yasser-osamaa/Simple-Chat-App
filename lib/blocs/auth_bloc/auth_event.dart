part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin({required this.email, required this.password});
}

class AuthRegister extends AuthEvent {
  final String email;
  final String password;

  AuthRegister({required this.email, required this.password});
}
