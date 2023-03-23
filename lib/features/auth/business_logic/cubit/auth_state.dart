part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class SingInDone extends AuthState {}
class CreateAccountDone extends AuthState {}
class SingOutDone extends AuthState {}
class AuthLoading extends AuthState {}
class AuthFaild extends AuthState {}

