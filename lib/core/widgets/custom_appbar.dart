import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar(
      {super.key, required this.text, required this.onPressed, this.actions});
  final String text;
  final VoidCallback? onPressed;
  final List<Widget>? actions;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 55.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: AppBar(
        actions: widget.actions ?? [],
        leading: widget.onPressed == null
            ? const SizedBox()
            : IconButton(
                onPressed: widget.onPressed,
                icon: const Icon(
                  Icons.arrow_back,
                )),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          widget.text,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
