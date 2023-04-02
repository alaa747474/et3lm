import 'package:e_learning_app/features/quiz/business_logic/answers_cubit/answers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerContainer extends StatelessWidget {
  const TimerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswersCubit, AnswersState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              "${context.read<AnswersCubit>().minutesString}:${context.read<AnswersCubit>().secondsString}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              width: 3.w,
            ),
             Icon(Icons.timer_outlined,size: 25.r,),
            SizedBox(
              width: 5.w,
            ),
          ],
        );
      },
    );
  }
}
