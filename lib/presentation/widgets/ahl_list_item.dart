import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class AhlListItem extends StatelessWidget {
  const AhlListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.trailingWidgetBuilder,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final WidgetBuilder? trailingWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    final stl = subtitle;
    final trailingBuilder = trailingWidgetBuilder;

    if (icon != null) {
      children.add(
        Container(
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(99.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Icon(icon, color: AhlColors.transBlack50),
          ),
        ),
      );
    }

    children.add(
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge),
              if (stl != null)
                Text(
                  stl,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AhlColors.transBlack50,
                  ),
                ),
            ],
          ),
        ),
      ),
    );

    if (trailingBuilder != null) {
      children.add(trailingBuilder(context));
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
