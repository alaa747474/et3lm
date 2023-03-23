import 'package:e_learning_app/features/auth/presentation/screens/create_account_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
 static Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case CreateAccountScreen.routeName :
      return MaterialPageRoute(builder: (_)=>const CreateAccountScreen());

    }
    return null;
  }
}