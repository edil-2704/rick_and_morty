part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class GetLoginEvent extends AuthEvent {}
class GetRegistrEvent extends AuthEvent {}
