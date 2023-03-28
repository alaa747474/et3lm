part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileDataLoaded extends ProfileState {
  final UserModel studentData;

  ProfileDataLoaded(this.studentData);
}
class ProfileDataLoading extends ProfileState {}

