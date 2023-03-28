import 'package:bloc/bloc.dart';
import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/profile/data/repository/profile_repository.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepository) : super(ProfileInitial());
  final ProfileRepository _profileRepository;
  getProfileData(){
   emit(ProfileDataLoading());
   _profileRepository.getStudentData().then((value) {
    emit(ProfileDataLoaded(value));
   });
  }
}
