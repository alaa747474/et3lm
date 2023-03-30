import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      fontFamily: 'NotoKufiArabic',
      disabledColor: const Color.fromARGB(255, 70, 70, 70),
      hintColor: const Color.fromARGB(255, 169, 169, 169),
      primaryColor:const Color(0xff56a3f3),
      cardColor: Colors.white,
      scaffoldBackgroundColor: const Color.fromARGB(255, 224, 239, 255),
      shadowColor: Colors.black,
      textTheme: textTheme(),
    );
  }

  static TextTheme textTheme() {
    return TextTheme(
      labelLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25.sp,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
      labelSmall: TextStyle(
        color: Colors.black45,
        
        fontSize: 16.sp,
      ),
      titleLarge: TextStyle(
        color: const Color(0xff56a3f3),
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16.sp
      ),
      bodyMedium: TextStyle(
        color: Colors.grey,
        height: 1.2.r,
        fontSize: 13.sp
      ),
    );
  }
}