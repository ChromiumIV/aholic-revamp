// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Checklist {

 String get title; List<ChecklistItem> get items; Color get color;
/// Create a copy of Checklist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistCopyWith<Checklist> get copyWith => _$ChecklistCopyWithImpl<Checklist>(this as Checklist, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Checklist&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(items),color);

@override
String toString() {
  return 'Checklist(title: $title, items: $items, color: $color)';
}


}

/// @nodoc
abstract mixin class $ChecklistCopyWith<$Res>  {
  factory $ChecklistCopyWith(Checklist value, $Res Function(Checklist) _then) = _$ChecklistCopyWithImpl;
@useResult
$Res call({
 String title, List<ChecklistItem> items, Color color
});




}
/// @nodoc
class _$ChecklistCopyWithImpl<$Res>
    implements $ChecklistCopyWith<$Res> {
  _$ChecklistCopyWithImpl(this._self, this._then);

  final Checklist _self;
  final $Res Function(Checklist) _then;

/// Create a copy of Checklist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? items = null,Object? color = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChecklistItem>,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [Checklist].
extension ChecklistPatterns on Checklist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Checklist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Checklist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Checklist value)  $default,){
final _that = this;
switch (_that) {
case _Checklist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Checklist value)?  $default,){
final _that = this;
switch (_that) {
case _Checklist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<ChecklistItem> items,  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Checklist() when $default != null:
return $default(_that.title,_that.items,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<ChecklistItem> items,  Color color)  $default,) {final _that = this;
switch (_that) {
case _Checklist():
return $default(_that.title,_that.items,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<ChecklistItem> items,  Color color)?  $default,) {final _that = this;
switch (_that) {
case _Checklist() when $default != null:
return $default(_that.title,_that.items,_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _Checklist implements Checklist {
  const _Checklist({required this.title, required final  List<ChecklistItem> items, required this.color}): _items = items;
  

@override final  String title;
 final  List<ChecklistItem> _items;
@override List<ChecklistItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Color color;

/// Create a copy of Checklist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistCopyWith<_Checklist> get copyWith => __$ChecklistCopyWithImpl<_Checklist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Checklist&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_items),color);

@override
String toString() {
  return 'Checklist(title: $title, items: $items, color: $color)';
}


}

/// @nodoc
abstract mixin class _$ChecklistCopyWith<$Res> implements $ChecklistCopyWith<$Res> {
  factory _$ChecklistCopyWith(_Checklist value, $Res Function(_Checklist) _then) = __$ChecklistCopyWithImpl;
@override @useResult
$Res call({
 String title, List<ChecklistItem> items, Color color
});




}
/// @nodoc
class __$ChecklistCopyWithImpl<$Res>
    implements _$ChecklistCopyWith<$Res> {
  __$ChecklistCopyWithImpl(this._self, this._then);

  final _Checklist _self;
  final $Res Function(_Checklist) _then;

/// Create a copy of Checklist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? items = null,Object? color = null,}) {
  return _then(_Checklist(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChecklistItem>,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
