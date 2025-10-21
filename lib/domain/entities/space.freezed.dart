// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'space.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Space {

 int? get spaceId; String get title; DateTime get createdAt; String get createdBy; DateTime get updatedAt; String get updatedBy; SpaceUser get spaceUser;
/// Create a copy of Space
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpaceCopyWith<Space> get copyWith => _$SpaceCopyWithImpl<Space>(this as Space, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Space&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.spaceUser, spaceUser) || other.spaceUser == spaceUser));
}


@override
int get hashCode => Object.hash(runtimeType,spaceId,title,createdAt,createdBy,updatedAt,updatedBy,spaceUser);

@override
String toString() {
  return 'Space(spaceId: $spaceId, title: $title, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy, spaceUser: $spaceUser)';
}


}

/// @nodoc
abstract mixin class $SpaceCopyWith<$Res>  {
  factory $SpaceCopyWith(Space value, $Res Function(Space) _then) = _$SpaceCopyWithImpl;
@useResult
$Res call({
 int? spaceId, String title, DateTime createdAt, String createdBy, DateTime updatedAt, String updatedBy, SpaceUser spaceUser
});


$SpaceUserCopyWith<$Res> get spaceUser;

}
/// @nodoc
class _$SpaceCopyWithImpl<$Res>
    implements $SpaceCopyWith<$Res> {
  _$SpaceCopyWithImpl(this._self, this._then);

  final Space _self;
  final $Res Function(Space) _then;

/// Create a copy of Space
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? spaceId = freezed,Object? title = null,Object? createdAt = null,Object? createdBy = null,Object? updatedAt = null,Object? updatedBy = null,Object? spaceUser = null,}) {
  return _then(_self.copyWith(
spaceId: freezed == spaceId ? _self.spaceId : spaceId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedBy: null == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String,spaceUser: null == spaceUser ? _self.spaceUser : spaceUser // ignore: cast_nullable_to_non_nullable
as SpaceUser,
  ));
}
/// Create a copy of Space
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpaceUserCopyWith<$Res> get spaceUser {
  
  return $SpaceUserCopyWith<$Res>(_self.spaceUser, (value) {
    return _then(_self.copyWith(spaceUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [Space].
extension SpacePatterns on Space {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Space value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Space() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Space value)  $default,){
final _that = this;
switch (_that) {
case _Space():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Space value)?  $default,){
final _that = this;
switch (_that) {
case _Space() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? spaceId,  String title,  DateTime createdAt,  String createdBy,  DateTime updatedAt,  String updatedBy,  SpaceUser spaceUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Space() when $default != null:
return $default(_that.spaceId,_that.title,_that.createdAt,_that.createdBy,_that.updatedAt,_that.updatedBy,_that.spaceUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? spaceId,  String title,  DateTime createdAt,  String createdBy,  DateTime updatedAt,  String updatedBy,  SpaceUser spaceUser)  $default,) {final _that = this;
switch (_that) {
case _Space():
return $default(_that.spaceId,_that.title,_that.createdAt,_that.createdBy,_that.updatedAt,_that.updatedBy,_that.spaceUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? spaceId,  String title,  DateTime createdAt,  String createdBy,  DateTime updatedAt,  String updatedBy,  SpaceUser spaceUser)?  $default,) {final _that = this;
switch (_that) {
case _Space() when $default != null:
return $default(_that.spaceId,_that.title,_that.createdAt,_that.createdBy,_that.updatedAt,_that.updatedBy,_that.spaceUser);case _:
  return null;

}
}

}

/// @nodoc


class _Space implements Space {
  const _Space({this.spaceId, required this.title, required this.createdAt, required this.createdBy, required this.updatedAt, required this.updatedBy, required this.spaceUser});
  

@override final  int? spaceId;
@override final  String title;
@override final  DateTime createdAt;
@override final  String createdBy;
@override final  DateTime updatedAt;
@override final  String updatedBy;
@override final  SpaceUser spaceUser;

/// Create a copy of Space
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpaceCopyWith<_Space> get copyWith => __$SpaceCopyWithImpl<_Space>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Space&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.spaceUser, spaceUser) || other.spaceUser == spaceUser));
}


@override
int get hashCode => Object.hash(runtimeType,spaceId,title,createdAt,createdBy,updatedAt,updatedBy,spaceUser);

@override
String toString() {
  return 'Space(spaceId: $spaceId, title: $title, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy, spaceUser: $spaceUser)';
}


}

/// @nodoc
abstract mixin class _$SpaceCopyWith<$Res> implements $SpaceCopyWith<$Res> {
  factory _$SpaceCopyWith(_Space value, $Res Function(_Space) _then) = __$SpaceCopyWithImpl;
@override @useResult
$Res call({
 int? spaceId, String title, DateTime createdAt, String createdBy, DateTime updatedAt, String updatedBy, SpaceUser spaceUser
});


@override $SpaceUserCopyWith<$Res> get spaceUser;

}
/// @nodoc
class __$SpaceCopyWithImpl<$Res>
    implements _$SpaceCopyWith<$Res> {
  __$SpaceCopyWithImpl(this._self, this._then);

  final _Space _self;
  final $Res Function(_Space) _then;

/// Create a copy of Space
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? spaceId = freezed,Object? title = null,Object? createdAt = null,Object? createdBy = null,Object? updatedAt = null,Object? updatedBy = null,Object? spaceUser = null,}) {
  return _then(_Space(
spaceId: freezed == spaceId ? _self.spaceId : spaceId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedBy: null == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String,spaceUser: null == spaceUser ? _self.spaceUser : spaceUser // ignore: cast_nullable_to_non_nullable
as SpaceUser,
  ));
}

/// Create a copy of Space
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpaceUserCopyWith<$Res> get spaceUser {
  
  return $SpaceUserCopyWith<$Res>(_self.spaceUser, (value) {
    return _then(_self.copyWith(spaceUser: value));
  });
}
}

// dart format on
