import 'package:flutter/material.dart';

class AhlCalendar extends StatelessWidget {
  AhlCalendar({super.key});

  final controller = PageController(initialPage: 1001);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 2001,
      controller: controller,
      itemBuilder: (context, index) {
        int offset = index - 1001;
        DateTime now = DateTime.now();
        DateTime current = DateTime(now.year, now.month + offset, 1);

        return _buildMonthView(context, current);
      },
    );
  }

  Widget _buildMonthView(BuildContext context, DateTime month) {
    final columns = <Widget>[];

    // build the first week possibly with days in previous month
    var rows = <Widget>[];
    var i = month.weekday == DateTime.sunday ? 0 : month.weekday;

    while (i > 0) {
      rows.add(_buildDayView(context, month.add(Duration(days: -1 * i))));
      i--;
    }

    for (var j = 0; j <= DateTime(month.year, month.month, 0).day; j++) {
      if (rows.length == 7) {
        columns.add(_buildWeekView(context, rows));
        rows = <Widget>[];
      }

      rows.add(_buildDayView(context, month.add(Duration(days: j))));
    }

    // build the last week possibly with days in the next month
    var k = rows.length;

    while (k < 7) {
      rows.add(
        _buildDayView(
          context,
          DateTime(
            month.year,
            month.month,
            0,
          ).add(Duration(days: k - rows.length + 1)),
        ),
      );

      k++;
    }

    columns.add(_buildWeekView(context, rows));

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: columns,
      ),
      color: Colors.white,
    );
  }

  Widget _buildWeekView(BuildContext context, List<Widget> dayViews) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: dayViews,
    );
  }

  Widget _buildDayView(BuildContext context, DateTime day) {
    return Text(day.day.toString());
  }
}
