part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizzesLoaded extends QuizState {
  final List<Quiz> quizzes;

  QuizzesLoaded(this.quizzes);
}

class QuizzesLoading extends QuizState {}

class QuizzesFaildToLoad extends QuizState {
  final String error;
  QuizzesFaildToLoad(this.error);
}

class QuestionsLoaded extends QuizState {
  final List<Question> questions;

  QuestionsLoaded(this.questions);
}

class QuestionsLoading extends QuizState {}
