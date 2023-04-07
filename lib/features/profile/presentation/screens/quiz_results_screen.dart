import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/core/widgets/loading_indicator.dart';
import 'package:e_learning_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/profile_data_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizzesResultsScreen extends StatefulWidget {
  const QuizzesResultsScreen({super.key});
  static const String routeName = '/quizzes_results_screen';

  @override
  State<QuizzesResultsScreen> createState() => _QuizzesResultsScreenState();
}

class _QuizzesResultsScreenState extends State<QuizzesResultsScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().getAllQuizzesResults(
        uid: context.read<ProfileCubit>().getCurrentUserUid());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            text: 'النتائج',
            onPressed: () {
              //context.read<ProfileCubit>().getProfileData(uid:  context.read<ProfileCubit>().getCurrentUserUid());
              Navigator.pop(context);
            }),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen: (previous, current) =>
              (current != previous && current is QuizzesResultsLoaded),
          builder: (context, state) {
            if (state is ProfileDataLoading) {
              return const LoadingIndicator();
            }
            if (state is QuizzesResultsLoaded) {
              return ListView.builder(
                itemCount: state.quizzesResults.length,
                itemBuilder: (BuildContext context, int index) {
                  double quizPercentage = state.quizzesResults[index].score /
                      state.quizzesResults[index].total *
                      100;

                  return ProfileDataContainer(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'المادة : ${state.quizzesResults[index].subjectName}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'الدرجة : ${state.quizzesResults[index].score.toInt()}/${state.quizzesResults[index].total.toInt()}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'النسبة المئوية : ${quizPercentage.toInt()}%',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      Image.network(
                        ConstantStrings.quizResultImage,
                        width: 110.w,
                      ),
                    ],
                  ));
                },
              );
            }
            return Container();
          },
        ));
  }
}
