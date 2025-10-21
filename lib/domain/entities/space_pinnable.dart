import 'package:freezed_annotation/freezed_annotation.dart';

part 'space_pinnable.freezed.dart';

@freezed
abstract class SpacePinnable with _$SpacePinnable {
  const factory SpacePinnable({
    required int spaceId,
    required int pinnableId,
    required DateTime createdAt,
    required String createdBy,
  }) = _SpacePinnable;
}
