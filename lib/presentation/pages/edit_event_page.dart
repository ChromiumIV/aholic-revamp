import 'package:aholic/presentation/sheets/ahl_recurrence_sheet.dart';
import 'package:aholic/presentation/sheets/ahl_time_picker_sheet.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_action_bar.dart';
import 'package:aholic/presentation/widgets/ahl_date_time_picker.dart';
import 'package:aholic/presentation/widgets/ahl_icon_button.dart';
import 'package:aholic/presentation/widgets/ahl_scaffold.dart';
import 'package:aholic/presentation/widgets/ahl_selection_box.dart';
import 'package:aholic/presentation/widgets/ahl_switch.dart';
import 'package:aholic/presentation/widgets/ahl_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EditEventPage extends StatefulWidget {
  const EditEventPage({super.key});

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  bool _openColorPicker = false;

  @override
  Widget build(BuildContext context) {
    return AhlScaffold(
      backgroundColor: AhlColors.yellow,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AhlTextField(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: AhlDateTimePicker(
                      value: DateTime.now(),
                      fillColor: AhlColors.transWhite20,
                      hoveredFillColor: AhlColors.transWhite50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "to",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AhlColors.transBlack50,
                      ),
                    ),
                  ),
                  Expanded(
                    child: AhlDateTimePicker(
                      value: DateTime.now(),
                      fillColor: AhlColors.transWhite20,
                      hoveredFillColor: AhlColors.transWhite50,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                child: AhlSwitch(value: false, label: "All-day"),
              ),
            ),
            AhlSelectionBox<String>(
              [
                "Master",
                "Cookie",
                "Eevee",
                "Abby",
                "Brandy",
                "Cody",
                "Debby",
                "Franky",
              ],
              selectedItem: "Cookie",
              label: "Timeline",
              title: "Select timeline",
              color: AhlColors.yellow,
              previewFillColor: AhlColors.transWhite20,
              previewHoveredFillColor: AhlColors.transWhite50,
            ),
            AhlTextField(
              label: "Location",
              fillColor: AhlColors.transWhite20,
              maxLines: 1,
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
            ),
            AhlTextField(
              label: "Note",
              fillColor: AhlColors.transWhite20,
              maxLines: 3,
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
            ),
          ],
        ),
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
        onTrailingBtnClick: () {
          setState(() {
            _openColorPicker = false;
          });
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
