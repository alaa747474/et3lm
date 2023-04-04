import 'package:e_learning_app/core/utils/padding_extension.dart';
import 'package:e_learning_app/core/utils/utils.dart';
import 'package:e_learning_app/core/widgets/custom_button.dart';
import 'package:e_learning_app/core/widgets/error_text.dart';
import 'package:e_learning_app/core/widgets/loading_indicator.dart';
import 'package:e_learning_app/features/quiz/business_logic/answers_cubit/answers_cubit.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/answers_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/quiz_cubit/quiz_cubit.dart';
import '../screens/quiz_score_screen.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key,required this.quiz});
  final Quiz quiz;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AnswersCubit, AnswersState>(
      listener: (context, state) {
        if (state is QuizScoreLoaded) {
          context.read<AnswersCubit>().saveQuizScoreToStudentResults(subjectName: quiz.subjectName, quizId: quiz.quizId);
          Navigator.pushReplacementNamed(context, QuizScoreScreen.routeName,
              arguments: QuizScoreScreen(
                  quizScore: state.quizScore,
                  totalQuestions:
                      context.read<AnswersCubit>().answersList!.length));
        }
      },
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuestionsLoaded) {
            return PageView.builder(
              onPageChanged: (value) {
                context.read<AnswersCubit>().pageViewCurrentIndex = value;
              },
              itemCount: state.questions.length,
              controller: context.read<AnswersCubit>().controller,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return AppPadding(Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.questions[index].question,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.labelSmall),
                    Expanded(
                      child: AnswersListView(
                          questionIndex: index,
                          answers: state.questions[index].answers),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButtom(
                        onPressed: () {
                          context.read<AnswersCubit>().selectedAnswer = null;
                          if (index != state.questions.length - 1) {
                            context.read<AnswersCubit>().goToNextQuestion();
                          }
                          if (index == state.questions.length - 1) {
                            Utils.instanse.showCustomDialog(
                                context: context,
                                onPressed: () {
                                  context
                                      .read<AnswersCubit>()
                                      .calculteQuizScore();
                                },
                                title: 'هل أنت متأكد من انهاء الإختبار؟',
                                subTitle:
                                    'اذا قمت بتأكيد الإنهاء لن تتمكن من تعديل الإجابات مرة اخرى');
                          }
                        },
                        text: 'التالى'),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                )).horizontalPadding();
              },
            );
          }
          if (state is QuestionsLoading) {
            return const LoadingIndicator();
          }
          if (state is QuizzesFaildToLoad) {
            return ErrorText(text: state.error);
          }
          return const ErrorText();
        },
      ),
    );
  }
}
