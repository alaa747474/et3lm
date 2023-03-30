import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'حدث خطأ ما !!!',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}