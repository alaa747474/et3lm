import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/core/utils/padding_extension.dart';
import 'package:e_learning_app/core/widgets/custom_button.dart';
import 'package:e_learning_app/core/widgets/error_text.dart';
import 'package:e_learning_app/features/quiz/data/business_logic/cubit/quiz_cubit.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/answers_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is QuestionsLoaded) {
          return PageView.builder(
            controller: context.read<QuizCubit>().controller,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return AppPadding(Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  Text(state.questions[index].question,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleLarge),
                  Expanded(
                    child: AnswersListView(
                        answers: state.questions[index].answers),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomButtom(
                      onPressed: () {
                        context
                            .read<QuizCubit>()
                            .controller
                            .jumpToPage(index + 1);
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
