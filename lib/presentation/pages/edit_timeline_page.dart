import 'package:aholic/presentation/widgets/ahl_action_bar.dart';
import 'package:aholic/presentation/widgets/ahl_text.dart';
import 'package:flutter/material.dart';

class EditTimelinePage extends StatelessWidget {
  const EditTimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AhlText("Edit timeline"),
        AhlActionBar()
      ],
    );
  }
}