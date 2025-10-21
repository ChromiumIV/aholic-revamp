import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'space_user.freezed.dart';

@freezed
abstract class SpaceUser with _$SpaceUser {
  const factory SpaceUser({
    required int spaceId,
    required String userId,
    int? parentSpaceId,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedAt,
    required String updatedBy,
  }) = _SpaceUser;
}
