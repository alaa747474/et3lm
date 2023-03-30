import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/features/quiz/data/model/question.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/data/repository/base_quiz_repository.dart';

class QuizRepository extends BaseQuizRepository {
  final FirebaseFirestore _firestore;

  QuizRepository(this._firestore);
  @override
  Future<List<Question>> getAllQuestions({required String quizId}) async {
    final collection = await _firestore
        .collection(ConstantStrings.quizCollection)
        .doc(quizId)
        .collection(ConstantStrings.qusetionCollection)
        .get();
    return collection.docs.map((e) => Question.fromMap(e.data())).toList();
  }

  @override
  Future<List<Quiz>> getAllQuizzes() async {
    final collection =
        await _firestore.collection(ConstantStrings.quizCollection).get();
    return collection.docs.map((e) => Quiz.fromMap(e.data())).toList();
  }
}
