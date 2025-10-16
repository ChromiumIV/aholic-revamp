import 'package:aholic/presentation/sheets/ahl_selection_box_sheet.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_tappable.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

typedef SelectionBoxItemBuilder<T> = Widget Function(T item);
typedef OnItemSelected<T> = void Function(T selectedItem);

class AhlSelectionBox<T> extends StatefulWidget {
  const AhlSelectionBox(
    this.items, {
    super.key,
    this.selectedItem,
    this.previewBuilder,
    this.builder,
    this.label,
    this.title,
    this.onSelected,
    this.color = Colors.black,
    this.previewFillColor = AhlColors.transBlack12,
    this.previewHoveredFillColor,
    this.backgroundColor = AhlColors.transBlack12,
    this.hoveredBackgroundColor = AhlColors.transBlack20,
    this.padding = const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
    this.isScrollControlled = false,
  });

  final List<T> items;
  final T? selectedItem;
  final SelectionBoxItemBuilder<T>? previewBuilder;
  final SelectionBoxItemBuilder<T>? builder;
  final String? label;
  final String? title;
  final EdgeInsets padding;
  final OnItemSelected<T>? onSelected;
  final Color color;
  final Color backgroundColor;
  final Color hoveredBackgroundColor;
  final Color previewFillColor;
  final Color? previewHoveredFillColor;
  final bool isScrollControlled;

  @override
  State<AhlSelectionBox<T>> createState() => _AhlSelectionBoxState<T>();
}

class _AhlSelectionBoxState<T> extends State<AhlSelectionBox<T>> {
  T? _selectedItem;

  @override
  void initState() {
    setState(() {
      _selectedItem = widget.selectedItem;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l = widget.label;

    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (l != null)
            Padding(
              padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
              child: Text(
                l,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AhlColors.transBlack50),
              ),
            ),
          AhlTappable(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: widget.isScrollControlled,
                builder: (context) {
                  return AhlSelectionBoxSheet<T>(
                    widget.items,
                    selectedItem: _selectedItem,
                    title: widget.title,
                    builder: widget.builder,
                    shrinkWrap: widget.isScrollControlled,
                    onSelected: (selectedItem) {
                      setState(() {
                        _selectedItem = selectedItem;
                      });
                      widget.onSelected?.call(selectedItem);
                    },
                    color: widget.color,
                  );
                },
              );
            },
            builder: (isPressed) => Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    color: widget.previewHoveredFillColor == null
                        ? widget.previewFillColor
                        : (isPressed
                              ? widget.previewHoveredFillColor
                              : widget.previewFillColor),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(child: _buildItem(context)),
                        SizedBox(width: 12),
                        Icon(
                          LucideIcons.chevronDown500,
                          color: AhlColors.transBlack50,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                      color: widget.previewHoveredFillColor != null
                          ? Colors.transparent
                          : (isPressed
                                ? AhlColors.transBlack12
                                : Colors.transparent),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    final b = widget.previewBuilder ?? widget.builder;
    final i = _selectedItem;

    if (b != null && i != null) {
      return b.call(i);
    }

    return Text(
      i?.toString() ?? "",
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
