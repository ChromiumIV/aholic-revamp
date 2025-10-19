import 'package:aholic/presentation/sheets/ahl_time_picker_sheet.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_tappable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef OnDateTimeUpdated = void Function(DateTime updatedDateTime);

class AhlDateTimePicker extends StatefulWidget {
  const AhlDateTimePicker({
    super.key,
    required this.value,
    this.onUpdated,
    this.showTimePicker = true,
    this.fillColor = AhlColors.transBlack12,
    this.hoveredFillColor,
    this.direction = Axis.vertical,
  });

  final DateTime value;
  final OnDateTimeUpdated? onUpdated;
  final bool showTimePicker;
  final Color fillColor;
  final Color? hoveredFillColor;
  final Axis direction;

  @override
  State<AhlDateTimePicker> createState() => _AhlDateTimePickerState();
}

class _AhlDateTimePickerState extends State<AhlDateTimePicker> {
  late DateTime _value;
  int _currentCursorPosition = -1;

  late PersistentBottomSheetController _timeSheetController;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.direction == Axis.vertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDatePicker(context),
              if (widget.showTimePicker) _buildTimePicker(context),
            ],
          )
        : Row(
            children: [
              Expanded(child: _buildDatePicker(context)),
              if (widget.showTimePicker) SizedBox(width: 4.0),
              if (widget.showTimePicker)
                Expanded(child: _buildTimePicker(context)),
            ],
          );
  }

  Widget _buildDatePicker(BuildContext context) {
    final dateStr = DateFormat("dd MMM yyyy").format(_value);

    return AhlTappable(
      onPressed: () {},
      builder: (isPressed) => Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            decoration: BoxDecoration(
              color: widget.hoveredFillColor == null
                  ? widget.fillColor
                  : (isPressed ? widget.hoveredFillColor : widget.fillColor),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: widget.direction == Axis.vertical
                    ? Radius.circular(12.0)
                    : (Radius.circular(widget.showTimePicker ? 4.0 : 12.0)),
                bottomLeft: widget.direction == Axis.vertical
                    ? (Radius.circular(widget.showTimePicker ? 4.0 : 12.0))
                    : (Radius.circular(12.0)),
                bottomRight: Radius.circular(
                  widget.showTimePicker ? 4.0 : 12.0,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 12.0,
                ),
                child: Text(
                  dateStr,
                  style: widget.direction == Axis.vertical
                      ? Theme.of(context).textTheme.bodyLarge
                      : Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              decoration: BoxDecoration(
                color: widget.hoveredFillColor != null
                    ? Colors.transparent
                    : (isPressed ? AhlColors.transBlack12 : Colors.transparent),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: widget.direction == Axis.vertical
                      ? Radius.circular(12.0)
                      : (Radius.circular(widget.showTimePicker ? 4.0 : 12.0)),
                  bottomLeft: widget.direction == Axis.vertical
                      ? (Radius.circular(widget.showTimePicker ? 4.0 : 12.0))
                      : (Radius.circular(12.0)),
                  bottomRight: Radius.circular(
                    widget.showTimePicker ? 4.0 : 12.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    final timeStr = DateFormat("HHmm").format(_value);

    return Padding(
      padding: EdgeInsets.only(
        top: widget.direction == Axis.vertical ? 4.0 : 0,
      ),
      child: AhlTappable(
        onPressed: () {
          setState(() {
            _currentCursorPosition = 0;
          });

          _timeSheetController = showBottomSheet(
            context: context,
            builder: (context) => AhlTimePickerSheet(
              value: _value,
              onUpdated: (updatedTime, formattedTime, cursorPosition) {
                setState(() {
                  _value = updatedTime;
                  _currentCursorPosition = cursorPosition;
                });

                // After entering last position, close the bottom sheet
                if (cursorPosition > 3) {
                  _timeSheetController.close();
                }
              },
            ),
          );
        },
        builder: (isPressed) => Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              decoration: BoxDecoration(
                color: widget.hoveredFillColor == null
                    ? widget.fillColor
                    : (isPressed ? widget.hoveredFillColor : widget.fillColor),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: widget.direction == Axis.vertical
                      ? Radius.circular(4.0)
                      : Radius.circular(12.0),
                  bottomLeft: widget.direction == Axis.vertical
                      ? Radius.circular(12.0)
                      : Radius.circular(4.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTimeItem(context, timeStr[0], 0),
                      _buildTimeItem(context, timeStr[1], 1),
                      Text(
                        ":",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      _buildTimeItem(context, timeStr[2], 2),
                      _buildTimeItem(context, timeStr[3], 3),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                decoration: BoxDecoration(
                  color: widget.hoveredFillColor != null
                      ? Colors.transparent
                      : (isPressed
                            ? AhlColors.transBlack12
                            : Colors.transparent),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: widget.direction == Axis.vertical
                        ? Radius.circular(4.0)
                        : Radius.circular(12.0),
                    bottomLeft: widget.direction == Axis.vertical
                        ? Radius.circular(12.0)
                        : Radius.circular(4.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeItem(BuildContext context, String text, int position) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
        color: _currentCursorPosition == position
            ? Colors.black
            : Colors.transparent,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: _currentCursorPosition == position
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}
