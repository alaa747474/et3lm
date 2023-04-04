import 'package:bloc/bloc.dart';
import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/profile/data/repository/profile_repository.dart';
import 'package:meta/meta.dart';

import '../../../quiz/data/model/quiz_score.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepository) : super(ProfileInitial());
  final ProfileRepository _profileRepository;
  void getProfileData() async {
    emit(ProfileDataLoading());
    await _profileRepository.getStudentData().then((value) {
      if (!isClosed) {
        emit(ProfileDataLoaded(value));
      }
    }).catchError((onError) {
      emit(ProfileFailedToLoad(onError.toString()));
    });
  }

  void getAllQuizzesResults() async {
    await _profileRepository.getAllQuizzesResults().then((value) {
      if (!isClosed) {
        emit(QuizzesResultsLoaded(value));
      }
    });
  }
}
