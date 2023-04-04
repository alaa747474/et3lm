import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz_score.dart';

abstract class BaseProfileRepository {
  Future<UserModel>getStudentData();
  Future<List<QuizScore>> getAllQuizzesResults();
}