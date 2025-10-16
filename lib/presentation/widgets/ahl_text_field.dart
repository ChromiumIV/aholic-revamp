import 'package:flutter/material.dart';

import '../theme/ahl_colors.dart';

class AhlTextField extends StatefulWidget {
  const AhlTextField({
    Key? key,
    this.autofocus = false,
    this.fillColor = AhlColors.transBlack08,
    this.textColor = Colors.black,
    this.hintColor = AhlColors.transBlack50,
    this.underlineColor,
    this.focusedUnderlineColor,
    this.hintText,
    this.isEnabled = true,
    this.obscureText = false,
    this.onTextChanged,
    this.selectAllOnFocus = true,
    this.value,
    this.padding = const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12),
    this.keyboardType,
    this.minLines,
    this.maxLines,
    this.style,
    this.label,
  }) : super(key: key);

  final bool autofocus;
  final Color fillColor;
  final Color textColor;
  final Color hintColor;
  final Color? underlineColor;
  final Color? focusedUnderlineColor;
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
  final TextStyle? style;
  final String? label;

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
    final l = widget.label;

    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: widget.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (l != null)
              Padding(
                padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
                child: Text(
                  l,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AhlColors.transBlack50,
                  ),
                ),
              ),
            Focus(
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
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.underlineColor != null ? 0 : 8),
                  ),
                  border: widget.underlineColor != null
                      ? Border(
                          bottom: BorderSide(
                            color:
                                (_isFocused
                                    ? widget.focusedUnderlineColor
                                    : widget.underlineColor) ??
                                Colors.transparent,
                            width: 2.0,
                          ),
                        )
                      : Border.all(
                          color: _isFocused
                              ? widget.textColor
                              : Colors.transparent,
                          width: 2.0,
                        ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: widget.underlineColor != null ? 0 : 12.0,
                  ),
                  child: TextField(
                    autofocus: widget.autofocus,
                    controller: _controller,
                    keyboardType: widget.keyboardType,
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,
                    cursorColor: widget.textColor,
                    style:
                        (widget.style ?? Theme.of(context).textTheme.bodyLarge)
                            ?.copyWith(color: widget.textColor),
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: _isFocused ? '' : widget.hintText,
                      hintStyle:
                          (widget.style ??
                                  Theme.of(context).textTheme.bodyLarge)
                              ?.copyWith(color: widget.hintColor),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    obscureText: widget.obscureText,
                    enabled: widget.isEnabled,
                    onChanged: widget.onTextChanged,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
