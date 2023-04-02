import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key,this.text='حدث خطأ ما !!!'});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}