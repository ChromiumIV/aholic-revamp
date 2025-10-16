import 'package:aholic/presentation/sheets/ahl_bottom_sheet.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_action_bar.dart';
import 'package:aholic/presentation/widgets/ahl_tappable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

typedef OnTimeUpdated =
    void Function(
      DateTime updatedTime,
      String formattedTime,
      int cursorPosition,
    );

class AhlTimePickerSheet extends StatefulWidget {
  const AhlTimePickerSheet({super.key, required this.value, this.onUpdated});

  final DateTime value;
  final OnTimeUpdated? onUpdated;

  @override
  State<AhlTimePickerSheet> createState() => _AhlTimePickerSheetState();
}

class _AhlTimePickerSheetState extends State<AhlTimePickerSheet> {
  final int am = -1;
  final int pm = -2;

  int currentCursorPosition = 0; // from 0 to 3 in HH:mm
  late DateTime currentTime;
  bool is24HourFormat = true;

  @override
  void initState() {
    super.initState();
    currentTime = widget.value;
    // Detect time format from system or use MediaQuery
  }

  @override
  Widget build(BuildContext context) {
    return AhlBottomSheet(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 24,
              offset: Offset(0, -4),
              spreadRadius: 12,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  _buildItem(context, 7, "7"),
                  _buildItem(context, 8, "8"),
                  _buildItem(context, 9, "9"),
                ],
              ),
              Row(
                children: [
                  _buildItem(context, 4, "4"),
                  _buildItem(context, 5, "5"),
                  _buildItem(context, 6, "6"),
                ],
              ),
              Row(
                children: [
                  _buildItem(context, 1, "1"),
                  _buildItem(context, 2, "2"),
                  _buildItem(context, 3, "3"),
                ],
              ),
              Row(
                children: [
                  _buildItem(context, am, "AM"),
                  _buildItem(context, 0, "0"),
                  _buildItem(context, pm, "PM"),
                ],
              ),
              SizedBox(height: 12.0),
              AhlActionBar(
                leadingIcon: LucideIcons.chevronDown400,
                padding: EdgeInsets.only(bottom: 33.0),
                hasShadow: false,
                onLeadingBtnClick: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int value, String label) {
    return Expanded(
      child: AhlTappable(
        onPressed: () {
          // Handle AM/PM toggle
          if (value == am || value == pm) {
            _handleAmPmToggle(value == pm);
            return;
          }

          // Check if the value is allowed at current cursor position
          if (!_isValueAllowed(value)) {
            return;
          }

          // Update time based on cursor position
          _updateTimeAtPosition(value);
        },
        builder: (isPressed) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              color: isPressed ? AhlColors.gray08 : Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        },
      ),
    );
  }

  bool _isValueAllowed(int value) {
    int hour = currentTime.hour;

    switch (currentCursorPosition) {
      case 0: // First digit of hour
        if (is24HourFormat) {
          // In 24-hour format, first digit can be 0, 1, or 2
          return value >= 0 && value <= 2;
        } else {
          // In 12-hour format, first digit can be 0 or 1
          return value >= 0 && value <= 1;
        }
      case 1: // Second digit of hour
        int firstDigit = hour ~/ 10;
        if (is24HourFormat) {
          if (firstDigit == 2) {
            return value >= 0 && value <= 3; // 20-23
          } else {
            return value >= 0 && value <= 9;
          }
        } else {
          if (firstDigit == 1) {
            return value >= 0 && value <= 2; // 10-12
          } else if (firstDigit == 0) {
            return value >= 1 && value <= 9; // 01-09
          }
          return false;
        }
      case 2: // First digit of minute
        return value >= 0 && value <= 5; // 00-59
      case 3: // Second digit of minute
        return value >= 0 && value <= 9;
      default:
        return false;
    }
  }

  void _updateTimeAtPosition(int value) {
    int hour = currentTime.hour;
    int minute = currentTime.minute;

    switch (currentCursorPosition) {
      case 0: // First digit of hour
        // Replace the entire hour with new value
        // e.g., 07:32 + pressing 2 = 20:32 (not 27:32)
        int currentOnesDigit = hour % 10;
        int newHour = value * 10 + currentOnesDigit;

        // Validate the new hour
        if (is24HourFormat) {
          // For 24-hour format, ensure hour is 0-23
          if (newHour > 23) {
            // If invalid, just use the tens digit with 0 as ones
            // e.g., pressing 2 when hour ones would make it invalid -> 20
            newHour = value * 10;
          }
        } else {
          // For 12-hour format, ensure hour is 1-12
          if (newHour > 12 || newHour == 0) {
            newHour = value * 10 + 1; // Default to X1
            if (newHour > 12 || newHour == 0) {
              newHour = value * 10; // If still invalid, use X0
            }
          }
        }
        hour = newHour;
        break;
      case 1: // Second digit of hour
        hour = (hour ~/ 10) * 10 + value;
        break;
      case 2: // First digit of minute
        minute = value * 10 + (minute % 10);
        break;
      case 3: // Second digit of minute
        minute = (minute ~/ 10) * 10 + value;
        break;
    }

    // Create updated DateTime
    DateTime updatedTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      hour,
      minute,
    );

    // Format time string
    String formattedTime = _formatTime(updatedTime);

    // Move cursor to next position
    int nextCursorPosition = (currentCursorPosition + 1);

    // Update state
    setState(() {
      currentTime = updatedTime;
      currentCursorPosition = nextCursorPosition;
    });

    // Invoke callback
    widget.onUpdated?.call(updatedTime, formattedTime, nextCursorPosition);
  }

  void _handleAmPmToggle(bool isPm) {
    int hour = currentTime.hour;

    if (is24HourFormat) {
      // For 24-hour format, toggle between AM (0-11) and PM (12-23)
      if (isPm) {
        // Convert to PM (12-23)
        if (hour < 12) {
          hour += 12;
        }
      } else {
        // Convert to AM (0-11)
        if (hour >= 12) {
          hour -= 12;
        }
      }
    } else {
      // For 12-hour format
      if (isPm) {
        // Convert to PM (12-23)
        if (hour < 12) {
          hour += 12;
        }
      } else {
        // Convert to AM (0-11)
        if (hour >= 12) {
          hour -= 12;
        }
      }
    }

    DateTime updatedTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      hour,
      currentTime.minute,
    );

    String formattedTime = _formatTime(updatedTime);

    setState(() {
      currentTime = updatedTime;
    });

    widget.onUpdated?.call(updatedTime, formattedTime, currentCursorPosition);
  }

  String _formatTime(DateTime time) {
    if (is24HourFormat) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    } else {
      int hour12 = time.hour % 12;
      if (hour12 == 0) hour12 = 12;
      String period = time.hour < 12 ? 'AM' : 'PM';
      return '${hour12.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
    }
  }
}
