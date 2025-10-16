import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:aholic/presentation/widgets/ahl_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AhlUserAvatar extends StatelessWidget {
  const AhlUserAvatar(
    this.username, {
    super.key,
    this.isDisabled = false,
    this.isPending = false,
    this.iconColor,
    this.pendingIndicatorColor = AhlColors.red,
    this.onCancelBtnPressed,
  });

  final String username;
  final Color? iconColor;
  final bool isDisabled;
  final bool isPending;
  final Color pendingIndicatorColor;
  final VoidCallback? onCancelBtnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Opacity(
              opacity: isDisabled ? 0.5 : 1.0,
              child: Container(
                height: 56.0,
                width: 56.0,
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: Icon(
                  LucideIcons.user400,
                  color: AhlColors.transBlack50,
                  size: 28.0,
                ),
              ),
            ),
            if (onCancelBtnPressed != null)
              GestureDetector(
                onTap: () => onCancelBtnPressed?.call(),
                child: Container(
                  height: 16.0,
                  width: 16.0,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: OvalBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                  ),
                  child: Icon(LucideIcons.x400, color: Colors.white, size: 12.0),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: SizedBox(
            width: 60.0,
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      username,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDisabled
                            ? AhlColors.transBlack50
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                if (isPending)
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Container(
                      width: 6.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                        color: pendingIndicatorColor,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
