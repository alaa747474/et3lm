part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class ProfilePicPicked extends AuthState {
  final File profilePic;
  ProfilePicPicked(this.profilePic);
}
class ProfilePicUrlLoaded extends AuthState {
  final String profilePicUrl;
  ProfilePicUrlLoaded(this.profilePicUrl);
}
class SingInDone extends AuthState {}
class CreateAccountDone extends AuthState {}
class SingOutDone extends AuthState {}
class AuthLoading extends AuthState {}
class AuthFaild extends AuthState {}

