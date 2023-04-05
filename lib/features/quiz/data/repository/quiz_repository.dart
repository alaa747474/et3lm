import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/features/quiz/data/model/question.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz_score.dart';
import 'package:e_learning_app/features/quiz/data/repository/base_quiz_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuizRepository extends BaseQuizRepository {
  final FirebaseFirestore _firestore;
  User? currentUser = FirebaseAuth.instance.currentUser;
  QuizRepository(
    this._firestore,
  );
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

  @override
  Future<void> saveQuizScoreToStudentResults(
      {required QuizScore quizScore,required String uid}) async {
    await FirebaseFirestore.instance
        .collection(ConstantStrings.usersCollection)
        .doc(uid)
        .collection(ConstantStrings.resultsCollection)
        .doc(quizScore.quizId)
        .set(quizScore.toMap());
  }


  @override
  Future<void> addStudentUidToDEnteredQuizStudents({
    required String quizId,
    required String uid
  }) async {
    List<String> studentsUid = [];
    studentsUid.add(uid);
    await _firestore
        .collection(ConstantStrings.quizCollection)
        .doc(quizId)
        .update({'enteredQuizStudents': FieldValue.arrayUnion(studentsUid)});
  }
}
