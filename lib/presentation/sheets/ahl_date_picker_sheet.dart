import 'package:aholic/presentation/sheets/ahl_bottom_sheet.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_tappable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

typedef OnDatePicked = void Function(DateTime selectedDate);

class AhlDatePickerSheet extends StatefulWidget {
  const AhlDatePickerSheet({super.key, this.onDatePicked});

  final OnDatePicked? onDatePicked;

  @override
  State<AhlDatePickerSheet> createState() => _AhlDatePickerSheetState();
}

class _AhlDatePickerSheetState extends State<AhlDatePickerSheet> {
  DateTime currentMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AhlBottomSheet(
      child: Column(
        children: [
          AhlTappable(
            builder: (isPressed) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  color: isPressed
                      ? AhlColors.transBlack08
                      : Colors.transparent,
                ),
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        DateFormat('MMM y').format(currentMonth),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Icon(LucideIcons.chevronDown400),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
