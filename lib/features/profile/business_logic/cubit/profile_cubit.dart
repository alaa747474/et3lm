import 'package:bloc/bloc.dart';
import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/profile/data/repository/profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../quiz/data/model/quiz_score.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepository) : super(ProfileInitial());
  final ProfileRepository _profileRepository;
  void getProfileData({required String uid}) async {
    emit(ProfileDataLoading());
   await _profileRepository.getStudentData(uid: uid).then((value) {
      if (!isClosed) {
        emit(ProfileDataLoaded(value));
      }
    }).catchError((onError) {
      emit(ProfileFailedToLoad(onError.toString()));
    });
  }

  void getAllQuizzesResults({required String uid}) async {
    emit(ProfileDataLoading());
    await _profileRepository.getAllQuizzesResults(uid: uid).then((value) {
      if (!isClosed) {
        emit(QuizzesResultsLoaded(value));
      }
    }).catchError((error){
       emit(ProfileFailedToLoad(onError.toString()));
    });
  }
  String getCurrentUserUid(){
   return FirebaseAuth.instance.currentUser!.uid;
  }
}
