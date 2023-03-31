import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDataRow extends StatelessWidget {
  const UserDataRow({super.key, required this.text, required this.title});
  final String text;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 130.w,minWidth: 130.w),
              child: Text(title,style: Theme.of(context).textTheme.titleMedium,)),
            Text(
              text,
            )
          ],
        ),
        Divider(
          thickness: 0.5.r,
        ),
      ],
    );
  }
}
