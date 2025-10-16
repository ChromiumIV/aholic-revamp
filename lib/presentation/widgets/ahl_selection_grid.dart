import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_tappable.dart';
import 'package:flutter/material.dart';

class SelectionGridItem<T> {
  SelectionGridItem(this.label, this.tag);

  final String label;
  final T tag;
}

class SelectionGridRow<T> {
  SelectionGridRow(this.items);

  final List<SelectionGridItem<T>> items;
}

typedef OnSelectionChanged<T> = void Function(Set<T> selectedItems);

class AhlSelectionGrid<T> extends StatefulWidget {
  const AhlSelectionGrid(
    this.rows, {
    super.key,
    this.color = Colors.black,
    this.onChanged,
    this.selectedItems = const {},
  });

  final List<SelectionGridRow<T>> rows;
  final Color color;
  final Set<T> selectedItems;
  final OnSelectionChanged<T>? onChanged;

  @override
  State<AhlSelectionGrid<T>> createState() => _AhlSelectionGridState<T>();
}

class _AhlSelectionGridState<T> extends State<AhlSelectionGrid<T>> {
  final Set<T> _selectedItems = {};

  @override
  void initState() {
    super.initState();

    _selectedItems.clear();
    for (final i in widget.selectedItems) {
      _selectedItems.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: widget.rows
          .map(
            (r) => Row(
              spacing: 12.0,
              children: r.items.map((i) => _buildItem(context, i)).toList(),
            ),
          )
          .toList(),
    );
  }

  Widget _buildItem(BuildContext context, SelectionGridItem<T> item) {
    final isSelected = _selectedItems.contains(item.tag);

    return Expanded(
      child: AhlTappable(
        onPressed: () {
          setState(() {
            if (isSelected) {
              _selectedItems.remove(item.tag);
            } else {
              _selectedItems.add(item.tag);
            }
          });

          widget.onChanged?.call(_selectedItems);
        },
        builder: (isPressed) => Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                color: isSelected ? widget.color : Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    item.label,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isSelected ? Colors.black : AhlColors.transBlack50,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  color: isPressed
                      ? AhlColors.transBlack12
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
