import 'package:e_learning_app/core/utils/padding_extension.dart';
import 'package:e_learning_app/core/widgets/custom_button.dart';
import 'package:e_learning_app/core/widgets/error_text.dart';
import 'package:e_learning_app/features/quiz/business_logic/answers_cubit/answers_cubit.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/answers_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/quiz_cubit/quiz_cubit.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      
      builder: (context, state) {
        if (state is QuestionsLoaded) {
          return PageView.builder(
            itemCount: state.questions.length,
            controller: context.read<AnswersCubit>().controller,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
             
              return AppPadding(Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(onPressed: (){ context.read<AnswersCubit>().createAnswersList(state.questions.length);}),
                  Text(state.questions[index].question,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleLarge),
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
                        context
                            .read<AnswersCubit>()
                            .controller
                            .jumpToPage(index + 1);
                            if (index==2) {
                              context.read<AnswersCubit>().calculteQuizScore();
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
        return const ErrorText();
      },
    );
  }
}
