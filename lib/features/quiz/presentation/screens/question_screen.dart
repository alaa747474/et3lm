import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/core/utils/service_locator.dart';
import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/core/widgets/custom_button.dart';
import 'package:e_learning_app/core/widgets/error_text.dart';
import 'package:e_learning_app/features/quiz/data/business_logic/cubit/quiz_cubit.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/data/repository/quiz_repository.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key, required this.quiz});
  final Quiz quiz;
  static const String routeName = '/question_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(getIt.get<QuizRepository>())
        ..getAllQuestions(quizId: quiz.quizId),
      child: const Scaffold(
          appBar:
              CustomAppBar(text: 'الإختبار', onPressed: null),
          body: QuestionCard()),
    );
  }
}
