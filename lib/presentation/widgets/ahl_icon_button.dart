import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_tappable.dart';
import 'package:flutter/material.dart';

class AhlIconButton extends StatelessWidget {
  AhlIconButton({
    super.key,
    this.icon,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.hoveredIconColor = Colors.black,
    this.hoveredBackgroundColor = AhlColors.transBlack50,
    this.onPressed,
    this.builder,
  });

  IconData? icon;
  Color iconColor;
  Color backgroundColor;
  Color hoveredIconColor;
  Color hoveredBackgroundColor;
  VoidCallback? onPressed;
  WidgetBuilder? builder;

  @override
  Widget build(BuildContext context) {
    return AhlTappable(
      onPressed: onPressed,
      builder: (isPressed) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isPressed ? hoveredBackgroundColor : backgroundColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child:
              builder?.call(context) ??
              Icon(
                icon,
                size: 24,
                color: isPressed ? hoveredIconColor : iconColor,
              ),
        );
      },
    );
  }
}
