import 'package:flutter/material.dart';

class AhlScaffold extends StatelessWidget {
  const AhlScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.actionBar,
    this.bottomNavigationBar,
    this.backgroundColor = Colors.white,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? actionBar;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      // body: body,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: actionBar != null ? 48.0 : 0.0),
            child: body,
          ),
          actionBar ?? Container(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
