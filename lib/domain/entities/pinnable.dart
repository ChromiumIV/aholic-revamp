import 'package:freezed_annotation/freezed_annotation.dart';

part 'pinnable.freezed.dart';

@freezed
abstract class Pinnable with _$Pinnable {
  const factory Pinnable({
    int? pinnableId,
    required String title,
    required String note,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
    required String updatedBy,
  }) = _Pinnable;
}
