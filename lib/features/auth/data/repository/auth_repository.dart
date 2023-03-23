import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/auth/data/repository/base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository extends BaseAuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final User? currentUser = FirebaseAuth.instance.currentUser;
  AuthRepository(this._auth, this._firestore);
  @override
  Future<void> createAccount({required UserModel userModel}) async {
   UserCredential credential= await _auth.createUserWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
    if (credential.user != null) {
     // await currentUser!.linkWithPhoneNumber(userModel.phoneNumber);
      await _firestore
          .collection(ConstantStrings.usersCollection)
          .doc(credential.user!.uid)
          .set(userModel.toJson());
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
