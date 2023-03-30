import 'package:e_learning_app/features/quiz/data/model/answer.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/answer_card.dart';
import 'package:flutter/material.dart';

class AnswersListView extends StatelessWidget {
  const AnswersListView({super.key, required this.answers});
  final List<Answer> answers;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: answers.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              if (answers[index].isCorrect == true) {
              } else {}
            },
            child: AnswerCard(answer: answers[index].answer));
      },
    );
  }
}
