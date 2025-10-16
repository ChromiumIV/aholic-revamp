import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ahl_tab_layout.freezed.dart';

enum TabLayoutType { primary, secondary }

enum TabLayoutMode { light, dark }

typedef OnTabItemSelected = void Function(TabItem item);

@freezed
abstract class TabItem with _$TabItem {
  const factory TabItem({
    required String title,
    @Default(Colors.black) Color titleColor,
    @Default(AhlColors.transBlack50) Color inactiveTitleColor,
    Icon? icon,
  }) = _TabItem;
}

class AhlTabLayout extends StatefulWidget {
  const AhlTabLayout({
    super.key,
    required this.items,
    this.initialIndex = 0,
    this.type = TabLayoutType.primary,
    this.mode = TabLayoutMode.light,
    this.onSelected,
  });

  final List<TabItem> items;
  final int initialIndex;
  final TabLayoutType type;
  final TabLayoutMode mode;
  final OnTabItemSelected? onSelected;

  @override
  State<AhlTabLayout> createState() => _AhlTabLayoutState();
}

class _AhlTabLayoutState extends State<AhlTabLayout> {
  TabItem? _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.items.elementAtOrNull(widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == TabLayoutType.secondary) {
      return _buildSecondaryTabLayout(context);
    }

    return _buildPrimaryTabLayout(context);
  }

  Widget _buildPrimaryTabLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: AhlColors.transBlack12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: widget.items
                .map((i) => _buildPrimaryItem(context, i))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryTabLayout(BuildContext context) {
    return Row(
      children: widget.items
          .map((i) => _buildSecondaryItem(context, i))
          .toList(),
    );
  }

  Widget _buildPrimaryItem(BuildContext context, TabItem item) {
    final isSelected = _selectedItem == item;

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          if (!isSelected) {
            setState(() {
              _selectedItem = item;
            });
            widget.onSelected?.call(item);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 3.0,
                color: isSelected ? Colors.black : Colors.transparent,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 9.0),
            child: Text(
              item.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isSelected ? item.titleColor : item.inactiveTitleColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryItem(BuildContext context, TabItem item) {
    final isSelected = _selectedItem == item;

    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          if (!isSelected) {
            setState(() {
              _selectedItem = item;
            });
            widget.onSelected?.call(item);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: isSelected ? AhlColors.transWhite20 : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text(
              item.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isSelected ? item.titleColor : item.inactiveTitleColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
