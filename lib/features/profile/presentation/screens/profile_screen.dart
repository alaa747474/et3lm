import 'package:e_learning_app/core/animation/cubit/animation_cubit.dart';
import 'package:e_learning_app/core/utils/service_locator.dart';
import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/core/widgets/custom_button.dart';
import 'package:e_learning_app/core/widgets/error_text.dart';
import 'package:e_learning_app/core/widgets/loading_indicator.dart';
import 'package:e_learning_app/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/auth/data/repository/auth_repository.dart';
import 'package:e_learning_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:e_learning_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:e_learning_app/features/profile/data/repository/profile_repository.dart';
import 'package:e_learning_app/features/profile/presentation/screens/quiz_results_screen.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/profile_data_container.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/profile_pic_animated_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/user_data_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double padValue = 100;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnimationCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(getIt.get<ProfileRepository>())
            ..getProfileData(uid: FirebaseAuth.instance.currentUser!.uid),
        ),
        BlocProvider.value(
          value: AuthCubit(getIt.get<AuthRepository>()),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(text: 'بيانات الطالب', onPressed: null),
        body:  BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (previous, current) =>
                  (current != previous && current is ProfileDataLoaded),
              builder: (context, state) {
                if (state is ProfileDataLoading) {
                  return const LoadingIndicator();
                }
                if (state is ProfileDataLoaded) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<AnimationCubit>()
                                  .changeProfilePicSize();
                            },
                            child: ProfilePicAnimatedContainer(image: state.studentData.profilePic)
                          ),
                        ),
                        ProfileDataContainer(
                          child: Column(
                            children: [
                              UserDataRow(
                                text: state.studentData.name,
                                title: 'إسم الطالب :',
                              ),
                              UserDataRow(
                                  text: state.studentData.email,
                                  title: 'البريد الإلكترونى :'),
                              UserDataRow(
                                  text: state.studentData.phoneNumber,
                                  title: 'رقم الهاتف :'),
                              UserDataRow(
                                  text: state.studentData.universityId,
                                  title: 'الرقم الجامعي :'),
                              UserDataRow(
                                  text: state.studentData.level,
                                  title: 'المستوى الدراسى :')
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, QuizzesResultsScreen.routeName),
                          child: ProfileDataContainer(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'نتائج الإختبارات',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Icon(
                                Icons.quiz_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 40.r,
                              )
                            ],
                          )),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
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
                    ),
                  );
                }
                return const ErrorText();
          },
        ),
      ),
    );
  }
}
