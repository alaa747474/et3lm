import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/core/utils/padding_extension.dart';
import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/core/widgets/custom_button.dart';
import 'package:e_learning_app/core/widgets/loading_indicator.dart';
import 'package:e_learning_app/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/auth/data/repository/auth_repository.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/select_profile_pic_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});
  static const String routeName = '/create_account_screen';
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _universityIdController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
          AuthRepository(FirebaseAuth.instance, FirebaseFirestore.instance)),
      child: Scaffold(
          appBar: CustomAppBar(
              onPressed: () => Navigator.pop(context), text: 'إنشاء حساب'),
          body: AppPadding(
            SingleChildScrollView(
              child: Column(
                children: [
                  SelectProfilePicIcon(
                    onTap: () {},
                  ),
                  CustomAuthTextField(
                      title: 'الإسم',
                      hintText: 'الإسم كاملا',
                      controller: _nameController,
                      icon: Icons.person),
                  CustomAuthTextField(
                      title: 'الرقم الجامعي',
                      hintText: '00000000',
                      controller: _universityIdController,
                      icon: Icons.person),
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
                  CustomAuthTextField(
                      title: 'الهاتف',
                      hintText: 'رقم الهاتف المحمول',
                      controller: _phoneController,
                      icon: Icons.phone),
                  SizedBox(height: 20.h),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const LoadingIndicator();
                      }
                      if (state is CreateAccountDone) {
                        return const LoadingIndicator();
                      }
                      return CustomButtom(
                          onPressed: () {
                            context.read<AuthCubit>().createAccount(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                universityId: _universityIdController.text,
                                phoneNumber: _phoneController.text,
                                profilePic:
                                    'https://media.newyorker.com/photos/63826120196c8ef692b4eba5/3:4/w_1277,h_1703,c_limit/Ronaldo_WC22.png');
                          },
                          text: 'إنشاء حساب');
                    },
                  )
                ],
              ),
            ),
          ).horizontalPadding()),
    );
  }
}
