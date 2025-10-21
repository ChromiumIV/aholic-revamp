// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'space_pinnable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpacePinnable {

 int get spaceId; int get pinnableId; DateTime get createdAt; String get createdBy;
/// Create a copy of SpacePinnable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpacePinnableCopyWith<SpacePinnable> get copyWith => _$SpacePinnableCopyWithImpl<SpacePinnable>(this as SpacePinnable, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpacePinnable&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.pinnableId, pinnableId) || other.pinnableId == pinnableId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}


@override
int get hashCode => Object.hash(runtimeType,spaceId,pinnableId,createdAt,createdBy);

@override
String toString() {
  return 'SpacePinnable(spaceId: $spaceId, pinnableId: $pinnableId, createdAt: $createdAt, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class $SpacePinnableCopyWith<$Res>  {
  factory $SpacePinnableCopyWith(SpacePinnable value, $Res Function(SpacePinnable) _then) = _$SpacePinnableCopyWithImpl;
@useResult
$Res call({
 int spaceId, int pinnableId, DateTime createdAt, String createdBy
});




}
/// @nodoc
class _$SpacePinnableCopyWithImpl<$Res>
    implements $SpacePinnableCopyWith<$Res> {
  _$SpacePinnableCopyWithImpl(this._self, this._then);

  final SpacePinnable _self;
  final $Res Function(SpacePinnable) _then;

/// Create a copy of SpacePinnable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? spaceId = null,Object? pinnableId = null,Object? createdAt = null,Object? createdBy = null,}) {
  return _then(_self.copyWith(
spaceId: null == spaceId ? _self.spaceId : spaceId // ignore: cast_nullable_to_non_nullable
as int,pinnableId: null == pinnableId ? _self.pinnableId : pinnableId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpacePinnable].
extension SpacePinnablePatterns on SpacePinnable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpacePinnable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpacePinnable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpacePinnable value)  $default,){
final _that = this;
switch (_that) {
case _SpacePinnable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpacePinnable value)?  $default,){
final _that = this;
switch (_that) {
case _SpacePinnable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int spaceId,  int pinnableId,  DateTime createdAt,  String createdBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpacePinnable() when $default != null:
return $default(_that.spaceId,_that.pinnableId,_that.createdAt,_that.createdBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int spaceId,  int pinnableId,  DateTime createdAt,  String createdBy)  $default,) {final _that = this;
switch (_that) {
case _SpacePinnable():
return $default(_that.spaceId,_that.pinnableId,_that.createdAt,_that.createdBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int spaceId,  int pinnableId,  DateTime createdAt,  String createdBy)?  $default,) {final _that = this;
switch (_that) {
case _SpacePinnable() when $default != null:
return $default(_that.spaceId,_that.pinnableId,_that.createdAt,_that.createdBy);case _:
  return null;

}
}

}

/// @nodoc


class _SpacePinnable implements SpacePinnable {
  const _SpacePinnable({required this.spaceId, required this.pinnableId, required this.createdAt, required this.createdBy});
  

@override final  int spaceId;
@override final  int pinnableId;
@override final  DateTime createdAt;
@override final  String createdBy;

/// Create a copy of SpacePinnable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpacePinnableCopyWith<_SpacePinnable> get copyWith => __$SpacePinnableCopyWithImpl<_SpacePinnable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpacePinnable&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.pinnableId, pinnableId) || other.pinnableId == pinnableId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}


@override
int get hashCode => Object.hash(runtimeType,spaceId,pinnableId,createdAt,createdBy);

@override
String toString() {
  return 'SpacePinnable(spaceId: $spaceId, pinnableId: $pinnableId, createdAt: $createdAt, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class _$SpacePinnableCopyWith<$Res> implements $SpacePinnableCopyWith<$Res> {
  factory _$SpacePinnableCopyWith(_SpacePinnable value, $Res Function(_SpacePinnable) _then) = __$SpacePinnableCopyWithImpl;
@override @useResult
$Res call({
 int spaceId, int pinnableId, DateTime createdAt, String createdBy
});




}
/// @nodoc
class __$SpacePinnableCopyWithImpl<$Res>
    implements _$SpacePinnableCopyWith<$Res> {
  __$SpacePinnableCopyWithImpl(this._self, this._then);

  final _SpacePinnable _self;
  final $Res Function(_SpacePinnable) _then;

/// Create a copy of SpacePinnable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? spaceId = null,Object? pinnableId = null,Object? createdAt = null,Object? createdBy = null,}) {
  return _then(_SpacePinnable(
spaceId: null == spaceId ? _self.spaceId : spaceId // ignore: cast_nullable_to_non_nullable
as int,pinnableId: null == pinnableId ? _self.pinnableId : pinnableId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
