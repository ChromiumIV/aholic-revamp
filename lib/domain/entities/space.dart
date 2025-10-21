import 'package:aholic/domain/entities/space_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'space.freezed.dart';

@freezed
abstract class Space with _$Space {
  const factory Space({
    int? spaceId,
    required String title,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
    required String updatedBy,
    required SpaceUser spaceUser,
  }) = _Space;
}
