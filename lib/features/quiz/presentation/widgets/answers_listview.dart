import 'package:e_learning_app/features/quiz/business_logic/answers_cubit/answers_cubit.dart';
import 'package:e_learning_app/features/quiz/data/model/answer.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/answer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/quiz_cubit/quiz_cubit.dart';

class AnswersListView extends StatelessWidget {
  const AnswersListView(
      {super.key, required this.answers, required this.questionIndex});
  final List<Answer> answers;
  final int questionIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: answers.length,
      itemBuilder: (BuildContext context, int index) {
        return BlocBuilder<AnswersCubit, AnswersState>(
          builder: (context, state) {
            return InkWell(
                onTap: () {
                  context.read<AnswersCubit>().changeSelectedAnswerColor(index);
                  if (answers[index].isCorrect == true) {
                    context.read<AnswersCubit>().answersList![questionIndex] =
                        1;
                  } else {
                    context.read<AnswersCubit>().answersList![questionIndex] =
                        0;
                  }
                },
                child: AnswerCard(answer: answers[index].answer, index: index));
          },
        );
      },
    );
  }
}
