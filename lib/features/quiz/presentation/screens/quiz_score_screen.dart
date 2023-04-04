import 'package:e_learning_app/core/widgets/custom_button.dart';
import 'package:e_learning_app/features/home/presentation/screens/home_screen.dart';
import 'package:e_learning_app/features/quiz/presentation/widgets/quiz_score_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizScoreScreen extends StatelessWidget {
  const QuizScoreScreen(
      {super.key, required this.quizScore, required this.totalQuestions});
  static const String routeName = '/quiz_score_screen';
  final double quizScore;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QuizScoreCard(quizScore: quizScore, totalQuestions: totalQuestions),
          SizedBox(height: 20.h,),
          CustomButtom(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.routeName, (route) => false);
              },
              text: 'العودة للصفحة الرئيسية'),
        ],
      ),
    );
  }
}
