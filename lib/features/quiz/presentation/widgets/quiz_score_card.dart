import 'package:e_learning_app/core/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizScoreCard extends StatelessWidget {
  const QuizScoreCard(
      {super.key, required this.quizScore, required this.totalQuestions});
  final double quizScore;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    double quizPercentage = quizScore / totalQuestions * 100;
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.r),
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r), color: Colors.white),
        child: Column(
          children: [
            Image.network(ConstantStrings.quizScoreImage,
                width: double.maxFinite, height: 250.h),
            Text(
              '%${quizPercentage.toInt()}',
              style:TextStyle(height: 0.7,
                    fontSize: 80.sp,
                    color: Theme.of(context).primaryColor,)
            ),
            Text('تم الإنتهاء من الإختبار',style:Theme.of(context).textTheme.labelMedium),
            Text('لقد اجبت ${quizScore.toInt()} بشكل صحيح من $totalQuestions',style: Theme.of(context).textTheme.titleLarge,)
          ],
        ),
      ),
    );
  }
}
