import 'package:flutter/material.dart';

import '../theme/ahl_colors.dart';

class AhlTextField extends StatefulWidget {
  const AhlTextField({
    Key? key,
    this.autofocus = false,
    this.fillColor = AhlColors.transBlack08,
    this.textColor = Colors.black,
    this.hintColor = AhlColors.transBlack50,
    this.hintText,
    this.isEnabled = true,
    this.obscureText = false,
    this.onTextChanged,
    this.selectAllOnFocus = true,
    this.value,
    this.padding = const EdgeInsets.only(bottom: 12),
    this.keyboardType,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  final bool autofocus;
  final Color fillColor;
  final Color textColor;
  final Color hintColor;
  final String? hintText;
  final bool isEnabled;
  final bool obscureText;
  final void Function(String)? onTextChanged;
  final bool selectAllOnFocus;
  final String? value;
  final EdgeInsets padding;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;

  @override
  State<AhlTextField> createState() => _AhlTextFieldState();
}

class _AhlTextFieldState extends State<AhlTextField> {
  final _controller = TextEditingController();

  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    if (widget.value != null) {
      _controller.text = widget.value!;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: widget.padding,
        child: Focus(
          onFocusChange: (hasFocus) {
            if (hasFocus && widget.selectAllOnFocus) {
              _controller.selection = TextSelection(
                baseOffset: 0,
                extentOffset: _controller.text.length,
              );
            }
            setState(() {
              _isFocused = hasFocus;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: widget.fillColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: _isFocused ? widget.textColor : Colors.transparent,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextField(
                autofocus: widget.autofocus,
                controller: _controller,
                keyboardType: widget.keyboardType,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                cursorColor: widget.textColor,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: widget.textColor),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: _isFocused ? '' : widget.hintText,
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: widget.hintColor),
                  border: InputBorder.none,
                ),
                obscureText: widget.obscureText,
                enabled: widget.isEnabled,
                onChanged: widget.onTextChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
