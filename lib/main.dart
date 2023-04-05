
import 'package:e_learning_app/core/router/app_router.dart';
import 'package:e_learning_app/core/utils/service_locator.dart';
import 'package:e_learning_app/core/utils/theme.dart';
import 'package:e_learning_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:e_learning_app/features/home/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("ar"),
          ],
          locale: const Locale("ar"),
          onGenerateRoute: AppRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'Et3lm',
          theme: AppTheme.theme(),
          initialRoute:FirebaseAuth.instance.currentUser!=null?HomeScreen.routeName:SignInScreen.routeName,
        );
      },
    );
  }
}

