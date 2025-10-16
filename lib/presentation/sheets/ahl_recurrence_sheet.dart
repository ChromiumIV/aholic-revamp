import 'package:aholic/presentation/sheets/ahl_bottom_sheet.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_action_bar.dart';
import 'package:aholic/presentation/widgets/ahl_date_time_picker.dart';
import 'package:aholic/presentation/widgets/ahl_disabled_view.dart';
import 'package:aholic/presentation/widgets/ahl_selection_box.dart';
import 'package:aholic/presentation/widgets/ahl_selection_grid.dart';
import 'package:aholic/presentation/widgets/ahl_switch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum Recurrence { daily, weekly, monthly, yearly }

typedef OnRecurrenceUpdated =
    void Function(
      Recurrence recurrence,
      bool isEnding,
      DateTime? repeatUntil,
      Set<int>? modifiers,
    );

class AhlRecurrenceSheet extends StatefulWidget {
  const AhlRecurrenceSheet({
    super.key,
    this.color = AhlColors.gray20,
    this.onUpdated,
  });

  final Color color;
  final OnRecurrenceUpdated? onUpdated;

  @override
  State<AhlRecurrenceSheet> createState() => _AhlRecurrenceSheetState();
}

class _AhlRecurrenceSheetState extends State<AhlRecurrenceSheet> {
  Recurrence _recurrence = Recurrence.daily;
  bool _isEnding = false;
  DateTime _repeatUntil = DateTime.now();
  Set<int> weeklyModifiers = {};
  Set<int> monthlyModifiers = {};

  @override
  Widget build(BuildContext context) {
    return AhlBottomSheet(
      title: "Repeat",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AhlSelectionBox<Recurrence>(
            [
              Recurrence.daily,
              Recurrence.weekly,
              Recurrence.monthly,
              Recurrence.yearly,
            ],
            isScrollControlled: true,
            selectedItem: _recurrence,
            color: widget.color,
            previewFillColor: widget.color,
            builder: (repeat) {
              String label = "";

              switch (repeat) {
                case Recurrence.daily:
                  label = 'Every day';
                  break;
                case Recurrence.weekly:
                  label = 'Every week';
                  break;
                case Recurrence.monthly:
                  label = 'Every month';
                  break;
                case Recurrence.yearly:
                  label = 'Every year';
                  break;
              }

              return Text(label, style: Theme.of(context).textTheme.bodyLarge);
            },
            onSelected: (recurrence) {
              setState(() {
                _recurrence = recurrence;
              });
            },
          ),
          if (_recurrence == Recurrence.monthly)
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 24.0,
              ),
              child: AhlSelectionGrid<int>(
                [
                  SelectionGridRow([
                    SelectionGridItem("Jan", DateTime.january),
                    SelectionGridItem("Feb", DateTime.february),
                    SelectionGridItem("Mar", DateTime.march),
                    SelectionGridItem("Apr", DateTime.april),
                    SelectionGridItem("May", DateTime.may),
                    SelectionGridItem("Jun", DateTime.june),
                  ]),
                  SelectionGridRow([
                    SelectionGridItem("Jul", DateTime.july),
                    SelectionGridItem("Aug", DateTime.august),
                    SelectionGridItem("Sep", DateTime.september),
                    SelectionGridItem("Oct", DateTime.october),
                    SelectionGridItem("Nov", DateTime.november),
                    SelectionGridItem("Dec", DateTime.december),
                  ]),
                ],
                color: widget.color,
                onChanged: (modifiers) {
                  setState(() {
                    monthlyModifiers = modifiers;
                  });
                },
              ),
            ),
          if (_recurrence == Recurrence.weekly)
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 24.0,
              ),
              child: AhlSelectionGrid<int>(
                [
                  SelectionGridRow([
                    SelectionGridItem("Mon", DateTime.monday),
                    SelectionGridItem("Tue", DateTime.tuesday),
                    SelectionGridItem("Wed", DateTime.wednesday),
                    SelectionGridItem("Thu", DateTime.thursday),
                    SelectionGridItem("Fri", DateTime.friday),
                    SelectionGridItem("Sat", DateTime.saturday),
                    SelectionGridItem("Sun", DateTime.sunday),
                  ]),
                ],
                color: widget.color,
                onChanged: (modifiers) {
                  setState(() {
                    weeklyModifiers = modifiers;
                  });
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AhlSwitch(
                  value: _isEnding,
                  label: "Ends on",
                  activeColor: widget.color,
                  labelDirection: SwitchLabelDirection.right,
                  onChanged: (isEnding) {
                    setState(() {
                      _isEnding = isEnding;
                    });
                  },
                ),
                SizedBox(width: 24.0),
                Expanded(
                  child: AhlDisabledView(
                    !_isEnding,
                    child: AhlDateTimePicker(
                      value: _repeatUntil,
                      showTimePicker: false,
                      fillColor: widget.color,
                      onUpdated: (repeatUntil) {
                        setState(() {
                          _repeatUntil = repeatUntil;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          AhlActionBar(
            leadingIcon: LucideIcons.chevronDown400,
            onLeadingBtnClick: () {
              context.pop();
            },
            trailingIcon: LucideIcons.check400,
            onTrailingBtnClick: () {
              widget.onUpdated?.call(
                _recurrence,
                _isEnding,
                _isEnding ? _repeatUntil : null,
                _recurrence == Recurrence.monthly
                    ? monthlyModifiers
                    : _recurrence == Recurrence.weekly
                    ? weeklyModifiers
                    : null,
              );
            },
            hasShadow: false,
          ),
        ],
      ),
    );
  }
}
