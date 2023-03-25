import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      fontFamily: 'NotoKufiArabic',
      disabledColor: const Color.fromARGB(255, 70, 70, 70),
      hintColor: const Color.fromARGB(255, 169, 169, 169),
      primaryColor:const Color(0xff6C63FF),
      cardColor: const Color.fromARGB(255, 242, 242, 253),
      scaffoldBackgroundColor: const Color.fromARGB(255, 250, 249, 255),
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
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16.sp
      )
    );
  }
}