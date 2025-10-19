import 'package:aholic/domain/entities/checklist.dart';
import 'package:flutter/material.dart';

class ChecklistWidget extends StatelessWidget {
  const ChecklistWidget(this.checklist, {super.key});

  final Checklist checklist;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
        color: checklist.color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              checklist.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          ...checklist.items.map(
            (i) => Text(i.title, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
