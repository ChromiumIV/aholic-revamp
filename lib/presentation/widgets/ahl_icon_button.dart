import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:flutter/material.dart';

class AhlIconButton extends StatefulWidget {
  AhlIconButton(
    this.icon, {
    super.key,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.hoveredIconColor = Colors.black,
    this.hoveredBackgroundColor = AhlColors.transBlack50,
    this.onPressed,
  });

  final IconData icon;
  Color iconColor;
  Color backgroundColor;
  Color hoveredIconColor;
  Color hoveredBackgroundColor;
  VoidCallback? onPressed;

  @override
  State<AhlIconButton> createState() => _AhlIconButtonState();
}

class _AhlIconButtonState extends State<AhlIconButton> {
  Color? _backgroundColor;
  Color? _iconColor;

  @override
  void initState() {
    super.initState();

    setState(() {
      _backgroundColor = widget.backgroundColor;
      _iconColor = widget.iconColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _backgroundColor = widget.hoveredBackgroundColor;
          _iconColor = widget.hoveredIconColor;
        });
      },
      onTapUp: (details) {
        setState(() {
          _backgroundColor = widget.backgroundColor;
          _iconColor = widget.iconColor;
        });
      },
      onTapCancel: () {
        setState(() {
          _backgroundColor = widget.backgroundColor;
          _iconColor = widget.iconColor;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Icon(widget.icon, size: 24, color: _iconColor),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );

    // return IconButton(
    //   onPressed: () {
    //     setState(() {
    //       final bc = widget.backgroundColor;
    //       if (bc != null) {
    //         _backgroundColor = widget.backgroundColor;
    //       }
    //       final hic =
    //       if ( != null) {
    //         _iconColor = widget.hoveredIconColor;
    //       }
    //     });

    //   },
    //   icon: Icon(widget.icon, color: widget.iconColor),
    // );
  }
}
