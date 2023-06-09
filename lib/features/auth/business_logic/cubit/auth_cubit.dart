import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/core/service/firebase_storage_service.dart';
import 'package:e_learning_app/core/utils/image_picker_helper.dart';
import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/auth/data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  File? profilePic;
  final AuthRepository _authRepo;
  Future<void> createAccount(
      {required String name,
      required String email,
      required String password,
      required String universityId,
      required String phoneNumber,
      required String profilePic,
      required String level}) async {
    emit(AuthLoading());
    UserModel user = UserModel(
        name, email, password, universityId, phoneNumber, profilePic, level);
    try {
      UserCredential credential= await _authRepo.createAccount(userModel: user);
       if (credential.user != null) {
        await FirebaseFirestore.instance
          .collection(ConstantStrings.usersCollection)
          .doc(credential.user!.uid)
          .set(user.toJson());

    }
    emit(CreateAccountDone());
    } on FirebaseAuthException catch (e) {
      emit(AuthFaild(e.message!));
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
       _authRepo.signIn(email: email, password: password).then((value) {
        emit(SingInDone());
      });
    } on FirebaseAuthException catch (e) {
      emit(AuthFaild(e.message!));
    }
  }

  void signOut() async {
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
