import 'package:e_learning_app/features/auth/data/model/user_model.dart';

abstract class BaseProfileRepository {
  Future<UserModel>getStudentData();
}