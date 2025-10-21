import 'dart:math';

import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_icon_button.dart';
import 'package:aholic/presentation/widgets/ahl_text.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

class AhlActionBar extends StatelessWidget {
  AhlActionBar({
    super.key,
    this.leadingIcon,
    this.trailingIcon,
    this.onLeadingBtnClick,
    this.leadingWidgetBuilder,
    this.trailingWidgetBuilder,
    this.onTrailingBtnClick,
    this.padding = const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 33.0),
    this.fillColor = AhlColors.transBlack81,
    this.iconColor = Colors.white,
    this.dividerColor = AhlColors.transWhite20,
    this.hasShadow = true,
  });

  WidgetBuilder? leadingWidgetBuilder;
  WidgetBuilder? trailingWidgetBuilder;
  IconData? leadingIcon;
  IconData? trailingIcon;
  VoidCallback? onLeadingBtnClick;
  VoidCallback? onTrailingBtnClick;
  EdgeInsets padding;
  Color fillColor;
  Color iconColor;
  Color dividerColor;
  bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "ahl_action_bar",
      child: Padding(
        padding: padding,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: fillColor,
            boxShadow: [
              if (hasShadow)
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: IntrinsicHeight(child: Row(children: _buildChildren(context))),
        ),
      ),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    var children = <Widget>[];

    final lwb = leadingWidgetBuilder;
    final licn = leadingIcon;

    if (licn != null) {
      children.add(
        AhlIconButton(
          icon: licn,
          iconColor: iconColor,
          hoveredIconColor: iconColor,
          onPressed: () {
            onLeadingBtnClick?.call();
          },
        ),
      );
      children.add(Spacer());
    }
    if (lwb != null) {
      children.add(lwb(context));
    }

    if (lwb == null && licn == null) {
      children.add(Expanded(child: Container()));
    }

    final twb = trailingWidgetBuilder;
    final ticn = trailingIcon;

    if (twb != null || ticn != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: VerticalDivider(
            thickness: 2.0,
            width: 2.0,
            color: dividerColor,
          ),
        ),
      );
    }

    if (twb != null) {
      children.add(twb(context));
    } else if (ticn != null) {
      children.add(
        AhlIconButton(
          icon: ticn,
          iconColor: iconColor,
          hoveredIconColor: iconColor,
          onPressed: () {
            onTrailingBtnClick?.call();
          },
        ),
      );
    }

    return children;
  }
}
