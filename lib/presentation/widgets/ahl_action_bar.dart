import 'dart:math';

import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_icon_button.dart';
import 'package:aholic/presentation/widgets/ahl_text.dart';
import 'package:flutter/material.dart';

typedef LeadingWidgetBuilder = Widget Function(BuildContext context);

class AhlActionBar extends StatelessWidget {
  AhlActionBar({
    super.key,
    this.leadingWidgetBuilder,
    this.trailingIcon,
    this.onTrailingBtnClick,
  });

  LeadingWidgetBuilder? leadingWidgetBuilder;
  IconData? trailingIcon;
  VoidCallback? onTrailingBtnClick;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "ahl_action_bar",
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: AhlColors.transBlack90,
        ),
        clipBehavior: Clip.antiAlias,
        child: IntrinsicHeight(child: Row(children: _buildChildren(context))),
      ),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    var children = <Widget>[];

    final lwb = leadingWidgetBuilder;
    if (lwb != null) {
      children.add(lwb(context));
    }

    children.add(Expanded(child: Container()));

    final ticn = trailingIcon;
    if (ticn != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: VerticalDivider(
            thickness: 2.0,
            width: 2.0,
            color: AhlColors.transWhite20,
          ),
        ),
      );

      children.add(
        AhlIconButton(
          ticn,
          iconColor: Colors.white,
          hoveredIconColor: Colors.white,
          onPressed: () => {},
        ),
      );
    }

    return children;
  }
}
