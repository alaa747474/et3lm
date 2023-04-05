import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField(
      {super.key,
      this.keyboardType,
      required this.title,
      required this.hintText,
      required this.controller,
      this.validator,
      required this.icon,
      this.obscure = false});
  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData icon;
  final bool obscure;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          obscureText: obscure,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.r),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              prefixIcon: Icon(
                icon,
                color: Theme.of(context).hintColor,
              ),
              hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none)),
        )
      ],
    );
  }
}
