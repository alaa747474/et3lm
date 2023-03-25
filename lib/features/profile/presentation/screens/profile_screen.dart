import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(text: 'بيانات الطالب', onPressed: null),
    );
  }
}