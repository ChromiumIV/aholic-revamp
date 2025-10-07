import 'package:flutter/material.dart';

class AhlText extends StatelessWidget {
  const AhlText(this.data, {super.key, this.style});

  final String data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(data, style: style ?? Theme.of(context).textTheme.bodyLarge);
  }
}
