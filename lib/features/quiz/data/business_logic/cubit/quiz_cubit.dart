import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/features/quiz/data/model/question.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/data/repository/quiz_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit(this._quizRepository) : super(QuizInitial());
  final QuizRepository _quizRepository;
  Timer ? _timer;
  final PageController controller=PageController(initialPage: 0);
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
  void startTimer(int time){
    Timer.periodic(Duration(minutes: time ), (timer) { });
  }
}
