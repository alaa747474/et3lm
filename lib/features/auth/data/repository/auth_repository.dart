import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/auth/data/repository/base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository extends BaseAuthRepository {
  final FirebaseAuth _auth;

  final User? currentUser = FirebaseAuth.instance.currentUser;
  AuthRepository(this._auth);
  @override
  Future<UserCredential> createAccount({required UserModel userModel}) async {
   UserCredential credential= await _auth.createUserWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
        return credential;
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
