import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.discreteCircle(
            color: Theme.of(context).primaryColor,
            size: 50.r,
            secondRingColor: Theme.of(context).primaryColor.withOpacity(0.8),
            thirdRingColor: Theme.of(context).primaryColor.withOpacity(0.2)));
  }
}
