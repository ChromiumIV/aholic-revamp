import 'package:flutter/material.dart';

class SnappingCalendar extends StatefulWidget {
  const SnappingCalendar({Key? key}) : super(key: key);

  @override
  State<SnappingCalendar> createState() => _SnappingCalendarState();
}

class _SnappingCalendarState extends State<SnappingCalendar> {
  late ScrollController _scrollController;
  final int _initialMonthOffset = 1200; // Start at a middle point
  double _currentScrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Jump to initial position after first frame
      _scrollController.jumpTo(_currentScrollOffset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  MonthData _getMonthData(int monthOffset) {
    final now = DateTime.now();
    final targetDate = DateTime(now.year, now.month + monthOffset, 1);
    
    // Calculate weeks in this month
    final firstDayOfMonth = DateTime(targetDate.year, targetDate.month, 1);
    final lastDayOfMonth = DateTime(targetDate.year, targetDate.month + 1, 0);
    
    // Find the Monday of the week containing the first day
    final firstWeekStart = firstDayOfMonth.subtract(
      Duration(days: (firstDayOfMonth.weekday - 1) % 7),
    );
    
    // Find the Sunday of the week containing the last day
    final lastWeekEnd = lastDayOfMonth.add(
      Duration(days: (7 - lastDayOfMonth.weekday) % 7),
    );
    
    final totalDays = lastWeekEnd.difference(firstWeekStart).inDays + 1;
    final numberOfWeeks = (totalDays / 7).ceil();
    
    return MonthData(
      year: targetDate.year,
      month: targetDate.month,
      numberOfWeeks: numberOfWeeks,
      firstWeekStart: firstWeekStart,
    );
  }

  double _calculateScrollOffset(int monthOffset, double screenHeight) {
    double offset = 0;
    for (int i = 0; i < monthOffset; i++) {
      final monthData = _getMonthData(i - _initialMonthOffset);
      offset += screenHeight; // Each month takes full screen height
    }
    return offset;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 
                         MediaQuery.of(context).padding.top - 
                         kToolbarHeight;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          setState(() {
            _currentScrollOffset = _scrollController.offset;
          });
        }
        return false;
      },
      child: ListView.builder(
        controller: _scrollController,
        physics: const PageScrollPhysics(), // Snapping behavior
        itemBuilder: (context, index) {
          final monthOffset = index - _initialMonthOffset;
          final monthData = _getMonthData(monthOffset);
          
          return SizedBox(
            height: screenHeight,
            child: MonthView(
              monthData: monthData,
              screenHeight: screenHeight,
            ),
          );
        },
      ),
    );
  }
}

class MonthData {
  final int year;
  final int month;
  final int numberOfWeeks;
  final DateTime firstWeekStart;

  MonthData({
    required this.year,
    required this.month,
    required this.numberOfWeeks,
    required this.firstWeekStart,
  });

  String get monthName {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}

class MonthView extends StatelessWidget {
  final MonthData monthData;
  final double screenHeight;

  const MonthView({
    Key? key,
    required this.monthData,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rowHeight = screenHeight / monthData.numberOfWeeks;

    return Column(
      children: [
        // Month header
        Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            '${monthData.monthName} ${monthData.year}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
        // Weekday headers
        _buildWeekdayHeaders(),
        
        // Weeks
        Expanded(
          child: Column(
            children: List.generate(
              monthData.numberOfWeeks,
              (weekIndex) => AnimatedWeekRow(
                weekStartDate: monthData.firstWeekStart.add(
                  Duration(days: weekIndex * 7),
                ),
                currentMonth: monthData.month,
                currentYear: monthData.year,
                height: rowHeight - (weekIndex == 0 ? 60 : 0), // Account for headers
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeekdayHeaders() {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: weekdays.map((day) {
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class AnimatedWeekRow extends StatefulWidget {
  final DateTime weekStartDate;
  final int currentMonth;
  final int currentYear;
  final double height;

  const AnimatedWeekRow({
    Key? key,
    required this.weekStartDate,
    required this.currentMonth,
    required this.currentYear,
    required this.height,
  }) : super(key: key);

  @override
  State<AnimatedWeekRow> createState() => _AnimatedWeekRowState();
}

class _AnimatedWeekRowState extends State<AnimatedWeekRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;
  double _previousHeight = 0;

  @override
  void initState() {
    super.initState();
    _previousHeight = widget.height;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightAnimation = Tween<double>(
      begin: widget.height,
      end: widget.height,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(AnimatedWeekRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.height != widget.height) {
      _heightAnimation = Tween<double>(
        begin: _previousHeight,
        end: widget.height,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ));
      _animationController.forward(from: 0);
      _previousHeight = widget.height;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _heightAnimation,
      builder: (context, child) {
        return Container(
          height: _heightAnimation.value,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Row(
            children: List.generate(7, (dayIndex) {
              final date = widget.weekStartDate.add(Duration(days: dayIndex));
              final isCurrentMonth = date.month == widget.currentMonth &&
                                     date.year == widget.currentYear;
              final isToday = _isToday(date);
              
              return Expanded(
                child: _buildDayCell(date, isCurrentMonth, isToday),
              );
            }),
          ),
        );
      },
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
           date.month == now.month &&
           date.day == now.day;
  }

  Widget _buildDayCell(DateTime date, bool isCurrentMonth, bool isToday) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: isToday ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          '${date.day}',
          style: TextStyle(
            fontSize: 16,
            color: isToday
                ? Colors.white
                : isCurrentMonth
                    ? Colors.black
                    : Colors.grey.shade400,
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}