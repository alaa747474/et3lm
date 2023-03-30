import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key, required this.answer});
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).primaryColor.withOpacity(0.7)),
      child: Center(
        child: Text(answer, style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)),
      ),
    );
  }
}
