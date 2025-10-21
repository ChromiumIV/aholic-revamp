// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'space_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpaceUser implements DiagnosticableTreeMixin {

 int get spaceId; String get userId; int? get parentSpaceId; DateTime get createdAt; String get createdBy; DateTime get updatedAt; String get updatedBy;
/// Create a copy of SpaceUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpaceUserCopyWith<SpaceUser> get copyWith => _$SpaceUserCopyWithImpl<SpaceUser>(this as SpaceUser, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SpaceUser'))
    ..add(DiagnosticsProperty('spaceId', spaceId))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('parentSpaceId', parentSpaceId))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('createdBy', createdBy))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('updatedBy', updatedBy));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpaceUser&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentSpaceId, parentSpaceId) || other.parentSpaceId == parentSpaceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}


@override
int get hashCode => Object.hash(runtimeType,spaceId,userId,parentSpaceId,createdAt,createdBy,updatedAt,updatedBy);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SpaceUser(spaceId: $spaceId, userId: $userId, parentSpaceId: $parentSpaceId, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class $SpaceUserCopyWith<$Res>  {
  factory $SpaceUserCopyWith(SpaceUser value, $Res Function(SpaceUser) _then) = _$SpaceUserCopyWithImpl;
@useResult
$Res call({
 int spaceId, String userId, int? parentSpaceId, DateTime createdAt, String createdBy, DateTime updatedAt, String updatedBy
});




}
/// @nodoc
class _$SpaceUserCopyWithImpl<$Res>
    implements $SpaceUserCopyWith<$Res> {
  _$SpaceUserCopyWithImpl(this._self, this._then);

  final SpaceUser _self;
  final $Res Function(SpaceUser) _then;

/// Create a copy of SpaceUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? spaceId = null,Object? userId = null,Object? parentSpaceId = freezed,Object? createdAt = null,Object? createdBy = null,Object? updatedAt = null,Object? updatedBy = null,}) {
  return _then(_self.copyWith(
spaceId: null == spaceId ? _self.spaceId : spaceId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,parentSpaceId: freezed == parentSpaceId ? _self.parentSpaceId : parentSpaceId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedBy: null == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpaceUser].
extension SpaceUserPatterns on SpaceUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpaceUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpaceUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpaceUser value)  $default,){
final _that = this;
switch (_that) {
case _SpaceUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpaceUser value)?  $default,){
final _that = this;
switch (_that) {
case _SpaceUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int spaceId,  String userId,  int? parentSpaceId,  DateTime createdAt,  String createdBy,  DateTime updatedAt,  String updatedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpaceUser() when $default != null:
return $default(_that.spaceId,_that.userId,_that.parentSpaceId,_that.createdAt,_that.createdBy,_that.updatedAt,_that.updatedBy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int spaceId,  String userId,  int? parentSpaceId,  DateTime createdAt,  String createdBy,  DateTime updatedAt,  String updatedBy)  $default,) {final _that = this;
switch (_that) {
case _SpaceUser():
return $default(_that.spaceId,_that.userId,_that.parentSpaceId,_that.createdAt,_that.createdBy,_that.updatedAt,_that.updatedBy);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int spaceId,  String userId,  int? parentSpaceId,  DateTime createdAt,  String createdBy,  DateTime updatedAt,  String updatedBy)?  $default,) {final _that = this;
switch (_that) {
case _SpaceUser() when $default != null:
return $default(_that.spaceId,_that.userId,_that.parentSpaceId,_that.createdAt,_that.createdBy,_that.updatedAt,_that.updatedBy);case _:
  return null;

}
}

}

/// @nodoc


class _SpaceUser with DiagnosticableTreeMixin implements SpaceUser {
  const _SpaceUser({required this.spaceId, required this.userId, this.parentSpaceId, required this.createdAt, required this.createdBy, required this.updatedAt, required this.updatedBy});
  

@override final  int spaceId;
@override final  String userId;
@override final  int? parentSpaceId;
@override final  DateTime createdAt;
@override final  String createdBy;
@override final  DateTime updatedAt;
@override final  String updatedBy;

/// Create a copy of SpaceUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpaceUserCopyWith<_SpaceUser> get copyWith => __$SpaceUserCopyWithImpl<_SpaceUser>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SpaceUser'))
    ..add(DiagnosticsProperty('spaceId', spaceId))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('parentSpaceId', parentSpaceId))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('createdBy', createdBy))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('updatedBy', updatedBy));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpaceUser&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.parentSpaceId, parentSpaceId) || other.parentSpaceId == parentSpaceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}


@override
int get hashCode => Object.hash(runtimeType,spaceId,userId,parentSpaceId,createdAt,createdBy,updatedAt,updatedBy);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SpaceUser(spaceId: $spaceId, userId: $userId, parentSpaceId: $parentSpaceId, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class _$SpaceUserCopyWith<$Res> implements $SpaceUserCopyWith<$Res> {
  factory _$SpaceUserCopyWith(_SpaceUser value, $Res Function(_SpaceUser) _then) = __$SpaceUserCopyWithImpl;
@override @useResult
$Res call({
 int spaceId, String userId, int? parentSpaceId, DateTime createdAt, String createdBy, DateTime updatedAt, String updatedBy
});




}
/// @nodoc
class __$SpaceUserCopyWithImpl<$Res>
    implements _$SpaceUserCopyWith<$Res> {
  __$SpaceUserCopyWithImpl(this._self, this._then);

  final _SpaceUser _self;
  final $Res Function(_SpaceUser) _then;

/// Create a copy of SpaceUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? spaceId = null,Object? userId = null,Object? parentSpaceId = freezed,Object? createdAt = null,Object? createdBy = null,Object? updatedAt = null,Object? updatedBy = null,}) {
  return _then(_SpaceUser(
spaceId: null == spaceId ? _self.spaceId : spaceId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,parentSpaceId: freezed == parentSpaceId ? _self.parentSpaceId : parentSpaceId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedBy: null == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
