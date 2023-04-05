import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/core/widgets/custom_button.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/presentation/screens/question_screen.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/quiz_datails_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../business_logic/answers_cubit/answers_cubit.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key, required this.quiz});
  final Quiz quiz;
  @override
  Widget build(BuildContext context) {
    String startAt = DateFormat.yMEd()
        .add_jms()
        .format(DateTime.parse(quiz.startAt.toDate().toString()));
    return Container(
      padding: EdgeInsets.all(5.r),
      margin: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                ConstantStrings.quizImage,
                width: 120.w,
                fit: BoxFit.cover,
              ),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      quiz.subjectName,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      quiz.description,
                      textAlign: TextAlign.end,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QuizDetailsRow(
                          text: '${quiz.time} دقيقة',
                          icon: Icons.timer_outlined,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        QuizDetailsRow(
                          text: '${quiz.numberOfQuestions} سؤال',
                          icon: Icons.question_mark_rounded,
                        ),
                      ],
                    ),
                    QuizDetailsRow(
                      text: startAt,
                      icon: Icons.date_range_outlined,
                    ),
                  ],
                ),
              )
            ],
          ),
          quiz.enteredQuizStudents!
                  .contains(FirebaseAuth.instance.currentUser!.uid)
              ? Text('لقد انتهيت من اداء الاختبار !',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.red),)
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: CustomButtom(
                      onPressed: () {
                        Navigator.pushNamed(context, QuestionScreen.routeName,
                            arguments: quiz);
                        context
                            .read<AnswersCubit>()
                            .addStudentUidToDEnteredQuizStudents(
                                quizId: quiz.quizId,uid: FirebaseAuth.instance.currentUser!.uid);
                      },
                      text: 'إبدأ الأن'),
                )
        ],
      ),
    );
  }
}
