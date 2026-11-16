// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_activity_preferences_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaveActivityPreferencesDto {

 List<int> get tagIds;
/// Create a copy of SaveActivityPreferencesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveActivityPreferencesDtoCopyWith<SaveActivityPreferencesDto> get copyWith => _$SaveActivityPreferencesDtoCopyWithImpl<SaveActivityPreferencesDto>(this as SaveActivityPreferencesDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveActivityPreferencesDto&&const DeepCollectionEquality().equals(other.tagIds, tagIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tagIds));

@override
String toString() {
  return 'SaveActivityPreferencesDto(tagIds: $tagIds)';
}


}

/// @nodoc
abstract mixin class $SaveActivityPreferencesDtoCopyWith<$Res>  {
  factory $SaveActivityPreferencesDtoCopyWith(SaveActivityPreferencesDto value, $Res Function(SaveActivityPreferencesDto) _then) = _$SaveActivityPreferencesDtoCopyWithImpl;
@useResult
$Res call({
 List<int> tagIds
});




}
/// @nodoc
class _$SaveActivityPreferencesDtoCopyWithImpl<$Res>
    implements $SaveActivityPreferencesDtoCopyWith<$Res> {
  _$SaveActivityPreferencesDtoCopyWithImpl(this._self, this._then);

  final SaveActivityPreferencesDto _self;
  final $Res Function(SaveActivityPreferencesDto) _then;

/// Create a copy of SaveActivityPreferencesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagIds = null,}) {
  return _then(_self.copyWith(
tagIds: null == tagIds ? _self.tagIds : tagIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [SaveActivityPreferencesDto].
extension SaveActivityPreferencesDtoPatterns on SaveActivityPreferencesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaveActivityPreferencesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaveActivityPreferencesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaveActivityPreferencesDto value)  $default,){
final _that = this;
switch (_that) {
case _SaveActivityPreferencesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaveActivityPreferencesDto value)?  $default,){
final _that = this;
switch (_that) {
case _SaveActivityPreferencesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> tagIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaveActivityPreferencesDto() when $default != null:
return $default(_that.tagIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> tagIds)  $default,) {final _that = this;
switch (_that) {
case _SaveActivityPreferencesDto():
return $default(_that.tagIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> tagIds)?  $default,) {final _that = this;
switch (_that) {
case _SaveActivityPreferencesDto() when $default != null:
return $default(_that.tagIds);case _:
  return null;

}
}

}

/// @nodoc


class _SaveActivityPreferencesDto extends SaveActivityPreferencesDto {
  const _SaveActivityPreferencesDto({required final  List<int> tagIds}): _tagIds = tagIds,super._();
  

 final  List<int> _tagIds;
@override List<int> get tagIds {
  if (_tagIds is EqualUnmodifiableListView) return _tagIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tagIds);
}


/// Create a copy of SaveActivityPreferencesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveActivityPreferencesDtoCopyWith<_SaveActivityPreferencesDto> get copyWith => __$SaveActivityPreferencesDtoCopyWithImpl<_SaveActivityPreferencesDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveActivityPreferencesDto&&const DeepCollectionEquality().equals(other._tagIds, _tagIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tagIds));

@override
String toString() {
  return 'SaveActivityPreferencesDto(tagIds: $tagIds)';
}


}

/// @nodoc
abstract mixin class _$SaveActivityPreferencesDtoCopyWith<$Res> implements $SaveActivityPreferencesDtoCopyWith<$Res> {
  factory _$SaveActivityPreferencesDtoCopyWith(_SaveActivityPreferencesDto value, $Res Function(_SaveActivityPreferencesDto) _then) = __$SaveActivityPreferencesDtoCopyWithImpl;
@override @useResult
$Res call({
 List<int> tagIds
});




}
/// @nodoc
class __$SaveActivityPreferencesDtoCopyWithImpl<$Res>
    implements _$SaveActivityPreferencesDtoCopyWith<$Res> {
  __$SaveActivityPreferencesDtoCopyWithImpl(this._self, this._then);

  final _SaveActivityPreferencesDto _self;
  final $Res Function(_SaveActivityPreferencesDto) _then;

/// Create a copy of SaveActivityPreferencesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagIds = null,}) {
  return _then(_SaveActivityPreferencesDto(
tagIds: null == tagIds ? _self._tagIds : tagIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
