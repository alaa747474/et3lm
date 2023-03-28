import 'package:e_learning_app/features/auth/data/model/user_model.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/user_data_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDataContainer extends StatelessWidget {
  const ProfileDataContainer({super.key, required this.studentData});
  final UserModel studentData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 50.r,
            backgroundImage: NetworkImage(studentData.profilePic),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.only(right: 15.w, left: 15.w, top: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              UserDataRow(
                text: studentData.name,
                title: 'إسم الطالب :',
              ),
              UserDataRow(text: studentData.email, title: 'البريد الإلكترونى :'),
              UserDataRow(text: studentData.phoneNumber, title: 'رقم الهاتف :'),
              UserDataRow(
                  text: studentData.universityId, title: 'الرقم الجامعي :'),
              UserDataRow(text: studentData.level, title: 'المستوى الدراسى :')
            ],
          ),
        ),
      ],
    );
  }
}
