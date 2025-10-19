import 'package:aholic/presentation/sheets/ahl_recurrence_sheet.dart';
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

class EditTransactionPage extends StatefulWidget {
  const EditTransactionPage({super.key});

  @override
  State<EditTransactionPage> createState() => _EditTransactionPageState();
}

class _EditTransactionPageState extends State<EditTransactionPage> {
  bool _openColorPicker = false;

  @override
  Widget build(BuildContext context) {
    return AhlScaffold(
      backgroundColor: AhlColors.blue,
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
              keyboardType: TextInputType.number,
              padding: EdgeInsets.only(
                top: 93.0,
                left: 16.0,
                right: 16.0,
                bottom: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: AhlTextField(
                label: "Amount",
                fillColor: AhlColors.transWhite20,
                textAlignment: TextAlign.end,
                keyboardType: TextInputType.number,
                leadingWidgetBuilder: (context, isFocused) => Icon(
                  LucideIcons.dollarSign400,
                  color: isFocused ? Colors.black : AhlColors.transBlack50,
                ),
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
                      direction: Axis.horizontal,
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
                  builder: (context) {
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
              builder: (context) {
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
