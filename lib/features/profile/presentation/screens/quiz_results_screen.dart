import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizzesResultsScreen extends StatefulWidget {
  const QuizzesResultsScreen({super.key});
 static const String routeName='/quizzes_results_screen';

  @override
  State<QuizzesResultsScreen> createState() => _QuizzesResultsScreenState();
}

class _QuizzesResultsScreenState extends State<QuizzesResultsScreen> {
  @override
  void initState() {
     context.read<ProfileCubit>().getAllQuizzesResults();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: CustomAppBar(text: 'النتائج', onPressed: (){
          context.read<ProfileCubit>().getProfileData();
          Navigator.pop(context);}),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is QuizzesResultsLoaded) {
              return Text(state.quizzesResults[0].score.toString());
            }
            return  Container();
          },
        )
    );
  }
}