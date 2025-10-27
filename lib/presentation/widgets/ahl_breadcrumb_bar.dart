import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_icon_button.dart';
import 'package:aholic/presentation/widgets/ahl_tappable.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

typedef BreadcrumbItemBuilder<T> =
    Widget Function(BuildContext context, T item);
typedef BreadcrumbParentResolver<T> = T? Function(T currentItem);
typedef BreadcrumbChildrenResolver<T> = List<T> Function(T currentItem);
typedef OnMenuToggled = void Function(bool isToggled);
typedef OnBreadcrumbItemSelected<T> = void Function(T selectedItem);

class AhlBreadcrumbBar<T> extends StatefulWidget {
  const AhlBreadcrumbBar({
    super.key,
    required this.currentItem,
    required this.parentResolver,
    required this.childrenResolver,
    required this.builder,
    this.listItemBuilder,
    this.onMenuToggled,
    this.onItemSelected,
    this.isToggled = false,
  });

  final T currentItem;
  final BreadcrumbParentResolver<T> parentResolver;
  final BreadcrumbChildrenResolver<T> childrenResolver;
  final BreadcrumbItemBuilder<T> builder;
  final BreadcrumbItemBuilder<T>? listItemBuilder;
  final OnMenuToggled? onMenuToggled;
  final OnBreadcrumbItemSelected<T>? onItemSelected;
  final bool isToggled;

  @override
  State<AhlBreadcrumbBar<T>> createState() => _AhlBreadcrumbBarState<T>();
}

class _AhlBreadcrumbBarState<T> extends State<AhlBreadcrumbBar<T>> {
  final ScrollController _scrollController = ScrollController();
  bool _isToggled = false;
  late T _currentItem;

  @override
  void initState() {
    _currentItem = widget.currentItem;
    _scrollBreadcrumbToEnd();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollBreadcrumbToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    T? current = _currentItem;

    while (current != null) {
      final i = current;

      widgets.insert(
        0,
        Opacity(
          opacity: current == widget.currentItem ? 1 : 0.5,
          child: AhlTappable(
            onPressed: () {
              setState(() {
                _isToggled = false;
                _currentItem = i;
              });

              widget.onItemSelected?.call(i);

              _scrollBreadcrumbToEnd();
            },
            builder: (isPressed) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  color: isPressed
                      ? AhlColors.transBlack50
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(12.0),
                child: widget.builder(context, i),
              );
            },
          ),
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

    final c = _currentItem != null ? widget.childrenResolver(_currentItem) : [];

    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 300),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isToggled)
                ...c.map(
                  (i) => Row(
                    children: [
                      Expanded(
                        child: AhlTappable(
                          onPressed: () {
                            setState(() {
                              _currentItem = i;
                              _isToggled = false;
                              widget.onItemSelected?.call(i);
                            });

                            _scrollBreadcrumbToEnd();
                          },
                          builder: (isPressed) => AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            decoration: BoxDecoration(
                              color: isPressed
                                  ? AhlColors.transBlack50
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child:
                                widget.listItemBuilder?.call(context, i) ??
                                widget.builder(context, i),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (_isToggled)
                Container(height: 2.0, color: AhlColors.transWhite20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      child: Row(children: widgets),
                    ),
                  ),
                  if (c.isNotEmpty)
                    AhlIconButton(
                      onPressed: () {
                        setState(() {
                          _isToggled = !_isToggled;
                        });
                        widget.onMenuToggled?.call(_isToggled);
                      },
                      builder: (context, _) => AnimatedRotation(
                        turns: _isToggled ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        child: Icon(
                          LucideIcons.chevronUp400,
                          color: Colors.white,
                        ),
                      ),
                      iconColor: Colors.white,
                      hoveredIconColor: Colors.white,
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
