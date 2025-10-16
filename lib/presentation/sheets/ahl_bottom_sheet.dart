import 'package:flutter/material.dart';

class AhlBottomSheet extends StatelessWidget {
  const AhlBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.padding = const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
  });

  final Widget child;
  final String? title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final t = title;

    return Container(
      color: Colors.white,
      child: t != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: padding,
                  child: Text(
                    t,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Expanded(child: child),
              ],
            )
          : child,
    );
  }
}
