import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/animation/cubit/animation_cubit.dart';

class ProfilePicAnimatedContainer extends StatelessWidget {
  const ProfilePicAnimatedContainer({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimationCubit, AnimationState>(
      builder: (context, state) {
        return AnimatedSize(
          duration: const Duration(seconds: 1),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            height: context.read<AnimationCubit>().height.toDouble().r,
            width: context.read<AnimationCubit>().width.toDouble().r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    context.read<AnimationCubit>().radius.toDouble().r),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
          ),
        );
      },
    );
  }
}
