// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ahl_bottom_navigation_bar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BottomNavigationItem {

 IconData? get icon; BottomNavigationItemBuilder? get builder; Color get iconColor; Color get inactiveIconColor;
/// Create a copy of BottomNavigationItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BottomNavigationItemCopyWith<BottomNavigationItem> get copyWith => _$BottomNavigationItemCopyWithImpl<BottomNavigationItem>(this as BottomNavigationItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BottomNavigationItem&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.builder, builder) || other.builder == builder)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.inactiveIconColor, inactiveIconColor) || other.inactiveIconColor == inactiveIconColor));
}


@override
int get hashCode => Object.hash(runtimeType,icon,builder,iconColor,inactiveIconColor);

@override
String toString() {
  return 'BottomNavigationItem(icon: $icon, builder: $builder, iconColor: $iconColor, inactiveIconColor: $inactiveIconColor)';
}


}

/// @nodoc
abstract mixin class $BottomNavigationItemCopyWith<$Res>  {
  factory $BottomNavigationItemCopyWith(BottomNavigationItem value, $Res Function(BottomNavigationItem) _then) = _$BottomNavigationItemCopyWithImpl;
@useResult
$Res call({
 IconData? icon, BottomNavigationItemBuilder? builder, Color iconColor, Color inactiveIconColor
});




}
/// @nodoc
class _$BottomNavigationItemCopyWithImpl<$Res>
    implements $BottomNavigationItemCopyWith<$Res> {
  _$BottomNavigationItemCopyWithImpl(this._self, this._then);

  final BottomNavigationItem _self;
  final $Res Function(BottomNavigationItem) _then;

/// Create a copy of BottomNavigationItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = freezed,Object? builder = freezed,Object? iconColor = null,Object? inactiveIconColor = null,}) {
  return _then(_self.copyWith(
icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData?,builder: freezed == builder ? _self.builder : builder // ignore: cast_nullable_to_non_nullable
as BottomNavigationItemBuilder?,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as Color,inactiveIconColor: null == inactiveIconColor ? _self.inactiveIconColor : inactiveIconColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [BottomNavigationItem].
extension BottomNavigationItemPatterns on BottomNavigationItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BottomNavigationItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BottomNavigationItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BottomNavigationItem value)  $default,){
final _that = this;
switch (_that) {
case _BottomNavigationItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BottomNavigationItem value)?  $default,){
final _that = this;
switch (_that) {
case _BottomNavigationItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IconData? icon,  BottomNavigationItemBuilder? builder,  Color iconColor,  Color inactiveIconColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BottomNavigationItem() when $default != null:
return $default(_that.icon,_that.builder,_that.iconColor,_that.inactiveIconColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IconData? icon,  BottomNavigationItemBuilder? builder,  Color iconColor,  Color inactiveIconColor)  $default,) {final _that = this;
switch (_that) {
case _BottomNavigationItem():
return $default(_that.icon,_that.builder,_that.iconColor,_that.inactiveIconColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IconData? icon,  BottomNavigationItemBuilder? builder,  Color iconColor,  Color inactiveIconColor)?  $default,) {final _that = this;
switch (_that) {
case _BottomNavigationItem() when $default != null:
return $default(_that.icon,_that.builder,_that.iconColor,_that.inactiveIconColor);case _:
  return null;

}
}

}

/// @nodoc


class _BottomNavigationItem implements BottomNavigationItem {
  const _BottomNavigationItem({this.icon, this.builder, this.iconColor = Colors.black, this.inactiveIconColor = AhlColors.transBlack20}): assert(icon != null || builder != null, 'icon or builder must either be non-null');
  

@override final  IconData? icon;
@override final  BottomNavigationItemBuilder? builder;
@override@JsonKey() final  Color iconColor;
@override@JsonKey() final  Color inactiveIconColor;

/// Create a copy of BottomNavigationItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BottomNavigationItemCopyWith<_BottomNavigationItem> get copyWith => __$BottomNavigationItemCopyWithImpl<_BottomNavigationItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BottomNavigationItem&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.builder, builder) || other.builder == builder)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.inactiveIconColor, inactiveIconColor) || other.inactiveIconColor == inactiveIconColor));
}


@override
int get hashCode => Object.hash(runtimeType,icon,builder,iconColor,inactiveIconColor);

@override
String toString() {
  return 'BottomNavigationItem(icon: $icon, builder: $builder, iconColor: $iconColor, inactiveIconColor: $inactiveIconColor)';
}


}

/// @nodoc
abstract mixin class _$BottomNavigationItemCopyWith<$Res> implements $BottomNavigationItemCopyWith<$Res> {
  factory _$BottomNavigationItemCopyWith(_BottomNavigationItem value, $Res Function(_BottomNavigationItem) _then) = __$BottomNavigationItemCopyWithImpl;
@override @useResult
$Res call({
 IconData? icon, BottomNavigationItemBuilder? builder, Color iconColor, Color inactiveIconColor
});




}
/// @nodoc
class __$BottomNavigationItemCopyWithImpl<$Res>
    implements _$BottomNavigationItemCopyWith<$Res> {
  __$BottomNavigationItemCopyWithImpl(this._self, this._then);

  final _BottomNavigationItem _self;
  final $Res Function(_BottomNavigationItem) _then;

/// Create a copy of BottomNavigationItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = freezed,Object? builder = freezed,Object? iconColor = null,Object? inactiveIconColor = null,}) {
  return _then(_BottomNavigationItem(
icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData?,builder: freezed == builder ? _self.builder : builder // ignore: cast_nullable_to_non_nullable
as BottomNavigationItemBuilder?,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as Color,inactiveIconColor: null == inactiveIconColor ? _self.inactiveIconColor : inactiveIconColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
