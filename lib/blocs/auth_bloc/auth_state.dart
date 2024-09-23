part of 'auth_bloc.dart';


sealed class AuthState {}

final class AuthInitial extends AuthState {}
//Login States

final class LoginSuccess extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {
  final String errMsg;

  LoginFailure({required this.errMsg});
}

//Register states

final class RegisterSuccess extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterFailuer extends AuthState {
  final String errMsg;

  RegisterFailuer({required this.errMsg});
}
