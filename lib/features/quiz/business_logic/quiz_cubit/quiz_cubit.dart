import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/features/quiz/data/model/question.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/data/repository/quiz_repository.dart';
import 'package:flutter/material.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit(this._quizRepository) : super(QuizInitial());
  final QuizRepository _quizRepository;

  void getAllQuestions({required String quizId}) {
    emit(QuestionsLoading());
    try {
      _quizRepository.getAllQuestions(quizId: quizId).then((value) {
        emit(QuestionsLoaded(value));
      });
    } on FirebaseException catch (e) {
      emit(QuizzesFaildToLoad(e.message!));
    }
  }

  void getAllQuizzes() {
    emit(QuizzesLoading());
    try {
      _quizRepository.getAllQuizzes().then((value) {
        emit(QuizzesLoaded(value));
      });
    } on FirebaseException catch (e) {
      emit(QuizzesFaildToLoad(e.message!));
    }
  }

  bool showQuiz(Timestamp timestamp) {
    return DateTime.now().toUtc().isAfter(
          DateTime.fromMillisecondsSinceEpoch(
            timestamp.millisecondsSinceEpoch,
            isUtc: false,
          ).toUtc(),
        );
  }

  void getAllQuizzesResults() async {

  }
}
