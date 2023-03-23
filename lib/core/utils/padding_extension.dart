import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppPadding on Widget{
   horizontalPadding ()=>Padding(padding: EdgeInsets.symmetric(horizontal: 15.w),child: this,);
}