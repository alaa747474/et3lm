import 'dart:io';

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
import 'package:uuid/uuid.dart';

import '../../../home/presentation/screens/home_screen.dart';

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
  File? image;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
          AuthRepository(FirebaseAuth.instance,)),
      child: Scaffold(
        appBar: CustomAppBar(
            onPressed: () => Navigator.pop(context), text: 'إنشاء حساب'),
        body: AppPadding(
          SingleChildScrollView(
            child: Column(
              children: [
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is ProfilePicPicked) {
                      context.read<AuthCubit>().profilePic=state.profilePic;
                      context.read<AuthCubit>().getProfilePicUrl(
                          file: state.profilePic,
                          imagePath: 'profilPic${const Uuid().v1()}');
                    }
                  },
                  builder: (context, state) {
                    if (state is ProfilePicPicked) {
                      image=state.profilePic;
                     return CircleAvatar(
                      radius: 50.r,
                        backgroundImage: FileImage(context.read<AuthCubit>().profilePic!),
                      );
                    }
                    if(state is ProfilePicUrlLoaded){
                      return CircleAvatar(
                      radius: 50.r,
                        backgroundImage: FileImage(context.read<AuthCubit>().profilePic!),
                      );
                    }
                    
                    if (state is AuthLoading) {
                      return CircleAvatar(
                      radius: 50.r,
                        backgroundImage: FileImage(context.read<AuthCubit>().profilePic!),
                      );
                    }

                    return SelectProfilePicIcon(
                      onTap: () {
                        context.read<AuthCubit>().pickProfilePic();
                      },
                    );
                  },
                ),
                CustomAuthTextField(
                    title: 'الإسم',
                    hintText: 'الإسم كاملا',
                    controller: _nameController,
                    icon: Icons.person),
                CustomAuthTextField(
                    keyboardType: TextInputType.number,
                    title: 'الرقم الجامعي',
                    hintText: '00000000',
                    controller: _universityIdController,
                    icon: Icons.person),
                CustomAuthTextField(
                    keyboardType: TextInputType.emailAddress,
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
                    keyboardType: TextInputType.phone,
                    title: 'الهاتف',
                    hintText: 'رقم الهاتف المحمول',
                    controller: _phoneController,
                    icon: Icons.phone),
                SizedBox(height: 20.h),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {

                    if (state is AuthFaild) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                    if (state is CreateAccountDone) {
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const LoadingIndicator();
                    }

                    return CustomButtom(
                        onPressed: () {
                          if (state is ProfilePicUrlLoaded) {
                            context.read<AuthCubit>().createAccount(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                universityId: _universityIdController.text,
                                phoneNumber: _phoneController.text,
                                profilePic: state.profilePicUrl,
                                level: '003');
                          }
                        },
                        text: 'إنشاء حساب');
                  },
                ),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ).horizontalPadding(),
      ),
    );
  }
}
