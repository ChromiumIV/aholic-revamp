import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

typedef BreadcrumbItemBuilder<T> =
    Widget Function(BuildContext context, T item);
typedef BreadcrumbParentResolver<T> = T? Function(T currentItem);
typedef OnMenuToggled = void Function(bool isToggled);
typedef OnBreadcrumbItemSelected<T> = void Function(T selectedItem);

// @freezed
// abstract class BreadcrumbItem<T> with _$BreadcrumbItem<T> {
//   const factory BreadcrumbItem(
//     T item, {
//     BreadcrumbItem<T>? parent,
//     required List<BreadcrumbItem<T>> children,
//   }) = _BreadcrumbItem<T>;
// }

class AhlBreadcrumbBar<T> extends StatefulWidget {
  const AhlBreadcrumbBar({
    super.key,
    required this.currentItem,
    this.children,
    required this.builder,
    required this.parentResolver,
    this.listItemBuilder,
    this.onMenuToggled,
    this.onItemSelected,
    this.isToggled = false,
  });

  final T currentItem;
  final List<T>? children;
  final BreadcrumbItemBuilder<T> builder;
  final BreadcrumbItemBuilder<T>? listItemBuilder;
  final OnMenuToggled? onMenuToggled;
  final OnBreadcrumbItemSelected<T>? onItemSelected;
  final BreadcrumbParentResolver<T> parentResolver;
  final bool isToggled;

  @override
  State<AhlBreadcrumbBar<T>> createState() => _AhlBreadcrumbBarState<T>();
}

class _AhlBreadcrumbBarState<T> extends State<AhlBreadcrumbBar<T>> {
  // bool _isShowingChildren = false;
  bool _isToggled = false;

  @override
  void initState() {
    setState(() {
      _isToggled = widget.isToggled;
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant AhlBreadcrumbBar<T> oldWidget) {
      setState(() {
      _isToggled = widget.isToggled;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    T? current = widget.currentItem;

    while (current != null) {
      widgets.insert(
        0,
        Opacity(
          opacity: current == widget.currentItem ? 1 : 0.5,
          child: widget.builder(context, current),
        ),
      );
      current = widget.parentResolver(current);

      if (current != null) {
        widgets.insert(
          0,
          Icon(LucideIcons.chevronRight400, color: AhlColors.transWhite50),
        );
      }
    }

    final c = widget.children;

    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 300),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isToggled && c != null)
                ...c.map(
                  (i) =>
                      widget.listItemBuilder?.call(context, i) ??
                      widget.builder(context, i),
                ),
              if (_isToggled)
                Container(height: 2.0, color: AhlColors.transWhite20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(children: widgets),
                    ),
                  ),
                  if (c != null && c.isNotEmpty)
                    AhlIconButton(
                      onPressed: () {
                        setState(() {
                          _isToggled = !_isToggled;
                        });
                        widget.onMenuToggled?.call(_isToggled);
                      },
                      icon: _isToggled
                          ? LucideIcons.chevronDown400
                          : LucideIcons.chevronUp400,
                      iconColor: Colors.white,
                      hoveredIconColor: Colors.white,
                      // padding: EdgeInsets.zero,
                      // hoveredBackgroundColor: Colors.transparent,
                      // builder: (context, isPressed) => AnimatedContainer(
                      //   duration: const Duration(milliseconds: 100),
                      //   decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //       begin: Alignment(1.00, 0.50),
                      //       end: Alignment(0.00, 0.50),
                      //       colors: [
                      //         Colors.black.withValues(alpha: isPressed ? 0.50 : 0),
                      //         Colors.black.withValues(alpha: 0),
                      //       ],
                      //     ),
                      //     borderRadius: BorderRadius.circular(12.0),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(
                      //       left: 48.0,
                      //       right: 12.0,
                      //       top: 12.0,
                      //       bottom: 12.0,
                      //     ),
                      //     child: Icon(LucideIcons.chevronUp400, color: Colors.white),
                      //   ),
                      // ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
