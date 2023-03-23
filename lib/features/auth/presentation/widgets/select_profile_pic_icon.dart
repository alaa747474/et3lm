import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectProfilePicIcon extends StatelessWidget {
  const SelectProfilePicIcon({super.key,required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).hintColor.withOpacity(0.2),
              radius: 50.r,
              child:  Center(child: Icon(Icons.person,color: Colors.white,size: 70.r,),),
            ),
            CircleAvatar(
              radius: 16.r,
              backgroundColor: Theme.of(context).primaryColor,
              child:const Center(child: Icon(Icons.add,color: Colors.white,),),
            )
          ],
        ),
      ),
    );
  }
}