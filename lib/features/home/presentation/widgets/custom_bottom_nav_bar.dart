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
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r)
          ),
          child: BottomNavigationBar(
              onTap: (currentIndex) {
                context.read<HomeCubit>().changeIndex(currentIndex);
              },
              backgroundColor: Theme.of(context).cardColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).primaryColor,
              selectedIconTheme: IconThemeData(size: 30.r),
              unselectedIconTheme:IconThemeData(size: 30.r),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: context.read<HomeCubit>().selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home),
                    icon: Icon(Icons.home_outlined), label: ''),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                    icon: Icon(Icons.person_outline), label: ''),
              ]),
        );
      },
    );
  }
}
