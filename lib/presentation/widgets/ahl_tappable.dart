import 'package:flutter/material.dart';

typedef TappableBuilder = Widget Function(bool isPressed);

class AhlTappable extends StatefulWidget {
  const AhlTappable({
    super.key,
    required this.builder,
    this.onPressed,
    this.minPressDuration = const Duration(milliseconds: 100),
  });

  final TappableBuilder builder;
  final VoidCallback? onPressed;
  final Duration minPressDuration;

  @override
  State<AhlTappable> createState() => _AhlTappableState();
}

class _AhlTappableState extends State<AhlTappable> {
  bool _isPressed = false;
  DateTime? _pressStartTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _pressStartTime = DateTime.now();
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        _handleTapEnd();
      },
      onTapCancel: () {
        _handleTapEnd();
      },
      onTap: widget.onPressed,
      child: widget.builder(_isPressed),
    );
  }

  void _handleTapEnd() {
    if (_pressStartTime == null) {
      setState(() {
        _isPressed = false;
      });
      return;
    }

    final elapsed = DateTime.now().difference(_pressStartTime!);
    final remaining = widget.minPressDuration - elapsed;

    if (remaining.isNegative) {
      // Already exceeded minimum duration
      setState(() {
        _isPressed = false;
      });
    } else {
      // Delay the state change to meet minimum duration
      Future.delayed(remaining, () {
        if (mounted) {
          setState(() {
            _isPressed = false;
          });
        }
      });
    }

    _pressStartTime = null;
  }
}
