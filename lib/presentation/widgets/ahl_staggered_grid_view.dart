import 'dart:math' as math;

import 'package:flutter/material.dart';


class GridItem {
  final int id;
  final Color color;
  final String title;
  final String description;

  GridItem({
    required this.id,
    required this.color,
    required this.title,
    required this.description,
  });
}

// Type definitions for builders
typedef ItemWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  int index,
);

typedef FeedbackWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  int index,
);

typedef DraggedItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  int index,
);

class AhlStaggeredGridView<T> extends StatefulWidget {
  final List<T> items;
  final ItemWidgetBuilder<T> itemBuilder;
  final FeedbackWidgetBuilder<T>? feedbackBuilder;
  final DraggedItemBuilder<T>? draggedItemBuilder;
  final Function(int oldIndex, int newIndex) onReorder;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsets padding;
  final Duration longPressDuration;

  const AhlStaggeredGridView({
    Key? key,
    required this.items,
    required this.itemBuilder,
    required this.onReorder,
    this.feedbackBuilder,
    this.draggedItemBuilder,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 8.0,
    this.crossAxisSpacing = 8.0,
    this.padding = const EdgeInsets.all(8.0),
    this.longPressDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<AhlStaggeredGridView<T>> createState() =>
      _AhlStaggeredGridViewState<T>();
}

class _AhlStaggeredGridViewState<T>
    extends State<AhlStaggeredGridView<T>> {
  int? draggingIndex;
  int? hoveringIndex;
  final Map<int, double> _itemHeights = {};
  final Map<int, GlobalKey> _itemKeys = {};

  @override
  void initState() {
    super.initState();
    _initializeKeys();
  }

  @override
  void didUpdateWidget(AhlStaggeredGridView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items.length != widget.items.length) {
      _initializeKeys();
    }
  }

  void _initializeKeys() {
    _itemKeys.clear();
    for (int i = 0; i < widget.items.length; i++) {
      _itemKeys[i] = GlobalKey();
    }
  }

  void _measureItems() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool needsUpdate = false;
      for (var entry in _itemKeys.entries) {
        final key = entry.value;
        final context = key.currentContext;
        if (context != null) {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final height = renderBox.size.height;
          if (_itemHeights[entry.key] != height) {
            _itemHeights[entry.key] = height;
            needsUpdate = true;
          }
        }
      }
      if (needsUpdate && mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _measureItems();

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth - widget.padding.horizontal;
        final itemWidth =
            (width - (widget.crossAxisCount - 1) * widget.crossAxisSpacing) /
                widget.crossAxisCount;

        return SingleChildScrollView(
          padding: widget.padding,
          child: _itemHeights.length == widget.items.length
              ? StaggeredGridLayout<T>(
                  items: widget.items,
                  crossAxisCount: widget.crossAxisCount,
                  mainAxisSpacing: widget.mainAxisSpacing,
                  crossAxisSpacing: widget.crossAxisSpacing,
                  itemWidth: itemWidth,
                  itemHeights: _itemHeights,
                  itemBuilder: (context, item, index) =>
                      _buildDraggableItem(context, item, index, itemWidth),
                )
              : _buildMeasuringLayout(itemWidth),
        );
      },
    );
  }

  Widget _buildMeasuringLayout(double itemWidth) {
    // Build items off-screen to measure their heights
    return Opacity(
      opacity: 0,
      child: Column(
        children: List.generate(widget.items.length, (index) {
          return SizedBox(
            key: _itemKeys[index],
            width: itemWidth,
            child: widget.itemBuilder(context, widget.items[index], index),
          );
        }),
      ),
    );
  }

  Widget _buildDraggableItem(
    BuildContext context,
    T item,
    int index,
    double itemWidth,
  ) {
    final isDragging = draggingIndex == index;
    final isHovering = hoveringIndex == index;

    return DragTarget<int>(
      onWillAcceptWithDetails: (details) {
        final draggedIndex = details.data;
        if (draggedIndex != index) {
          setState(() {
            hoveringIndex = index;
          });
          return true;
        }
        return false;
      },
      onLeave: (draggedIndex) {
        setState(() {
          hoveringIndex = null;
        });
      },
      onAcceptWithDetails: (details) {
        final draggedIndex = details.data;
        widget.onReorder(draggedIndex, index);
        setState(() {
          hoveringIndex = null;
          draggingIndex = null;
          _itemHeights.clear(); // Clear heights to remeasure
        });
      },
      builder: (context, candidateData, rejectedData) {
        Widget child = widget.itemBuilder(context, item, index);

        if (isHovering) {
          child = Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: child,
          );
        }

        return LongPressDraggable<int>(
          data: index,
          delay: widget.longPressDuration,
          feedback: Material(
            elevation: 8,
            color: Colors.transparent,
            child: SizedBox(
              width: itemWidth,
              child: Opacity(
                opacity: 0.9,
                child: widget.feedbackBuilder != null
                    ? widget.feedbackBuilder!(context, item, index)
                    : widget.itemBuilder(context, item, index),
              ),
            ),
          ),
          childWhenDragging: Opacity(
            opacity: 0.3,
            child: widget.draggedItemBuilder != null
                ? widget.draggedItemBuilder!(context, item, index)
                : widget.itemBuilder(context, item, index),
          ),
          onDragStarted: () {
            setState(() {
              draggingIndex = index;
            });
          },
          onDragEnd: (details) {
            setState(() {
              draggingIndex = null;
              hoveringIndex = null;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: isHovering
                ? (Matrix4.identity()..scale(0.95))
                : Matrix4.identity(),
            child: child,
          ),
        );
      },
    );
  }
}

class StaggeredGridLayout<T> extends StatelessWidget {
  final List<T> items;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double itemWidth;
  final Map<int, double> itemHeights;
  final ItemWidgetBuilder<T> itemBuilder;

  const StaggeredGridLayout({
    Key? key,
    required this.items,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.itemWidth,
    required this.itemHeights,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columnHeights = List<double>.filled(crossAxisCount, 0);
    final positions = <_ItemPosition>[];

    for (int i = 0; i < items.length; i++) {
      // Find the column with minimum height
      int minColumn = 0;
      double minHeight = columnHeights[0];
      for (int j = 1; j < crossAxisCount; j++) {
        if (columnHeights[j] < minHeight) {
          minHeight = columnHeights[j];
          minColumn = j;
        }
      }

      final left = minColumn * (itemWidth + crossAxisSpacing);
      final top = columnHeights[minColumn];
      final itemHeight = itemHeights[i] ?? 100.0;

      positions.add(_ItemPosition(
        left: left,
        top: top,
        child: itemBuilder(context, items[i], i),
      ));

      // Update column height
      columnHeights[minColumn] = top + itemHeight + mainAxisSpacing;
    }

    final maxHeight = columnHeights.reduce(math.max);

    return SizedBox(
      height: maxHeight,
      child: Stack(
        children: positions.map((pos) {
          return Positioned(
            left: pos.left,
            top: pos.top,
            width: itemWidth,
            child: pos.child,
          );
        }).toList(),
      ),
    );
  }
}

class _ItemPosition {
  final double left;
  final double top;
  final Widget child;

  _ItemPosition({
    required this.left,
    required this.top,
    required this.child,
  });
}