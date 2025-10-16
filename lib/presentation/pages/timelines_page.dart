import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_action_bar.dart';
import 'package:aholic/presentation/widgets/ahl_app_bar.dart';
import 'package:aholic/presentation/widgets/ahl_list_item.dart';
import 'package:aholic/presentation/widgets/ahl_scaffold.dart';
import 'package:aholic/presentation/widgets/ahl_search_bar.dart';
import 'package:aholic/presentation/widgets/ahl_switch.dart';
import 'package:aholic/presentation/widgets/ahl_tab_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TimelinesPage extends StatefulWidget {
  const TimelinesPage({super.key});

  @override
  State<TimelinesPage> createState() => _TimelinesPageState();
}

class _TimelinesPageState extends State<TimelinesPage> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return AhlScaffold(
      appBar: AhlAppBar(title: "Timelines"),
      body: Column(
        children: [
          AhlTabLayout(
            items: [
              TabItem(title: "All"),
              TabItem(title: "Personal"),
              TabItem(title: "Friends"),
              TabItem(title: "Community"),
            ],
            type: TabLayoutType.primary,
          ),
          AhlSearchBar(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Text(
                "Visibility",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AhlColors.transBlack50),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return AhlListItem(
                  icon: Icons.star_outline_outlined,
                  iconColor: AhlColors.yellow,
                  title: "My timeline",
                  subtitle: "Default",
                  trailingWidgetBuilder: (context) {
                    return AhlSwitch(
                      value: _isOn,
                      onChanged: (value) => setState(() {
                        _isOn = value;
                      }),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      actionBar: AhlActionBar(
        leadingIcon: LucideIcons.chevronLeft400,
        trailingIcon: LucideIcons.plus400,
        onLeadingBtnClick: () {
          context.go("/");
        },
        onTrailingBtnClick: () {
          context.go("/timelines/edit");
        },
      ),
    );
  }
}
