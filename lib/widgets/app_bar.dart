import 'package:flutter/material.dart';

import 'leading_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final LeadingWidget leading;
  final String title;
  final Color backgroundColor;
  final List<Widget> actions;


  const CustomAppBar({
    super.key,
    required this.title,
    required this.leading,
    required this.backgroundColor,
    required this.actions,
  });
  

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0.0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}