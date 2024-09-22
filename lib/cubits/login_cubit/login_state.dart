part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  final String errMsg;

  LoginFailure({required this.errMsg});
}

final class LoginLoading extends LoginState {}
