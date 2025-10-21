import 'package:aholic/domain/entities/checklist_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aholic/domain/entities/pinnable.dart';

part 'checklist.freezed.dart';

@freezed
abstract class Checklist with _$Checklist {
  const factory Checklist({
    required Pinnable pinnable,
    required int color,
    required List<ChecklistItem> items,
  }) = _Checklist;
}
