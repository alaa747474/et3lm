import 'package:e_learning_app/features/quiz/data/model/question.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz_score.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getAllQuestions({required String quizId});
  Future<List<Quiz>> getAllQuizzes();
  Future<void> saveQuizScoreToStudentResults({required QuizScore quizScore,required String uid});
  
  Future<void> addStudentUidToDEnteredQuizStudents({required String quizId,required String uid});
}
