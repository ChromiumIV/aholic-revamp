import 'package:aholic/domain/entities/checklist_item.dart';
import 'package:aholic/domain/notifiers/edit_checklist_notifier.dart';
import 'package:aholic/presentation/sheets/ahl_recurrence_sheet.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_action_bar.dart';
import 'package:aholic/presentation/widgets/ahl_icon_button.dart';
import 'package:aholic/presentation/widgets/ahl_scaffold.dart';
import 'package:aholic/presentation/widgets/ahl_text_field.dart';
import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EditChecklistPage extends ConsumerStatefulWidget {
  const EditChecklistPage({super.key, this.checklistId});

  // final Checklist checklist;

  final int? checklistId;

  @override
  ConsumerState<EditChecklistPage> createState() => _EditChecklistPageState();
}

class _EditChecklistPageState extends ConsumerState<EditChecklistPage> {
  bool _openColorPicker = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editChecklistProvider(widget.checklistId));
    final notifier = ref.read(
      editChecklistProvider(widget.checklistId).notifier,
    );
    return AhlScaffold(
      backgroundColor: AhlColors.gray08,
      body: Column(
        children: [
          AhlTextField(
            value: state.checklist.pinnable.title,
            fillColor: Colors.transparent,
            underlineColor: AhlColors.transBlack12,
            focusedUnderlineColor: AhlColors.transBlack50,
            style: Theme.of(context).textTheme.headlineMedium,
            hintText: 'Title',
            padding: EdgeInsets.only(
              top: 93.0,
              left: 16.0,
              right: 16.0,
              bottom: 24.0,
            ),
            onTextChanged: (title) => notifier.updateTitle(title),
          ),
          Expanded(
            child: AnimatedReorderableListView<ChecklistItem>(
              buildDefaultDragHandles: false,
              items: state.checklist.items,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                return Container(
                  key: ValueKey(index),
                  height: 120,
                  color: Colors.yellow,
                  child: Text(items[index]),
                );
              },
              proxyDecorator: (child, index, animation) {
                return Opacity(opacity: 0.5, child: child);
              },
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  final i = items.removeAt(oldIndex);
                  items.insert(newIndex, i);
                });
              },
              isSameItem: (ChecklistItem a, ChecklistItem b) {
                return a.itemId == b.itemId;
              },
            ),
          ),
        ],
      ),
      actionBar: AhlActionBar(
        leadingIcon: _openColorPicker ? null : LucideIcons.chevronLeft400,
        onLeadingBtnClick: () {
          context.pop();
        },
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        leadingWidgetBuilder: (context) {
          if (_openColorPicker) {
            return _buildColorPicker(context);
          }

          return Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AhlIconButton(
                  builder: (context, _) {
                    return Container(
                      height: 24.0,
                      width: 24.0,
                      decoration: BoxDecoration(
                        color: AhlColors.yellow,
                        border: Border.all(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  },
                  onPressed: () {
                    setState(() {
                      _openColorPicker = true;
                    });
                  },
                ),
                AhlIconButton(
                  icon: LucideIcons.repeat400,
                  iconColor: Colors.white,
                  hoveredIconColor: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => AhlRecurrenceSheet(
                        color: AhlColors.yellow,
                        onUpdated:
                            (recurrence, isEnding, repeatUntil, modifiers) {
                              debugPrint(
                                recurrence.toString() +
                                    "|" +
                                    isEnding.toString() +
                                    "|" +
                                    repeatUntil.toString() +
                                    "|" +
                                    modifiers.toString(),
                              );
                            },
                      ),
                    );
                  },
                ),
                AhlIconButton(
                  icon: LucideIcons.alarmClock400,
                  iconColor: Colors.white,
                  hoveredIconColor: Colors.white,
                ),
              ],
            ),
          );
        },
        trailingIcon: _openColorPicker
            ? LucideIcons.x400
            : LucideIcons.check400,
        trailingIconColor: _openColorPicker
            ? Colors.white
            : Colors.white.withAlpha(state.hasUnsavedChanges ? 255 : 128),
        onTrailingBtnClick: () {
          if (_openColorPicker) {
            setState(() {
              _openColorPicker = false;
            });
          } else {}
        },
      ),
    );
  }

  Widget _buildColorPicker(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: AhlColors.all.map((c) {
            return AhlIconButton(
              builder: (context, _) {
                return Container(
                  height: 24.0,
                  width: 24.0,
                  decoration: BoxDecoration(
                    color: c,
                    border: Border.all(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              },
              onPressed: () {},
            );
          }).toList(),
        ),
      ),
    );
  }
}
