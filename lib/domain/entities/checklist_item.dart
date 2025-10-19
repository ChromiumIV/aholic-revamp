import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_item.freezed.dart';

@freezed
abstract class ChecklistItem with _$ChecklistItem {
  const factory ChecklistItem({
    required String title,
    required int order,
    @Default(false) bool isChecked,
  }) = _ChecklistItem;
}
