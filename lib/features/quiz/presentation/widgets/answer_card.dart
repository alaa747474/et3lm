import 'package:e_learning_app/features/quiz/business_logic/answers_cubit/answers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/quiz_cubit/quiz_cubit.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key, required this.answer, required this.index});
  final String answer;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswersCubit, AnswersState>(
      builder: (context, state) {
        return Column(
          children: [

            Container(
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.symmetric(vertical: 5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: index == context.read<AnswersCubit>().selectedAnswer
                      ? Theme.of(context).primaryColor.withOpacity(0.7)
                      : Colors.amber),
              child: Center(
                child: Text(answer,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }
}
