import 'package:e_learning_app/features/quiz/data/model/question.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';

abstract class BaseQuizRepository {
  Future<List<Question>>getAllQuestions({required String quizId});
  Future<List<Quiz>>getAllQuizzes();

}