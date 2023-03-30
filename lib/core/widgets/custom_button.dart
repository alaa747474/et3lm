import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, this.color,required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  final Color ?color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width/1.2, 40.h),
          elevation: 0,
          backgroundColor: color ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          )
        ),
        child: Text(text,style: Theme.of(context).textTheme.bodyLarge,));
  }
}
