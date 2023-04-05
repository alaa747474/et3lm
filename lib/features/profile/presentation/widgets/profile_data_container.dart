
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDataContainer extends StatelessWidget {
  const ProfileDataContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.only(right: 15.w, left: 15.w, top: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Theme.of(context).cardColor,
      ),
      child: child
    );
  }
}
