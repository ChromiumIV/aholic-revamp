import 'dart:ui';

import 'package:aholic/domain/entities/checklist_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist.freezed.dart';

@freezed
abstract class Checklist with _$Checklist {
  const factory Checklist({
    required String title,
    required List<ChecklistItem> items,
    required Color color,
  }) = _Checklist;
}
