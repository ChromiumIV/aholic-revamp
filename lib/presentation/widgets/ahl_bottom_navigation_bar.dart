import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ahl_bottom_navigation_bar.freezed.dart';

typedef BottomNavigationItemBuilder =
    Widget Function(BuildContext context, bool isActive);

typedef OnBottomNavigationItemChanged = void Function(int index);

@freezed
abstract class BottomNavigationItem with _$BottomNavigationItem {
  @Assert(
    'icon != null || builder != null',
    'icon or builder must either be non-null',
  )
  const factory BottomNavigationItem({
    IconData? icon,
    BottomNavigationItemBuilder? builder,
    @Default(Colors.black) Color iconColor,
    @Default(AhlColors.transBlack20) Color inactiveIconColor,
  }) = _BottomNavigationItem;
}

class AhlBottomNavigationBar extends StatefulWidget {
  const AhlBottomNavigationBar({
    super.key,
    required this.items,
    this.initialIndex = 0,
    this.onChanged,
  });

  final List<BottomNavigationItem> items;
  final int initialIndex;
  final OnBottomNavigationItemChanged? onChanged;

  @override
  State<AhlBottomNavigationBar> createState() => _AhlBottomNavigationBarState();
}

class _AhlBottomNavigationBarState extends State<AhlBottomNavigationBar> {
  BottomNavigationItem? _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.items.elementAtOrNull(widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        bottom: 32.0,
        left: 12.0,
        right: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items.map((i) => _buildItem(context, i)).toList(),
      ),
    );
  }

  Widget _buildItem(BuildContext context, BottomNavigationItem item) {
    final isSelected = _selectedItem == item;

    final icon = item.icon;
    if (icon != null) {
      return GestureDetector(
        onTap: () => {
          setState(() {
            _selectedItem = item;
            final index = widget.items.indexOf(item);
            widget.onChanged?.call(index);
          }),
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(999.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: isSelected ? item.iconColor : item.inactiveIconColor,
            ),
          ),
        ),
      );
    }

    return item.builder?.call(context, isSelected) ?? Container();
  }
}
