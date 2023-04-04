import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/model/quiz_score.dart';
import '../../data/repository/quiz_repository.dart';

part 'answers_state.dart';

class AnswersCubit extends Cubit<AnswersState> {
  AnswersCubit(this._quizRepository) : super(AnswersInitial());
  Timer? _timer;
  double quizScore = 0;
  int? selectedAnswer;
  final PageController controller = PageController(initialPage: 0);
  List<int>? answersList;
  int pageViewCurrentIndex = 0;
  final QuizRepository _quizRepository;

  void goToNextQuestion() {
    controller.jumpToPage(pageViewCurrentIndex + 1);
  }

  void createAnswersList(int questionsNumber) {
    answersList = List<int>.generate(questionsNumber, (i) => 0);
  }

  void changeSelectedAnswerColor(int index) {
    selectedAnswer = index;
    emit(ChangeSelectedAnswerColor());
  }

  void calculteQuizScore() {
    quizScore = answersList!
        .fold(0, (previousValue, element) => previousValue + element);
    timerCacel();
    //  emit(QuizScoreLoaded(quizScore));
  }

  String minutesString = '00';
  String secondsString = '00';
  int remainingSeconds = 1;
  void startTimer(int timeInSeconds) {
    Duration duration = const Duration(seconds: 1);
    remainingSeconds = timeInSeconds;
    _timer = Timer.periodic(duration, (_) {
      if (remainingSeconds == 0) {
        timerCacel();
        emit(QuizTimeExpired());
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        minutesString = minutes.toString().padLeft(2, '0');
        secondsString = seconds.toString().padLeft(2, '0');
        remainingSeconds--;
        emit(QuizTimeStarts());
        if (state is QuizScoreLoaded) {
          minutesString = '00';
          secondsString = '00';
        }
      }
    });
  }

  void timerCacel() {
    _timer?.cancel();
    emit(QuizScoreLoaded(quizScore));
  }

  void saveQuizScoreToStudentResults(
      {required String subjectName, required String quizId}) {
    QuizScore quizScoreModel =
        QuizScore(quizScore, answersList!.length, subjectName, quizId);
    _quizRepository.saveQuizScoreToStudentResults(quizScore: quizScoreModel);
  }

  void addStudentUidToDEnteredQuizStudents(
      {required String quizId,}) {
    _quizRepository.addStudentUidToDEnteredQuizStudents(
        quizId: quizId, );
  }
}
