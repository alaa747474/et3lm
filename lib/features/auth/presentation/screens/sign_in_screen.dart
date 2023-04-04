import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/core/utils/padding_extension.dart';
import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/core/widgets/custom_button.dart';
import 'package:e_learning_app/core/widgets/error_text.dart';
import 'package:e_learning_app/core/widgets/loading_indicator.dart';
import 'package:e_learning_app/features/auth/data/repository/auth_repository.dart';
import 'package:e_learning_app/features/auth/presentation/screens/create_account_screen.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:e_learning_app/features/home/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/cubit/auth_cubit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
 static const String routeName='/sign_in_screen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
          AuthRepository(FirebaseAuth.instance, FirebaseFirestore.instance)),
      child: Scaffold(
        appBar: const CustomAppBar(onPressed: null, text: 'تسجيل الدخول'),
        body: AppPadding(
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  ConstantStrings.authImage,
                  height: 270.h,
                 
                ),
              
                CustomAuthTextField(
                    title: 'البريد الإلكتروني',
                    hintText: 'البريد الإلكتروني',
                    controller: _emailController,
                    icon: Icons.mail),
                CustomAuthTextField(
                    obscure: true,
                    title: 'كلمة المرور',
                    hintText: '• • • • • • • •',
                    controller: _passwordController,
                    icon: Icons.lock),
                SizedBox(height: 20.h),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SingInDone) {
                      Navigator.pushReplacementNamed(context,HomeScreen.routeName);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthFaild) {
                      return ErrorText(text: state.error,);
                    }
                    if (state is AuthLoading) {
                      return const LoadingIndicator();
                    }
                    return CustomButtom(
                        onPressed: () {
                          context.read<AuthCubit>().signIn(
                              email: _emailController.text,
                              password: _passwordController.text);
                        },
                        text: 'تسجيل الدخول');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('ليس لديك حساب؟'),
                    TextButton(
                        onPressed: () => Navigator.pushNamed(
                            context, CreateAccountScreen.routeName),
                        child: Text(
                          'إنشاء حساب',
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ).horizontalPadding(),
      ),
    );
  }
}
