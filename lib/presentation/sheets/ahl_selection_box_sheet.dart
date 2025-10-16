import 'package:aholic/presentation/sheets/ahl_bottom_sheet.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_selection_box.dart';
import 'package:aholic/presentation/widgets/ahl_tappable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AhlSelectionBoxSheet<T> extends StatefulWidget {
  const AhlSelectionBoxSheet(
    this.items, {
    super.key,
    this.selectedItem,
    this.title,
    this.builder,
    this.onSelected,
    this.color = Colors.black,
    this.shrinkWrap = false,
  });

  final List<T> items;
  final T? selectedItem;
  final String? title;
  final SelectionBoxItemBuilder<T>? builder;
  final OnItemSelected<T>? onSelected;
  final Color color;
  final bool shrinkWrap;

  @override
  State<AhlSelectionBoxSheet<T>> createState() =>
      _AhlSelectionBoxSheetState<T>();
}

class _AhlSelectionBoxSheetState<T> extends State<AhlSelectionBoxSheet<T>> {
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
    return AhlBottomSheet(
      title: widget.title,
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 24.0,
        bottom: 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // if (t != null)
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //     child: Text(
          //       t,
          //       style: Theme.of(context).textTheme.headlineMedium,
          //     ),
          //   ),
          widget.shrinkWrap ? _build() : Expanded(child: _build()),
        ],
      ),
    );
  }

  Widget _build() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 12.0, bottom: 24.0),
      shrinkWrap: widget.shrinkWrap,
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final T i = widget.items[index];
        final isSelected = i == _selectedItem;
        final b = widget.builder;
        return AhlTappable(
          onPressed: () {
            setState(() {
              _selectedItem = i;
            });
            widget.onSelected?.call(i);
            context.pop();
          },
          builder: (isPressed) => Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? widget.color.withAlpha(77)
                      : Colors.transparent,
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child:
                            b?.call(i) ??
                            Text(
                              i.toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                      ),
                    ),

                    if (isSelected)
                      Icon(LucideIcons.check500, color: AhlColors.transBlack50),
                  ],
                ),
              ),
              Positioned.fill(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  color: isPressed
                      ? AhlColors.transBlack12
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
