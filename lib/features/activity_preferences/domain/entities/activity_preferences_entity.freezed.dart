// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_preferences_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityPreferencesEntity {

 List<PreferenceActivityLineEntity> get lines; Set<int> get selectedTagIds;
/// Create a copy of ActivityPreferencesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityPreferencesEntityCopyWith<ActivityPreferencesEntity> get copyWith => _$ActivityPreferencesEntityCopyWithImpl<ActivityPreferencesEntity>(this as ActivityPreferencesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityPreferencesEntity&&const DeepCollectionEquality().equals(other.lines, lines)&&const DeepCollectionEquality().equals(other.selectedTagIds, selectedTagIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(lines),const DeepCollectionEquality().hash(selectedTagIds));

@override
String toString() {
  return 'ActivityPreferencesEntity(lines: $lines, selectedTagIds: $selectedTagIds)';
}


}

/// @nodoc
abstract mixin class $ActivityPreferencesEntityCopyWith<$Res>  {
  factory $ActivityPreferencesEntityCopyWith(ActivityPreferencesEntity value, $Res Function(ActivityPreferencesEntity) _then) = _$ActivityPreferencesEntityCopyWithImpl;
@useResult
$Res call({
 List<PreferenceActivityLineEntity> lines, Set<int> selectedTagIds
});




}
/// @nodoc
class _$ActivityPreferencesEntityCopyWithImpl<$Res>
    implements $ActivityPreferencesEntityCopyWith<$Res> {
  _$ActivityPreferencesEntityCopyWithImpl(this._self, this._then);

  final ActivityPreferencesEntity _self;
  final $Res Function(ActivityPreferencesEntity) _then;

/// Create a copy of ActivityPreferencesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lines = null,Object? selectedTagIds = null,}) {
  return _then(_self.copyWith(
lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<PreferenceActivityLineEntity>,selectedTagIds: null == selectedTagIds ? _self.selectedTagIds : selectedTagIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityPreferencesEntity].
extension ActivityPreferencesEntityPatterns on ActivityPreferencesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityPreferencesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityPreferencesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityPreferencesEntity value)  $default,){
final _that = this;
switch (_that) {
case _ActivityPreferencesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityPreferencesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityPreferencesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PreferenceActivityLineEntity> lines,  Set<int> selectedTagIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityPreferencesEntity() when $default != null:
return $default(_that.lines,_that.selectedTagIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PreferenceActivityLineEntity> lines,  Set<int> selectedTagIds)  $default,) {final _that = this;
switch (_that) {
case _ActivityPreferencesEntity():
return $default(_that.lines,_that.selectedTagIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PreferenceActivityLineEntity> lines,  Set<int> selectedTagIds)?  $default,) {final _that = this;
switch (_that) {
case _ActivityPreferencesEntity() when $default != null:
return $default(_that.lines,_that.selectedTagIds);case _:
  return null;

}
}

}

/// @nodoc


class _ActivityPreferencesEntity implements ActivityPreferencesEntity {
  const _ActivityPreferencesEntity({required final  List<PreferenceActivityLineEntity> lines, required final  Set<int> selectedTagIds}): _lines = lines,_selectedTagIds = selectedTagIds;
  

 final  List<PreferenceActivityLineEntity> _lines;
@override List<PreferenceActivityLineEntity> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

 final  Set<int> _selectedTagIds;
@override Set<int> get selectedTagIds {
  if (_selectedTagIds is EqualUnmodifiableSetView) return _selectedTagIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedTagIds);
}


/// Create a copy of ActivityPreferencesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityPreferencesEntityCopyWith<_ActivityPreferencesEntity> get copyWith => __$ActivityPreferencesEntityCopyWithImpl<_ActivityPreferencesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityPreferencesEntity&&const DeepCollectionEquality().equals(other._lines, _lines)&&const DeepCollectionEquality().equals(other._selectedTagIds, _selectedTagIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lines),const DeepCollectionEquality().hash(_selectedTagIds));

@override
String toString() {
  return 'ActivityPreferencesEntity(lines: $lines, selectedTagIds: $selectedTagIds)';
}


}

/// @nodoc
abstract mixin class _$ActivityPreferencesEntityCopyWith<$Res> implements $ActivityPreferencesEntityCopyWith<$Res> {
  factory _$ActivityPreferencesEntityCopyWith(_ActivityPreferencesEntity value, $Res Function(_ActivityPreferencesEntity) _then) = __$ActivityPreferencesEntityCopyWithImpl;
@override @useResult
$Res call({
 List<PreferenceActivityLineEntity> lines, Set<int> selectedTagIds
});




}
/// @nodoc
class __$ActivityPreferencesEntityCopyWithImpl<$Res>
    implements _$ActivityPreferencesEntityCopyWith<$Res> {
  __$ActivityPreferencesEntityCopyWithImpl(this._self, this._then);

  final _ActivityPreferencesEntity _self;
  final $Res Function(_ActivityPreferencesEntity) _then;

/// Create a copy of ActivityPreferencesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lines = null,Object? selectedTagIds = null,}) {
  return _then(_ActivityPreferencesEntity(
lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<PreferenceActivityLineEntity>,selectedTagIds: null == selectedTagIds ? _self._selectedTagIds : selectedTagIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

// dart format on
