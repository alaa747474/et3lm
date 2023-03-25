import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/core/utils/padding_extension.dart';
import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/features/subjects/presentation/widgets/subject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/cubit/subject_cubit.dart';
import '../../data/repository/subject_repository.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});
  static const String routeName = '/subjects_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubjectCubit(SubjectRepository(FirebaseFirestore.instance))..getAllSubjects(),
      child: Scaffold(
        appBar: const CustomAppBar(text: 'المواد الدراسية', onPressed: null),
        body: AppPadding(BlocBuilder<SubjectCubit, SubjectState>(
          builder: (context, state) {
            if (state is SubjectsLoaded) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.r,
                    mainAxisSpacing: 15.r),
                itemCount: state.subjects.length,
                itemBuilder: (BuildContext context, int index) {
                  return SubjectContainer(subject: state.subjects[index]);
                },
              );
            }
            return Container();
          },
        )).horizontalPadding(),
      ),
    );
  }
}
