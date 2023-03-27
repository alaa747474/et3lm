import 'package:e_learning_app/core/constant/constants.dart';
import 'package:e_learning_app/features/lectures/data/model/lecture.dart';
import 'package:e_learning_app/features/lectures/presentation/screens/lecture_pdf_viewr_screen.dart';
import 'package:e_learning_app/features/lectures/presentation/screens/lecture_video_viewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureContainer extends StatelessWidget {
  const LectureContainer({super.key, required this.lecture});
  final Lecture lecture;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    lecture.name!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, LecturePdfViewerScreen.routeName,
                            arguments: lecture);
                      },
                      child: Image.asset(
                        ConstantStrings.pdfImage,
                        width: 60.r,
                        height: 60.r,
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, LectureVideoViewerScreen.routeName,
                            arguments: lecture);
                      },
                      child: Image.asset(
                        ConstantStrings.videoImage,
                        width: 60.r,
                        height: 60.r,
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
