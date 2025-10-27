// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_checklist_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditChecklistState {

 Checklist get checklist; bool get isLoading; bool get isSaving; bool get hasUnsavedChanges; String? get errorMessage;
/// Create a copy of EditChecklistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditChecklistStateCopyWith<EditChecklistState> get copyWith => _$EditChecklistStateCopyWithImpl<EditChecklistState>(this as EditChecklistState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditChecklistState&&(identical(other.checklist, checklist) || other.checklist == checklist)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.hasUnsavedChanges, hasUnsavedChanges) || other.hasUnsavedChanges == hasUnsavedChanges)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,checklist,isLoading,isSaving,hasUnsavedChanges,errorMessage);

@override
String toString() {
  return 'EditChecklistState(checklist: $checklist, isLoading: $isLoading, isSaving: $isSaving, hasUnsavedChanges: $hasUnsavedChanges, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EditChecklistStateCopyWith<$Res>  {
  factory $EditChecklistStateCopyWith(EditChecklistState value, $Res Function(EditChecklistState) _then) = _$EditChecklistStateCopyWithImpl;
@useResult
$Res call({
 Checklist checklist, bool isLoading, bool isSaving, bool hasUnsavedChanges, String? errorMessage
});


$ChecklistCopyWith<$Res> get checklist;

}
/// @nodoc
class _$EditChecklistStateCopyWithImpl<$Res>
    implements $EditChecklistStateCopyWith<$Res> {
  _$EditChecklistStateCopyWithImpl(this._self, this._then);

  final EditChecklistState _self;
  final $Res Function(EditChecklistState) _then;

/// Create a copy of EditChecklistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checklist = null,Object? isLoading = null,Object? isSaving = null,Object? hasUnsavedChanges = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
checklist: null == checklist ? _self.checklist : checklist // ignore: cast_nullable_to_non_nullable
as Checklist,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,hasUnsavedChanges: null == hasUnsavedChanges ? _self.hasUnsavedChanges : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EditChecklistState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChecklistCopyWith<$Res> get checklist {
  
  return $ChecklistCopyWith<$Res>(_self.checklist, (value) {
    return _then(_self.copyWith(checklist: value));
  });
}
}


/// Adds pattern-matching-related methods to [EditChecklistState].
extension EditChecklistStatePatterns on EditChecklistState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditChecklistState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditChecklistState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditChecklistState value)  $default,){
final _that = this;
switch (_that) {
case _EditChecklistState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditChecklistState value)?  $default,){
final _that = this;
switch (_that) {
case _EditChecklistState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Checklist checklist,  bool isLoading,  bool isSaving,  bool hasUnsavedChanges,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditChecklistState() when $default != null:
return $default(_that.checklist,_that.isLoading,_that.isSaving,_that.hasUnsavedChanges,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Checklist checklist,  bool isLoading,  bool isSaving,  bool hasUnsavedChanges,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EditChecklistState():
return $default(_that.checklist,_that.isLoading,_that.isSaving,_that.hasUnsavedChanges,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Checklist checklist,  bool isLoading,  bool isSaving,  bool hasUnsavedChanges,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EditChecklistState() when $default != null:
return $default(_that.checklist,_that.isLoading,_that.isSaving,_that.hasUnsavedChanges,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EditChecklistState implements EditChecklistState {
  const _EditChecklistState({required this.checklist, this.isLoading = false, this.isSaving = false, this.hasUnsavedChanges = false, this.errorMessage});
  

@override final  Checklist checklist;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool hasUnsavedChanges;
@override final  String? errorMessage;

/// Create a copy of EditChecklistState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditChecklistStateCopyWith<_EditChecklistState> get copyWith => __$EditChecklistStateCopyWithImpl<_EditChecklistState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditChecklistState&&(identical(other.checklist, checklist) || other.checklist == checklist)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.hasUnsavedChanges, hasUnsavedChanges) || other.hasUnsavedChanges == hasUnsavedChanges)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,checklist,isLoading,isSaving,hasUnsavedChanges,errorMessage);

@override
String toString() {
  return 'EditChecklistState(checklist: $checklist, isLoading: $isLoading, isSaving: $isSaving, hasUnsavedChanges: $hasUnsavedChanges, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EditChecklistStateCopyWith<$Res> implements $EditChecklistStateCopyWith<$Res> {
  factory _$EditChecklistStateCopyWith(_EditChecklistState value, $Res Function(_EditChecklistState) _then) = __$EditChecklistStateCopyWithImpl;
@override @useResult
$Res call({
 Checklist checklist, bool isLoading, bool isSaving, bool hasUnsavedChanges, String? errorMessage
});


@override $ChecklistCopyWith<$Res> get checklist;

}
/// @nodoc
class __$EditChecklistStateCopyWithImpl<$Res>
    implements _$EditChecklistStateCopyWith<$Res> {
  __$EditChecklistStateCopyWithImpl(this._self, this._then);

  final _EditChecklistState _self;
  final $Res Function(_EditChecklistState) _then;

/// Create a copy of EditChecklistState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checklist = null,Object? isLoading = null,Object? isSaving = null,Object? hasUnsavedChanges = null,Object? errorMessage = freezed,}) {
  return _then(_EditChecklistState(
checklist: null == checklist ? _self.checklist : checklist // ignore: cast_nullable_to_non_nullable
as Checklist,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,hasUnsavedChanges: null == hasUnsavedChanges ? _self.hasUnsavedChanges : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EditChecklistState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChecklistCopyWith<$Res> get checklist {
  
  return $ChecklistCopyWith<$Res>(_self.checklist, (value) {
    return _then(_self.copyWith(checklist: value));
  });
}
}

// dart format on
