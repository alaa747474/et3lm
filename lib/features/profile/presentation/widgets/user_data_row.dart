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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 140.w,minWidth: 140.w),
              child: Text(title,style: Theme.of(context).textTheme.titleMedium,)),
            Text(
              text,style: Theme.of(context).textTheme.titleSmall,
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
