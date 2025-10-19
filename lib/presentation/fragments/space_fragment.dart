import 'package:aholic/domain/entities/checklist.dart';
import 'package:aholic/domain/entities/checklist_item.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_staggered_grid_view.dart';
import 'package:aholic/presentation/widgets/checklist_widget.dart';
import 'package:drag_anim/drag_anim.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reorderable_staggered_grid_view/reorderable_staggered_grid_view.dart';

class SpaceFragment extends StatelessWidget {
  SpaceFragment({super.key});

  final items = [
    Checklist(
      title: "Grocery",
      items: [
        ChecklistItem(title: "mac mini", order: 1),
        ChecklistItem(title: "Chair", order: 2),
        ChecklistItem(title: "Carpets", order: 3),
      ],
      color: AhlColors.yellow,
    ),
    Checklist(
      title: "Todo",
      items: [
        ChecklistItem(
          title:
              "ccscscjfna oiefi noieneaf uionufoin uoin foinf aof oneofn oen oafnoen nfnaounuaonuoaenaeea uefnou nffae",
          order: 1,
        ),
        ChecklistItem(title: "Chair", order: 2),
        ChecklistItem(title: "Carpets", order: 3),
      ],
      color: AhlColors.cyan,
    ),
    Checklist(
      title: "Todo",
      items: [
        ChecklistItem(
          title:
              "oefenioenfioaf eooifnaoiaio",
          order: 1,
        ),
        ChecklistItem(title: "afionae oianoia oanoianoa ofan fioa foanfoan", order: 2),
        ChecklistItem(title: "fnaiofn aoenionf eoin ea iaoaenfiaefoieanfanfoiaenoeaifn oainfoianfoieanfoianfofoinf", order: 3),
        ChecklistItem(title: "fnafnaofinoi nfioafnoeafaofoififoieiofofoinf", order: 3),
      ],
      color: AhlColors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // return ReorderableStaggeredGridView(
    //   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    //   enable: true,
    //   crossAxisCount: 2,
    //   mainAxisSpacing: 12.0,
    //   crossAxisSpacing: 12.0,
    //   isLongPressDraggable: true,
    //   items: [
    //     ReorderableStaggeredGridViewItem<ChecklistItem>(
    //       data: null,
    //       animationKey: GlobalKey(),
    //       mainAxisCellCount: 2,
    //       crossAxisCellCount: 1,
    //       child: ChecklistWidget(
    //         Checklist(
    //           title: "Grocery",
    //           items: [
    //             ChecklistItem(title: "mac mini", order: 1),
    //             ChecklistItem(title: "Chair", order: 2),
    //             ChecklistItem(title: "Carpets", order: 3),
    //           ],
    //           color: AhlColors.cyan,
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    return DragAnim(
      maxSimultaneousDrags: 99,
      dataList: items,
      buildItems: (dragItems) {
        return StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          children: items
              .map(
                (i) => dragItems(
                  data: i,
                  child: StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: ChecklistWidget(i),
                  ),
                  key: ValueKey<String>(items.indexOf(i).toString()),
                ),
              )
              .toList(),

          //  [
          //   ,
          //   StaggeredGridTile.fit(
          //     crossAxisCellCount: 1,
          //     child: ChecklistWidget(),
          //   ),
          // ],
        );
      },
    );
  }
}
