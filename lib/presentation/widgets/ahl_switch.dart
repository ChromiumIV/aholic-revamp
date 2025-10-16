import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:flutter/material.dart';

enum SwitchLabelDirection { left, right }

class AhlSwitch extends StatefulWidget {
  const AhlSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor = AhlColors.transBlack12,
    this.inactiveColor = AhlColors.transBlack08,
    this.thumbColor = Colors.black,
    this.inactiveThumbColor = AhlColors.transBlack30,
    this.width = 46.0,
    this.height = 28.0,
    this.label,
    this.labelDirection = SwitchLabelDirection.left,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final Color inactiveThumbColor;
  final double width;
  final double height;
  final String? label;
  final SwitchLabelDirection labelDirection;

  @override
  State<AhlSwitch> createState() => _AhlSwitchState();
}

class _AhlSwitchState extends State<AhlSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (widget.value) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(AhlSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.onChanged != null) {
      widget.onChanged!(!widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final thumbSize = widget.height - 8; // Padding of 4 on each side
    final trackWidth = widget.width;

    return GestureDetector(
      onTap: _handleTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.label != null &&
              widget.labelDirection == SwitchLabelDirection.left)
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: _buildLabel(context),
            ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                width: trackWidth,
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.height / 2),
                  color: Color.lerp(
                    widget.inactiveColor,
                    widget.activeColor,
                    _animation.value,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: _animation.value * (trackWidth - thumbSize - 8) + 4,
                      top: 4,
                      child: Container(
                        width: thumbSize,
                        height: thumbSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.value
                              ? widget.thumbColor
                              : widget.inactiveThumbColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          if (widget.label != null &&
              widget.labelDirection == SwitchLabelDirection.right)
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: _buildLabel(context),
            ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      widget.label ?? "",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: widget.value ? Colors.black : AhlColors.transBlack50,
      ),
    );
  }
}
