import 'dart:math' as math;

import 'package:aholic/presentation/fragments/space_fragment.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_action_bar.dart';
import 'package:aholic/presentation/widgets/ahl_bottom_navigation_bar.dart';
import 'package:aholic/presentation/widgets/ahl_calendar_4.dart';
import 'package:aholic/presentation/widgets/ahl_icon_button.dart';
import 'package:aholic/presentation/widgets/ahl_scaffold.dart';
import 'package:aholic/presentation/widgets/ahl_tab_layout.dart';
import 'package:flutter/material.dart';

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
  bool _openItemMenu = false;
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return AhlScaffold(
      body: IndexedStack(
        index: _tabIndex,
        children: [AhlCalendar4(), SpaceFragment()],
      ),

      actionBar: _buildActionBar(context),
      bottomNavigationBar: AhlBottomNavigationBar(
        onChanged: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
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
        if (_openItemMenu) {
          return Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ItemButton(
                    "Event",
                    icon: LucideIcons.calendar400,
                    onPressed: () {
                      context.go("/events/edit");
                    },
                  ),
                  _ItemButton(
                    "Reminder",
                    icon: LucideIcons.alarmClock400,
                    onPressed: () {},
                  ),
                  _ItemButton(
                    "Transaction",
                    icon: LucideIcons.circleDollarSign400,
                    onPressed: () {
                      context.go("/transactions/edit");
                    },
                  ),
                ],
              ),
            ),
          );
        }

        return Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: AhlTabLayout(
                  initialIndex: 0,
                  type: TabLayoutType.secondary,
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
                icon: LucideIcons.bolt400,
                iconColor: Colors.white,
                hoveredIconColor: Colors.white,
                onPressed: () {
                  context.go("/timelines");
                },
              ),
            ],
          ),
        );
      },
      // trailingIcon: _openItemMenu ? LucideIcons.x400 : LucideIcons.plus400,
      trailingWidgetBuilder: (context) {
        return AhlIconButton(
          onPressed: () {
            setState(() {
              _openItemMenu = !_openItemMenu;
            });
          },
          builder: (context) => AnimatedRotation(
            turns: _openItemMenu ? 0.125 : 0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Icon(LucideIcons.plus400, color: Colors.white),
          ),
        );
      },
      onTrailingBtnClick: () {},
    );
  }
}

class _ItemButton extends StatefulWidget {
  const _ItemButton(this.title, {super.key, this.icon, this.onPressed});

  final String title;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  State<_ItemButton> createState() => _ItemButtonState();
}

class _ItemButtonState extends State<_ItemButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() {
        _isPressed = true;
      }),
      onTapUp: (_) => setState(() {
        _isPressed = false;
      }),
      onTapCancel: () => setState(() {
        _isPressed = false;
      }),
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: _isPressed ? AhlColors.transBlack50 : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            children: [
              Icon(widget.icon, color: Colors.white),
              SizedBox(width: 8.0),
              Text(
                widget.title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
