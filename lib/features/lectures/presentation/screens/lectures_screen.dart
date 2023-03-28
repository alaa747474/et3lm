import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/core/widgets/loading_indicator.dart';
import 'package:e_learning_app/features/lectures/business_logic/cubit/lectures_cubit.dart';
import 'package:e_learning_app/features/lectures/presentation/widgets/lecture_container.dart';
import 'package:e_learning_app/features/subjects/data/model/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LecturesScreen extends StatelessWidget {
  const LecturesScreen({super.key, required this.subject});
  final Subject subject;
static const String routeName='/lectures_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'المحاضرات', onPressed: ()=>Navigator.pop(context)),
      body: BlocBuilder<LecturesCubit, LecturesState>(
        builder: (context, state) {
          if (state is LecturesLoading) {
            return const LoadingIndicator();
          }
          if (state is LecturesLoaded) {
            if (state.lectures.isEmpty) {
              return Center(
                child: Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AspectRatio(aspectRatio: 15/10,child: Image.network(ConstantStrings.sadEmoji)),
                    Text('لا توجد محاضرات الأن !',style: Theme.of(context).textTheme.labelLarge,),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: state.lectures.length,
              itemBuilder: (BuildContext context, int index) {
                return LectureContainer(lecture: state.lectures[index],);
              },
            );
          }
          return Container();
        },
      )
    );
  }
}