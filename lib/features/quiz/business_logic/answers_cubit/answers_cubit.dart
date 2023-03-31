import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'answers_state.dart';

class AnswersCubit extends Cubit<AnswersState> {
  AnswersCubit() : super(AnswersInitial());
  Timer? _timer;
  int? selectedAnswer;
  final PageController controller = PageController(initialPage: 0);
  List<int>? answersList;

  void createAnswersList(int questionsNumber) {
    answersList = List<int>.generate(questionsNumber, (i) => 0);
  }

  void changeSelectedAnswerColor(int index) {
    selectedAnswer = index;
    emit(ChangeSelectedAnswerColor());
  }
  calculteQuizScore(){
   var x= answersList!.fold(0, (previousValue, element) => previousValue+element);
   print('$x of 3');
     emit(ChangeSelectedAnswerColor());
  }

  String minutesString = '00';
  String secondsString = '00';
  int remainingSeconds = 1;
  void startTimer(int timeInSeconds) {
    Duration duration = const Duration(seconds: 1);
    remainingSeconds = timeInSeconds;
    _timer = Timer.periodic(duration, (_) {
      emit(ChangeSelectedAnswerColor());
      if (remainingSeconds == 0) {
        timerCacel();
        emit(ChangeSelectedAnswerColor());
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        minutesString = minutes.toString().padLeft(2, '0');
        secondsString = seconds.toString().padLeft(2, '0');
        remainingSeconds--;
        emit(ChangeSelectedAnswerColor());
      }
    });
  }

  void timerCacel() {
    _timer?.cancel();
  }
}
