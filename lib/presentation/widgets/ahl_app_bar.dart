import 'package:flutter/material.dart';

class AhlAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AhlAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 44.0,
        bottom: 16.0,
      ),
      child: Container(
        child: Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(93.0);
}
