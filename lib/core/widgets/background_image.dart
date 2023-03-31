import 'package:e_learning_app/core/constant/constants.dart';
import 'package:flutter/material.dart';


class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ConstantStrings.backgroundImage,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
