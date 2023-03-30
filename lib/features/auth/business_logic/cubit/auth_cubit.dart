import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_learning_app/core/service/firebase_storage_service.dart';
import 'package:e_learning_app/core/utils/image_picker_helper.dart';
import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepository _authRepo;
  Future<void> createAccount({
    required String name,
    required String email,
    required String password,
    required String universityId,
    required String phoneNumber,
    required String profilePic,
    required String level
  }) async {
    emit(AuthLoading());
    UserModel user = UserModel(name, email, password, universityId, phoneNumber,profilePic,level);
    await _authRepo.createAccount(userModel: user).then((value) {
      emit(CreateAccountDone());
    });
  }

  void signIn({
    required String email,
    required String password,
  }) {
    emit(AuthLoading());
    _authRepo.signIn(email: email, password: password).then((value) {
      emit(SingInDone());
    });
  }

  void signOut() async{
    emit(AuthLoading());
    await _authRepo.signOut().then((value) {
      emit(SingOutDone());
    });
  }

  void pickProfilePic() {
    ImagePickerHelper.instance
        .pickImage(ImageSource.gallery)
        .then((profilePic) {
      emit(ProfilePicPicked(profilePic!));
    });
  }

  void getProfilePicUrl({required File file, required String imagePath}) {
    FireStorageService.instance
        .saveFilesToFirebaseStorage('Profile Pic', imagePath, file)
        .then((profilePicUrl) {
      emit(ProfilePicUrlLoaded(profilePicUrl));
    });
  }
}
