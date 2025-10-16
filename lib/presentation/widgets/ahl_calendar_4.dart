
// import 'package:flutter/material.dart';

// class AhlCalendar4 extends StatefulWidget {
//   const AhlCalendar4({super.key});

//   @override
//   State<AhlCalendar4> createState() => _AhlCalendar4State();
// }

// class _AhlCalendar4State extends State<AhlCalendar4> {
//   late ScrollController _scrollController;
//   int _displayedWeeks = 5;
//   double _weekHeight = 100.0;
//   DateTime? _currentDisplayMonth;
//   bool _isSnapping = false;
//   List<List<DateTime>>? _cachedWeeks;
//   Map<String, int>? _monthStartIndices;
//   DateTime? _baseDate;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _baseDate = DateTime.now();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _initializeCalendar();
//     });

//     _scrollController.addListener(_onScroll);
//   }

//   void _initializeCalendar() {
//     if (!mounted) return;

//     final now = DateTime.now();
//     final height = MediaQuery.of(context).size.height;
//     final weeks = _getWeeksInMonth(now.year, now.month);

//     // Generate weeks on demand
//     _cachedWeeks = _getAllWeeks();
//     _monthStartIndices = _buildMonthStartIndices();

//     setState(() {
//       _displayedWeeks = weeks;
//       _weekHeight = height / weeks;
//       _currentDisplayMonth = DateTime(now.year, now.month, 1);
//     });

//     // Jump to current month
//     final weekIndex = _getFirstWeekIndexOfMonth(now);
//     if (_scrollController.hasClients && weekIndex > 0) {
//       _scrollController.jumpTo(weekIndex * _weekHeight);
//     }
//   }

//   // Build a map of month keys to their first week indices
//   Map<String, int> _buildMonthStartIndices() {
//     Map<String, int> indices = {};
//     if (_cachedWeeks == null) return indices;

//     for (int i = 0; i < _cachedWeeks!.length; i++) {
//       final week = _cachedWeeks![i];
//       // Check if this week contains the 1st day of any month
//       for (var date in week) {
//         if (date.day == 1) {
//           final key = '${date.year}-${date.month}';
//           if (!indices.containsKey(key)) {
//             indices[key] = i;
//           }
//         }
//       }
//     }

//     return indices;
//   }

//   void _onScroll() {
//     if (!_scrollController.hasClients || _isSnapping || _cachedWeeks == null)
//       return;

//     // Update current display month based on scroll position
//     final currentWeekIndex = (_scrollController.offset / _weekHeight).round();

//     if (currentWeekIndex >= 0 && currentWeekIndex < _cachedWeeks!.length) {
//       final primaryMonth = _getPrimaryMonthForWeek(
//         _cachedWeeks![currentWeekIndex],
//       );

//       if (_currentDisplayMonth == null ||
//           _currentDisplayMonth!.year != primaryMonth.year ||
//           _currentDisplayMonth!.month != primaryMonth.month) {
//         // Calculate weeks for the new month
//         final newWeeks = _getWeeksInMonth(
//           primaryMonth.year,
//           primaryMonth.month,
//         );

//         if (mounted) {
//           setState(() {
//             _currentDisplayMonth = primaryMonth;
//             _displayedWeeks = newWeeks;
//             // DON'T update week height during manual scrolling
//             // Only update it during snapping
//             // _weekHeight = MediaQuery.of(context).size.height / newWeeks;
//           });
//         }
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   int _getWeeksInMonth(int year, int month) {
//     final firstDay = DateTime(year, month, 1);
//     final lastDay = DateTime(year, month + 1, 0);
//     final firstWeekday = firstDay.weekday;
//     final daysInMonth = lastDay.day;

//     final totalCells = daysInMonth + (firstWeekday - 1);
//     return (totalCells / 7).ceil();
//   }

//   // Generate all weeks continuously without duplication
//   List<List<DateTime>> _getAllWeeks() {
//     List<List<DateTime>> allWeeks = [];
//     final now = _baseDate ?? DateTime.now();

//     // Start from a Monday 600 months ago
//     DateTime startDate = DateTime(now.year, now.month - 600, 1);

//     // Find the Monday of the week containing the first day
//     while (startDate.weekday != DateTime.monday) {
//       startDate = startDate.subtract(const Duration(days: 1));
//     }

//     // Generate weeks for approximately 1201 months
//     final endDate = DateTime(now.year, now.month + 601, 1);

//     DateTime currentDate = startDate;
//     while (currentDate.isBefore(endDate)) {
//       List<DateTime> week = [];
//       for (int i = 0; i < 7; i++) {
//         week.add(currentDate);
//         currentDate = currentDate.add(const Duration(days: 1));
//       }
//       allWeeks.add(week);
//     }

//     return allWeeks;
//   }

//   // Get the first week index that contains the 1st day of a month
//   int _getFirstWeekIndexOfMonth(DateTime month) {
//     if (_monthStartIndices != null) {
//       final key = '${month.year}-${month.month}';
//       return _monthStartIndices![key] ?? 0;
//     }

//     final now = _baseDate ?? DateTime.now();

//     // Start from a Monday 600 months ago
//     DateTime startDate = DateTime(now.year, now.month - 600, 1);
//     while (startDate.weekday != DateTime.monday) {
//       startDate = startDate.subtract(const Duration(days: 1));
//     }

//     // Find the week that contains the 1st of the target month
//     final firstDayOfMonth = DateTime(month.year, month.month, 1);
//     final daysDifference = firstDayOfMonth.difference(startDate).inDays;

//     return daysDifference ~/ 7;
//   }

//   // Get which month a week primarily belongs to
//   DateTime _getPrimaryMonthForWeek(List<DateTime> week) {
//     // Count days per month in this week
//     Map<String, int> monthCounts = {};

//     for (var date in week) {
//       final key = '${date.year}-${date.month}';
//       monthCounts[key] = (monthCounts[key] ?? 0) + 1;
//     }

//     // Find the month with most days
//     String primaryKey = monthCounts.entries
//         .reduce((a, b) => a.value > b.value ? a : b)
//         .key;

//     final parts = primaryKey.split('-');
//     return DateTime(int.parse(parts[0]), int.parse(parts[1]), 1);
//   }

//   // Find the nearest month start from current scroll position
//   DateTime _findNearestMonthStart(int currentWeekIndex) {
//     if (_cachedWeeks == null ||
//         _monthStartIndices == null ||
//         currentWeekIndex < 0 ||
//         currentWeekIndex >= _cachedWeeks!.length) {
//       return DateTime.now();
//     }

//     // Find the closest month start by checking the indices map
//     int closestDistance = double.maxFinite.toInt();
//     DateTime? closestMonth;

//     for (var entry in _monthStartIndices!.entries) {
//       final distance = (entry.value - currentWeekIndex).abs();
//       if (distance < closestDistance) {
//         closestDistance = distance;
//         final parts = entry.key.split('-');
//         closestMonth = DateTime(int.parse(parts[0]), int.parse(parts[1]), 1);
//       }
//     }

//     return closestMonth ?? DateTime.now();
//   }

//   Widget _buildWeekRow(List<DateTime> week, double height) {
//     final width = MediaQuery.of(context).size.width;
//     final cellWidth = width / 7;

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//       height: height,
//       child: Row(
//         children: week.map((date) {
//           final isCurrentMonth =
//               _currentDisplayMonth != null &&
//               date.year == _currentDisplayMonth!.year &&
//               date.month == _currentDisplayMonth!.month;
//           final isToday =
//               DateTime.now().year == date.year &&
//               DateTime.now().month == date.month &&
//               DateTime.now().day == date.day;

//           return Container(
//             width: cellWidth,
//             decoration: BoxDecoration(
//               color: isToday ? Colors.blue : Colors.white,
//               border: Border.all(color: Colors.grey.shade300, width: 0.5),
//             ),
//             child: Center(
//               child: AnimatedDefaultTextStyle(
//                 duration: const Duration(milliseconds: 200),
//                 curve: Curves.easeInOut,
//                 style: TextStyle(
//                   fontSize: 24,
//                   color: isToday
//                       ? Colors.white
//                       : (isCurrentMonth ? Colors.black : Colors.grey.shade400),
//                   fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
//                 ),
//                 child: Text(date.day.toString()),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_cachedWeeks == null || _monthStartIndices == null) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     final height = MediaQuery.of(context).size.height;
//     // Always use the current _weekHeight from state
//     final currentWeekHeight = _weekHeight;

//     return NotificationListener<ScrollNotification>(
//       onNotification: (scrollInfo) {
//         if (scrollInfo is ScrollEndNotification && !_isSnapping) {
//           _isSnapping = true;

//           // Calculate current week index based on CURRENT scroll position and CURRENT week height
//           final currentWeekIndex = (_scrollController.offset / _weekHeight)
//               .round();

//           // Find the nearest month that should be snapped to
//           final targetMonth = _findNearestMonthStart(currentWeekIndex);
//           final newWeeks = _getWeeksInMonth(
//             targetMonth.year,
//             targetMonth.month,
//           );

//           // Calculate new week height
//           final newWeekHeight = height / newWeeks;

//           // Find the first week of the target month
//           final monthStartWeekIndex = _getFirstWeekIndexOfMonth(targetMonth);

//           // Calculate target offset with new height
//           final targetOffset = monthStartWeekIndex * newWeekHeight;

//           // Update state FIRST
//           setState(() {
//             _displayedWeeks = newWeeks;
//             _weekHeight = newWeekHeight;
//             _currentDisplayMonth = targetMonth;
//           });

//           // Wait for the rebuild to complete with new heights, then animate
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             if (_scrollController.hasClients && mounted) {
//               // Check if we're already very close to the target
//               final currentOffset = _scrollController.offset;
//               if ((currentOffset - targetOffset).abs() < 1.0) {
//                 // Already at target, just reset the flag
//                 _isSnapping = false;
//               } else {
//                 _scrollController
//                     .animateTo(
//                       targetOffset,
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.easeOut,
//                     )
//                     .then((_) {
//                       if (mounted) {
//                         _isSnapping = false;
//                       }
//                     });
//               }
//             } else {
//               _isSnapping = false;
//             }
//           });
//         }
//         return false;
//       },

//       child: ListView.builder(
//         controller: _scrollController,
//         itemCount: _cachedWeeks!.length,
//         itemBuilder: (context, weekIndex) {
//           return _buildWeekRow(_cachedWeeks![weekIndex], currentWeekHeight);
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AhlCalendar4 extends StatefulWidget {
  const AhlCalendar4({super.key});

  @override
  State<AhlCalendar4> createState() => _AhlCalendar4State();
}

class _AhlCalendar4State extends State<AhlCalendar4> {
  late ScrollController _scrollController;
  int _displayedWeeks = 5;
  double _weekHeight = 100.0;
  DateTime? _currentDisplayMonth;
  bool _isSnapping = false;
  List<List<DateTime>>? _cachedWeeks;
  Map<String, int>? _monthStartIndices;
  DateTime? _baseDate;
  double _parentHeight = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _baseDate = DateTime.now();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCalendar();
    });

    _scrollController.addListener(_onScroll);
  }

  void _initializeCalendar() {
    if (!mounted) return;

    final now = DateTime.now();
    final weeks = _getWeeksInMonth(now.year, now.month);

    // Generate weeks on demand
    _cachedWeeks = _getAllWeeks();
    _monthStartIndices = _buildMonthStartIndices();

    // Get parent height from context
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    final height = renderBox?.size.height ?? MediaQuery.of(context).size.height;
    _parentHeight = height;

    setState(() {
      _displayedWeeks = weeks;
      _weekHeight = height / weeks;
      _currentDisplayMonth = DateTime(now.year, now.month, 1);
    });

    // Jump to current month
    final weekIndex = _getFirstWeekIndexOfMonth(now);
    if (_scrollController.hasClients && weekIndex > 0) {
      _scrollController.jumpTo(weekIndex * _weekHeight);
    }
  }

  // Build a map of month keys to their first week indices
  Map<String, int> _buildMonthStartIndices() {
    Map<String, int> indices = {};
    if (_cachedWeeks == null) return indices;

    for (int i = 0; i < _cachedWeeks!.length; i++) {
      final week = _cachedWeeks![i];
      // Check if this week contains the 1st day of any month
      for (var date in week) {
        if (date.day == 1) {
          final key = '${date.year}-${date.month}';
          if (!indices.containsKey(key)) {
            indices[key] = i;
          }
        }
      }
    }

    return indices;
  }

  void _onScroll() {
    if (!_scrollController.hasClients || _isSnapping || _cachedWeeks == null)
      return;

    // Update current display month based on scroll position
    final currentWeekIndex = (_scrollController.offset / _weekHeight).round();

    if (currentWeekIndex >= 0 && currentWeekIndex < _cachedWeeks!.length) {
      final primaryMonth = _getPrimaryMonthForWeek(
        _cachedWeeks![currentWeekIndex],
      );

      if (_currentDisplayMonth == null ||
          _currentDisplayMonth!.year != primaryMonth.year ||
          _currentDisplayMonth!.month != primaryMonth.month) {
        // Calculate weeks for the new month
        final newWeeks = _getWeeksInMonth(
          primaryMonth.year,
          primaryMonth.month,
        );

        if (mounted) {
          setState(() {
            _currentDisplayMonth = primaryMonth;
            _displayedWeeks = newWeeks;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  int _getWeeksInMonth(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);
    final firstWeekday = firstDay.weekday % 7; // Convert to Sunday-based (0 = Sunday)
    final daysInMonth = lastDay.day;

    final totalCells = daysInMonth + firstWeekday;
    return (totalCells / 7).ceil();
  }

  // Generate all weeks continuously without duplication (starting from Sunday)
  List<List<DateTime>> _getAllWeeks() {
    List<List<DateTime>> allWeeks = [];
    final now = _baseDate ?? DateTime.now();

    // Start from a Sunday 600 months ago
    DateTime startDate = DateTime(now.year, now.month - 600, 1);

    // Find the Sunday of the week containing the first day
    while (startDate.weekday != DateTime.sunday) {
      startDate = startDate.subtract(const Duration(days: 1));
    }

    // Generate weeks for approximately 1201 months
    final endDate = DateTime(now.year, now.month + 601, 1);

    DateTime currentDate = startDate;
    while (currentDate.isBefore(endDate)) {
      List<DateTime> week = [];
      for (int i = 0; i < 7; i++) {
        week.add(currentDate);
        currentDate = currentDate.add(const Duration(days: 1));
      }
      allWeeks.add(week);
    }

    return allWeeks;
  }

  // Get the first week index that contains the 1st day of a month
  int _getFirstWeekIndexOfMonth(DateTime month) {
    if (_monthStartIndices != null) {
      final key = '${month.year}-${month.month}';
      return _monthStartIndices![key] ?? 0;
    }

    final now = _baseDate ?? DateTime.now();

    // Start from a Sunday 600 months ago
    DateTime startDate = DateTime(now.year, now.month - 600, 1);
    while (startDate.weekday != DateTime.sunday) {
      startDate = startDate.subtract(const Duration(days: 1));
    }

    // Find the week that contains the 1st of the target month
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final daysDifference = firstDayOfMonth.difference(startDate).inDays;

    return daysDifference ~/ 7;
  }

  // Get which month a week primarily belongs to
  DateTime _getPrimaryMonthForWeek(List<DateTime> week) {
    // Count days per month in this week
    Map<String, int> monthCounts = {};

    for (var date in week) {
      final key = '${date.year}-${date.month}';
      monthCounts[key] = (monthCounts[key] ?? 0) + 1;
    }

    // Find the month with most days
    String primaryKey = monthCounts.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;

    final parts = primaryKey.split('-');
    return DateTime(int.parse(parts[0]), int.parse(parts[1]), 1);
  }

  // Find the nearest month start from current scroll position
  DateTime _findNearestMonthStart(double currentOffset) {
    if (_cachedWeeks == null || _monthStartIndices == null) {
      return DateTime.now();
    }

    // Find the closest month start by checking actual positions
    double closestDistance = double.maxFinite;
    DateTime? closestMonth;
    int? closestWeekIndex;

    for (var entry in _monthStartIndices!.entries) {
      final weekIndex = entry.value;
      
      // Calculate what the offset would be for this month
      // We need to calculate backwards from current position
      final week = _cachedWeeks![weekIndex];
      final monthForWeek = _getPrimaryMonthForWeek(week);
      final weeksInMonth = _getWeeksInMonth(monthForWeek.year, monthForWeek.month);
      final heightForMonth = _parentHeight / weeksInMonth;
      final offsetForMonth = weekIndex * heightForMonth;
      
      final distance = (offsetForMonth - currentOffset).abs();
      if (distance < closestDistance) {
        closestDistance = distance;
        final parts = entry.key.split('-');
        closestMonth = DateTime(int.parse(parts[0]), int.parse(parts[1]), 1);
        closestWeekIndex = weekIndex;
      }
    }

    return closestMonth ?? DateTime.now();
  }

  Widget _buildWeekRow(List<DateTime> week, double height) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final cellWidth = width / 7;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: height,
          child: Row(
            children: week.map((date) {
              final isCurrentMonth =
                  _currentDisplayMonth != null &&
                  date.year == _currentDisplayMonth!.year &&
                  date.month == _currentDisplayMonth!.month;
              final isToday =
                  DateTime.now().year == date.year &&
                  DateTime.now().month == date.month &&
                  DateTime.now().day == date.day;

              return Container(
                width: cellWidth,
                decoration: BoxDecoration(
                  color: isToday ? Colors.blue : Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 0.5),
                ),
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    style: TextStyle(
                      fontSize: 24,
                      color: isToday
                          ? Colors.white
                          : (isCurrentMonth ? Colors.black : Colors.grey.shade400),
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                    ),
                    child: Text(date.day.toString()),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_cachedWeeks == null || _monthStartIndices == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Always use the current _weekHeight from state
    final currentWeekHeight = _weekHeight;

    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        _parentHeight = height;

        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo is ScrollEndNotification && !_isSnapping) {
              _isSnapping = true;

              // Get current scroll offset
              final currentOffset = _scrollController.offset;

              // Find the nearest month that should be snapped to
              final targetMonth = _findNearestMonthStart(currentOffset);
              final newWeeks = _getWeeksInMonth(
                targetMonth.year,
                targetMonth.month,
              );

              // Calculate new week height using parent's height
              final newWeekHeight = height / newWeeks;

              // Find the first week of the target month
              final monthStartWeekIndex = _getFirstWeekIndexOfMonth(targetMonth);

              // Calculate target offset with new height
              final targetOffset = monthStartWeekIndex * newWeekHeight;

              // Update state FIRST
              setState(() {
                _displayedWeeks = newWeeks;
                _weekHeight = newWeekHeight;
                _currentDisplayMonth = targetMonth;
              });

              // Wait for the rebuild to complete with new heights, then animate
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (_scrollController.hasClients && mounted) {
                  // Check if we're already very close to the target
                  final currentOffset = _scrollController.offset;
                  if ((currentOffset - targetOffset).abs() < 1.0) {
                    // Already at target, just reset the flag
                    _isSnapping = false;
                  } else {
                    _scrollController
                        .animateTo(
                          targetOffset,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        )
                        .then((_) {
                          if (mounted) {
                            _isSnapping = false;
                          }
                        });
                  }
                } else {
                  _isSnapping = false;
                }
              });
            }
            return false;
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _cachedWeeks!.length,
            itemBuilder: (context, weekIndex) {
              return _buildWeekRow(_cachedWeeks![weekIndex], currentWeekHeight);
            },
          ),
        );
      },
    );
  }
}
