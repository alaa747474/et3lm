import 'package:e_learning_app/core/utils/service_locator.dart';
import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/core/widgets/error_text.dart';
import 'package:e_learning_app/core/widgets/loading_indicator.dart';
import 'package:e_learning_app/features/quiz/data/repository/quiz_repository.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/quiz_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/quiz_cubit/quiz_cubit.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => QuizCubit(getIt.get<QuizRepository>())..getAllQuizzes(),
      child: Scaffold(
        appBar:const CustomAppBar(text: 'الاخبارات', onPressed: null),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is QuizzesLoading) {
              return const LoadingIndicator();
            }
            if (state is QuizzesFaildToLoad) {
              return Text(state.error);
            }
            if (state is QuizzesLoaded) {
              return ListView.builder(
                itemCount: state.quizzes.length,
                itemBuilder: (BuildContext context, int index) {
                 return  QuizCard(quiz: state.quizzes[index],);
                },
              );
            }
            return const ErrorText();
          },
        ),
      ),
    );
  }
}
