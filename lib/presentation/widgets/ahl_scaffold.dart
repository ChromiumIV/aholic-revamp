import 'package:aholic/presentation/widgets/ahl_text.dart';
import 'package:flutter/material.dart';

class AhlScaffold extends StatelessWidget {
  const AhlScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.actionBar,
    this.bottomNavigationBar,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? actionBar;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [body, actionBar ?? Container()],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
