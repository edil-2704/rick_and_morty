part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class GetLoginEvent extends AuthEvent {
  final String nameToLogin;
  final String passwordToLogin;

  GetLoginEvent({required this.nameToLogin, required this.passwordToLogin});
}

class GetRegistrEvent extends AuthEvent {}
