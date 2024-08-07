part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String name;
  final String passwordToLogin;

  LoginEvent({
    required this.name,
    required this.passwordToLogin,
  });
}

class RegisterEvent extends AuthEvent {
  final String name;
  final String surname;
  final String patronymToRegistr;
  final String loginToRegistr;
  final String passwordToRegistr;

  RegisterEvent({
    required this.name,
    required this.surname,
    required this.patronymToRegistr,
    required this.loginToRegistr,
    required this.passwordToRegistr,
  });
}
