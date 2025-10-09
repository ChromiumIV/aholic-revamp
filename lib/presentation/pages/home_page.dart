import 'dart:math' as math;

import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_action_bar.dart';
import 'package:aholic/presentation/widgets/ahl_bottom_navigation_bar.dart';
import 'package:aholic/presentation/widgets/ahl_calendar.dart';
import 'package:aholic/presentation/widgets/ahl_icon_button.dart';
import 'package:aholic/presentation/widgets/ahl_scaffold.dart';
import 'package:aholic/presentation/widgets/ahl_tab_layout.dart';
import 'package:aholic/presentation/widgets/ahl_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String randomString = "";

  String generateRandomString(int length) {
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final random = Random();
    final randomString = List.generate(
      length,
      (index) => availableChars[random.nextInt(availableChars.length)],
    ).join();
    return randomString;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return AhlScaffold(
      body: AhlCalendar(),
      actionBar: _buildActionBar(context),
      bottomNavigationBar: AhlBottomNavigationBar(
        items: [
          BottomNavigationItem(icon: LucideIcons.rows2500),
          BottomNavigationItem(icon: LucideIcons.layoutDashboard500),
          BottomNavigationItem(
            builder: (context, isActive) {
              return Transform.rotate(
                angle: math.pi / 4,
                child: SizedBox(
                  width: 42.0,
                  height: 42.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(Icons.grid_3x3, color: Colors.white),
                  ),
                ),
              );
            },
          ),
          BottomNavigationItem(icon: LucideIcons.blend500),
          BottomNavigationItem(icon: LucideIcons.user500),
        ],
      ),
    );
  }

  Widget _buildActionBar(BuildContext context) {
    return AhlActionBar(
      leadingWidgetBuilder: (context) {
        return Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: AhlTabLayout(
                  initialIndex: 0,
                  mode: TabLayoutMode.dark,
                  items: [
                    TabItem(
                      title: "Timeline",
                      titleColor: Colors.white,
                      inactiveTitleColor: AhlColors.transWhite20,
                    ),
                    TabItem(
                      title: "Monthly",
                      titleColor: Colors.white,
                      inactiveTitleColor: AhlColors.transWhite20,
                    ),
                  ],
                ),
              ),
              Spacer(),
              AhlIconButton(
                LucideIcons.bolt400,
                iconColor: Colors.white,
                hoveredIconColor: Colors.white,
              ),
            ],
          ),
        );
      },
      trailingIcon: LucideIcons.chevronRight400,
    );
  }
}
