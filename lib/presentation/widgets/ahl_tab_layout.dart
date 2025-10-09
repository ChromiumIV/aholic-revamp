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
    return Row(
      children: widget.items.map((i) => _buildItem(context, i)).toList(),
    );
  }

  Widget _buildItem(BuildContext context, TabItem item) {
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
