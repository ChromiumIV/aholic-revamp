import 'package:flutter/material.dart';

class AhlDisabledView extends StatelessWidget {
  const AhlDisabledView(this.isDisabled, {super.key, required this.child});

  final bool isDisabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisabled,
      child: Opacity(opacity: isDisabled ? 0.5 : 1, child: child),
    );
  }
}
