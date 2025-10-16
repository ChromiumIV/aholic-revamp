import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:flutter/material.dart';

class AhlTextButton extends StatefulWidget {
  const AhlTextButton(this.label, {super.key, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  State<AhlTextButton> createState() => _AhlTextButtonState();
}

class _AhlTextButtonState extends State<AhlTextButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() {
        _isPressed = true;
      }),
      onTapUp: (_) => setState(() {
        _isPressed = false;
      }),
      onTapCancel: () => setState(() {
        _isPressed = false;
      }),
      onTap: () => widget.onPressed?.call(),
      child: Container(
        decoration: BoxDecoration(
          color: _isPressed ? AhlColors.transBlack08 : Colors.white,
          border: Border.all(color: AhlColors.transBlack12, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.17),
        ),
      ),
    );
  }
}
