import 'package:e_learning_app/features/subjects/data/model/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectContainer extends StatelessWidget {
  const SubjectContainer({super.key, required this.subject});
  final Subject subject;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(35.r),
        //  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, spreadRadius: 1.5.r)]
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(subject.image,width: 80.w,height: 80.h,),
          Text(subject.name,style: Theme.of(context).textTheme.titleLarge,)
        ],
      ),    
    );
  }
}
