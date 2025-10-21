import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_item.freezed.dart';

@freezed
abstract class ChecklistItem with _$ChecklistItem {
  const factory ChecklistItem({
    int? itemId,
    int? pinnableId,
    required String title,
    required int order,
    @Default(false) bool isChecked,
    required DateTime createdAt,
    required String createdBy,
  }) = _ChecklistItem;
}
