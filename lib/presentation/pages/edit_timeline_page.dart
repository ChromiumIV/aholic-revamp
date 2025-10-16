import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_action_bar.dart';
import 'package:aholic/presentation/widgets/ahl_app_bar.dart';
import 'package:aholic/presentation/widgets/ahl_list_item.dart';
import 'package:aholic/presentation/widgets/ahl_scaffold.dart';
import 'package:aholic/presentation/widgets/ahl_search_bar.dart';
import 'package:aholic/presentation/widgets/ahl_text.dart';
import 'package:aholic/presentation/widgets/ahl_text_button.dart';
import 'package:aholic/presentation/widgets/ahl_text_field.dart';
import 'package:aholic/presentation/widgets/ahl_user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EditTimelinePage extends StatelessWidget {
  const EditTimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AhlScaffold(
      appBar: AhlAppBar(title: "Create timeline"), // TODO
      body: Column(
        children: [
          SizedBox(height: 12.0),
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Container(
                height: 56.0,
                width: 56.0,
                decoration: BoxDecoration(
                  color: AhlColors.cyan, // TODO
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: Icon(
                  Icons.star_outline, // TODO
                  size: 32.0,
                  color: AhlColors.transBlack50,
                ),
              ),
              Container(
                height: 66.0,
                width: 66.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AhlColors.transBlack12),
                  borderRadius: BorderRadius.circular(33.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AhlTextButton("Edit icon"), // TODO
              SizedBox(width: 8.0),
              AhlTextButton("Set default"), // TODO
            ],
          ),
          SizedBox(height: 20.0),
          AhlTextField(hintText: "Title"),
          SizedBox(height: 12.0),
          Container(
            height: 1.0,
            decoration: BoxDecoration(color: AhlColors.transBlack12),
          ),
          SizedBox(height: 12.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AhlText(
                "Share with (2/20)",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AhlColors.transBlack50),
              ),
            ),
          ),
          SizedBox(height: 18.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                AhlUserAvatar(
                  "Cow",
                  iconColor: AhlColors.azure,
                  isPending: true,
                  onCancelBtnPressed: () => {},
                ),
                SizedBox(width: 18.0),
                AhlUserAvatar(
                  "聯合國淨零框架",
                  iconColor: AhlColors.orange,
                  isPending: false,
                  onCancelBtnPressed: () => {},
                ),
                SizedBox(width: 18.0),
                AhlUserAvatar(
                  "Red Panda",
                  iconColor: AhlColors.pink,
                  isPending: true,
                  isDisabled: true,
                  onCancelBtnPressed: () => {},
                ),
                SizedBox(width: 18.0),
                GestureDetector(
                  onTap: () => {},
                  child: Column(
                    children: [
                      Container(
                        height: 56.0,
                        width: 56.0,
                        decoration: BoxDecoration(
                          color: AhlColors.transBlack50,
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                        child: Icon(
                          LucideIcons.userPlus400,
                          color: Colors.white,
                          size: 26.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Invite",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AhlColors.transBlack50),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 1.0,
              decoration: BoxDecoration(color: AhlColors.transBlack12),
            ),
          ),
          SizedBox(height: 4.0),
          AhlSearchBar(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 16.0, bottom: 82.0),
              itemCount: 33,
              itemBuilder: (context, index) {
                return AhlListItem(
                  title: "The Happy Cow",
                  icon: LucideIcons.user400,
                  iconColor: AhlColors.red,
                );
              },
            ),
          ),
        ],
      ),
      actionBar: AhlActionBar(
        leadingIcon: LucideIcons.chevronLeft400,
        trailingIcon: LucideIcons.check400,
        onLeadingBtnClick: () => context.go("/timelines"),
      ),
    );
  }
}
