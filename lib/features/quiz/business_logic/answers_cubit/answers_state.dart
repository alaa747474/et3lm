part of 'answers_cubit.dart';

@immutable
abstract class AnswersState {}

class AnswersInitial extends AnswersState {}

class ChangeSelectedAnswerColor extends AnswersState {}

class QuizTimeStarts extends AnswersState {}

class QuizTimeExpired extends AnswersState {}
class QuizScoreLoaded extends AnswersState {
  final double quizScore;

  QuizScoreLoaded(this.quizScore);
}
