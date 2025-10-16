import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

typedef OnSubmitted = void Function(String keyword);

class AhlSearchBar extends StatefulWidget {
  const AhlSearchBar({super.key, this.value, this.onSubmitted});

  final String? value;
  final OnSubmitted? onSubmitted;

  @override
  State<AhlSearchBar> createState() => _AhlSearchBarState();
}

class _AhlSearchBarState extends State<AhlSearchBar> {
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
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _isFocused = hasFocus;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            color: AhlColors.transBlack08,
            border: Border.all(
              color: _isFocused ? Colors.black : Colors.transparent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Icon(
                  LucideIcons.search400,
                  color: _isFocused ? Colors.black : AhlColors.transBlack50,
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      widget.onSubmitted?.call(value);
                    },
                    style: Theme.of(context).textTheme.bodyLarge,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      counterText: '',
                      hintText: _isFocused ? '' : "Search",
                      hintStyle: Theme.of(context).textTheme.bodyLarge
                          ?.copyWith(color: AhlColors.transBlack50),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
