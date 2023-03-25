
import 'package:e_learning_app/features/auth/data/model/user_model.dart';

abstract class BaseAuthRepository {
  Future<void>createAccount({required UserModel userModel});
  Future<void>signIn({required String email,required String password});
  Future<void>signOut();
}