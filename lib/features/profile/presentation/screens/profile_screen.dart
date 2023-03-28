import 'package:e_learning_app/core/utils/service_locator.dart';
import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/core/widgets/custom_button.dart';
import 'package:e_learning_app/core/widgets/loading_indicator.dart';
import 'package:e_learning_app/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/auth/data/repository/auth_repository.dart';
import 'package:e_learning_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:e_learning_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:e_learning_app/features/profile/data/repository/profile_repository.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/profile_data_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProfileCubit(getIt.get<ProfileRepository>())..getProfileData(),
        ),
        BlocProvider.value(
         value: AuthCubit(getIt.get<AuthRepository>()),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(text: 'بيانات الطالب', onPressed: null),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileDataLoading) {
              return const LoadingIndicator();
            }
            if (state is ProfileDataLoaded) {
              return Column(
                children: [
                  ProfileDataContainer(studentData: state.studentData),
                  SizedBox(height: 10.h,),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is SingOutDone) {
                        Navigator.pushReplacementNamed(
                            context, SignInScreen.routeName);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const LoadingIndicator();
                      }
                      return CustomButtom(
                          onPressed: () {
                            context.read<AuthCubit>().signOut();
                          },
                          text: 'Sign out');
                    },
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
