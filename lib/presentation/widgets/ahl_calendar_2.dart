import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late ScrollController _scrollController;
  late DateTime _currentVisibleMonth;
  final double _weekHeight = 60.0;
  final int _totalMonths = 24;
  
  List<WeekData> _allWeeks = [];
  Map<DateTime, int> _monthToFirstWeekIndex = {};
  
  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _currentVisibleMonth = DateTime(now.year, now.month, 1);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    
    _generateAllWeeks();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentMonth();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _generateAllWeeks() {
    _allWeeks.clear();
    _monthToFirstWeekIndex.clear();
    
    for (int i = 0; i < _totalMonths; i++) {
      final month = _getMonthForIndex(i);
      _monthToFirstWeekIndex[month] = _allWeeks.length;
      
      final weeks = _generateWeeksForMonth(month);
      _allWeeks.addAll(weeks);
    }
  }

  List<WeekData> _generateWeeksForMonth(DateTime month) {
    final List<WeekData> weeks = [];
    final List<DayInfo> allDays = [];
    
    // First day of the month
    final firstDay = DateTime(month.year, month.month, 1);
    final firstWeekday = firstDay.weekday % 7;
    
    // Last day of the month
    final lastDay = DateTime(month.year, month.month + 1, 0);
    final lastWeekday = lastDay.weekday % 7;
    
    // Add days from previous month
    if (firstWeekday > 0) {
      final prevMonth = DateTime(month.year, month.month, 0);
      final prevMonthLastDay = prevMonth.day;
      for (int i = firstWeekday - 1; i >= 0; i--) {
        allDays.add(DayInfo(
          day: prevMonthLastDay - i,
          actualMonth: prevMonth,
          displayMonth: month,
        ));
      }
    }
    
    // Add days from current month
    for (int i = 1; i <= lastDay.day; i++) {
      allDays.add(DayInfo(
        day: i,
        actualMonth: month,
        displayMonth: month,
      ));
    }
    
    // Add days from next month
    if (lastWeekday < 6) {
      final nextMonth = DateTime(month.year, month.month + 1, 1);
      for (int i = 1; i <= 6 - lastWeekday; i++) {
        allDays.add(DayInfo(
          day: i,
          actualMonth: nextMonth,
          displayMonth: month,
        ));
      }
    }
    
    // Group days into weeks
    for (int i = 0; i < allDays.length; i += 7) {
      final weekDays = allDays.sublist(i, (i + 7).clamp(0, allDays.length));
      // Pad with empty days if needed
      while (weekDays.length < 7) {
        weekDays.add(DayInfo(
          day: 0,
          actualMonth: month,
          displayMonth: month,
        ));
      }
      weeks.add(WeekData(days: weekDays, month: month));
    }
    
    return weeks;
  }

  void _scrollToCurrentMonth() {
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month, 1);
    final weekIndex = _monthToFirstWeekIndex[currentMonth] ?? 0;
    _scrollController.jumpTo(weekIndex * _weekHeight);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    
    final scrollOffset = _scrollController.offset;
    final weekIndex = (scrollOffset / _weekHeight).round().clamp(0, _allWeeks.length - 1);
    
    if (weekIndex < _allWeeks.length) {
      final week = _allWeeks[weekIndex];
      final newVisibleMonth = week.month;
      
      if (newVisibleMonth.year != _currentVisibleMonth.year || 
          newVisibleMonth.month != _currentVisibleMonth.month) {
        setState(() {
          _currentVisibleMonth = newVisibleMonth;
        });
      }
    }
  }

  DateTime _getMonthForIndex(int index) {
    final now = DateTime.now();
    return DateTime(now.year, now.month + index - 12, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar Widget'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          _buildStickyHeader(),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollEndNotification) {
                  _snapToWeek();
                }
                return false;
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _allWeeks.length,
                itemExtent: _weekHeight,
                itemBuilder: (context, index) {
                  return WeekRow(
                    weekData: _allWeeks[index],
                    weekIndex: index,
                    scrollController: _scrollController,
                    weekHeight: _weekHeight,
                    monthToFirstWeekIndex: _monthToFirstWeekIndex,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStickyHeader() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(
              '${_getMonthName(_currentVisibleMonth.month)} ${_currentVisibleMonth.year}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildWeekdayHeader(),
        ],
      ),
    );
  }

  Widget _buildWeekdayHeader() {
    const weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
          bottom: BorderSide(color: Colors.grey[400]!, width: 1),
        ),
      ),
      child: Row(
        children: weekdays.map((day) {
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _snapToWeek() {
    if (!_scrollController.hasClients) return;
    
    final scrollOffset = _scrollController.offset;
    
    // Find nearest month start
    DateTime? nearestMonth;
    int nearestWeekIndex = 0;
    double minDistance = double.infinity;
    
    _monthToFirstWeekIndex.forEach((month, weekIndex) {
      final monthPosition = weekIndex * _weekHeight;
      final distance = (scrollOffset - monthPosition).abs();
      
      if (distance < minDistance) {
        minDistance = distance;
        nearestMonth = month;
        nearestWeekIndex = weekIndex;
      }
    });
    
    // Snap to the nearest month's first week
    if (nearestMonth != null) {
      final targetOffset = nearestWeekIndex * _weekHeight;
      
      _scrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}

class WeekData {
  final List<DayInfo> days;
  final DateTime month;

  WeekData({required this.days, required this.month});
}

class WeekRow extends StatefulWidget {
  final WeekData weekData;
  final int weekIndex;
  final ScrollController scrollController;
  final double weekHeight;
  final Map<DateTime, int> monthToFirstWeekIndex;

  const WeekRow({
    Key? key,
    required this.weekData,
    required this.weekIndex,
    required this.scrollController,
    required this.weekHeight,
    required this.monthToFirstWeekIndex,
  }) : super(key: key);

  @override
  State<WeekRow> createState() => _WeekRowState();
}

class _WeekRowState extends State<WeekRow> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (mounted) {
      setState(() {});
    }
  }

  double _getAnimationProgressForDay(DayInfo dayInfo) {
    if (!widget.scrollController.hasClients) {
      return dayInfo.actualMonth.year == dayInfo.displayMonth.year && 
             dayInfo.actualMonth.month == dayInfo.displayMonth.month ? 1.0 : 0.0;
    }

    final scrollOffset = widget.scrollController.offset;
    
    // Get the first week index of the day's actual month
    final actualMonthFirstWeek = widget.monthToFirstWeekIndex[dayInfo.actualMonth] ?? 0;
    final actualMonthPosition = actualMonthFirstWeek * widget.weekHeight;
    
    // Current week position
    final currentWeekPosition = widget.weekIndex * widget.weekHeight;
    
    // Calculate if this day belongs to the current display month
    final isInDisplayMonth = dayInfo.actualMonth.year == dayInfo.displayMonth.year && 
                             dayInfo.actualMonth.month == dayInfo.displayMonth.month;
    
    // Animation zone: 2 weeks (120 pixels)
    const animationZone = 120.0;
    
    // Distance from scroll position to the actual month start
    final distanceToActualMonth = actualMonthPosition - scrollOffset;
    
    // If we're within the animation zone of the actual month
    if (distanceToActualMonth.abs() < animationZone) {
      double progress;
      
      if (distanceToActualMonth <= 0) {
        // We've scrolled past or to the actual month start
        // Days in actual month should be white (progress = 1)
        // Days not in actual month should be gray (progress = 0)
        progress = isInDisplayMonth ? 1.0 : 0.0;
      } else {
        // We're approaching the actual month
        // Calculate smooth transition
        final normalizedDistance = distanceToActualMonth / animationZone;
        
        if (isInDisplayMonth) {
          // Days in actual month: gray -> white as we approach
          progress = 1.0 - normalizedDistance;
        } else {
          // Days not in actual month: white -> gray as we approach
          progress = normalizedDistance;
        }
        
        progress = progress.clamp(0.0, 1.0);
      }
      
      return progress;
    }
    
    // Outside animation zone
    // Check if we're past the actual month or before it
    if (scrollOffset >= actualMonthPosition) {
      // We're at or past the actual month
      return isInDisplayMonth ? 1.0 : 0.0;
    } else {
      // We're before the actual month
      return isInDisplayMonth ? 0.0 : 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.weekHeight,
      child: Row(
        children: widget.weekData.days.map((dayInfo) {
          if (dayInfo.day == 0) {
            return const Expanded(child: SizedBox());
          }
          
          final animationProgress = _getAnimationProgressForDay(dayInfo);
          
          return Expanded(
            child: DayCell(
              dayInfo: dayInfo,
              animationProgress: animationProgress,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DayInfo {
  final int day;
  final DateTime actualMonth; // The actual month this day belongs to
  final DateTime displayMonth; // The month grid this day is displayed in

  DayInfo({
    required this.day,
    required this.actualMonth,
    required this.displayMonth,
  });
}

class DayCell extends StatelessWidget {
  final DayInfo dayInfo;
  final double animationProgress;

  const DayCell({
    Key? key,
    required this.dayInfo,
    required this.animationProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Interpolate between gray and white based on animation progress
    final backgroundColor = Color.lerp(
      Colors.grey[300],
      Colors.white,
      animationProgress,
    );
    
    // Interpolate text color
    final textColor = Color.lerp(
      Colors.grey[600],
      Colors.black,
      animationProgress,
    );
    
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.grey[300]!, width: 0.5),
      ),
      child: Center(
        child: Text(
          '${dayInfo.day}',
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontWeight: animationProgress > 0.5 ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}