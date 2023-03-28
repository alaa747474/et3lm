import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/cubit/home_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
          child: BottomNavigationBar(
              onTap: (currentIndex) {
                context.read<HomeCubit>().changeIndex(currentIndex);
              },
              backgroundColor: Theme.of(context).cardColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).hintColor,
              selectedIconTheme: IconThemeData(size: 30.r),
              unselectedIconTheme: IconThemeData(size: 30.r),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: context.read<HomeCubit>().selectedIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: 'المواد الدراسية'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.question_mark), label: 'الإختبارات'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف الشخصي'),
              ]),
        );
      },
    );
  }
}
