
import 'package:e_learning_app/features/auth/presentation/screens/create_account_screen.dart';
import 'package:e_learning_app/features/home/presentation/screens/home_screen.dart';
import 'package:e_learning_app/features/subjects/presentation/screens/subjects_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
       case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case CreateAccountScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      case SubjectsScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const SubjectsScreen());
    }
    return null;
  }
}
