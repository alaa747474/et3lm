import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback? onPressed;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 45.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.onPressed == null
          ? const SizedBox()
          : IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        widget.text,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
