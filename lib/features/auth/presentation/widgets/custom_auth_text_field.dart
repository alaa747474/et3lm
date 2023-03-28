import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({super.key, required this.title, required this.hintText, required this.controller, this.validator, required this.icon,this.obscure=false});
  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData icon;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h,),
        Text(title,style: Theme.of(context).textTheme.titleLarge,),
        TextFormField(
          
          obscureText: obscure,
          controller: controller,
          validator: validator,
          cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.r),
          filled: true,
          prefixIcon: Icon(icon,color: Theme.of(context).hintColor,),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none
          )
        ),
        )
      ],
    );
  }
}