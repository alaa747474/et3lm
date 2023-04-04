import 'package:flutter/material.dart';

class QuizDetailsRow extends StatelessWidget {
  const QuizDetailsRow({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          text,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      
                      ],
                    );
  }
}