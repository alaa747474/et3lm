import 'package:e_learning_app/core/utils/service_locator.dart';
import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/features/quiz/business_logic/quiz_cubit/quiz_cubit.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/data/repository/quiz_repository.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/question_card.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/timer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key, required this.quiz});
  final Quiz quiz;
  static const String routeName = '/question_screen';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuizCubit(getIt.get<QuizRepository>())
            ..getAllQuestions(quizId: quiz.quizId),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(
          text: 'الأسئلة',
          onPressed: null,
          actions: [
            TimerContainer(),
          ],
        ),
        body: QuestionCard(quiz:quiz),
      ),
    );
  }
}
