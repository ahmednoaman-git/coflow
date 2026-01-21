// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_line_facilities_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityLineFacilitiesEntity {

 List<CollapsedFacilityEntity> get facilities; List<TagWithCountEntity> get tags;
/// Create a copy of ActivityLineFacilitiesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityLineFacilitiesEntityCopyWith<ActivityLineFacilitiesEntity> get copyWith => _$ActivityLineFacilitiesEntityCopyWithImpl<ActivityLineFacilitiesEntity>(this as ActivityLineFacilitiesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityLineFacilitiesEntity&&const DeepCollectionEquality().equals(other.facilities, facilities)&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(facilities),const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'ActivityLineFacilitiesEntity(facilities: $facilities, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ActivityLineFacilitiesEntityCopyWith<$Res>  {
  factory $ActivityLineFacilitiesEntityCopyWith(ActivityLineFacilitiesEntity value, $Res Function(ActivityLineFacilitiesEntity) _then) = _$ActivityLineFacilitiesEntityCopyWithImpl;
@useResult
$Res call({
 List<CollapsedFacilityEntity> facilities, List<TagWithCountEntity> tags
});




}
/// @nodoc
class _$ActivityLineFacilitiesEntityCopyWithImpl<$Res>
    implements $ActivityLineFacilitiesEntityCopyWith<$Res> {
  _$ActivityLineFacilitiesEntityCopyWithImpl(this._self, this._then);

  final ActivityLineFacilitiesEntity _self;
  final $Res Function(ActivityLineFacilitiesEntity) _then;

/// Create a copy of ActivityLineFacilitiesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? facilities = null,Object? tags = null,}) {
  return _then(_self.copyWith(
facilities: null == facilities ? _self.facilities : facilities // ignore: cast_nullable_to_non_nullable
as List<CollapsedFacilityEntity>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagWithCountEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityLineFacilitiesEntity].
extension ActivityLineFacilitiesEntityPatterns on ActivityLineFacilitiesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityLineFacilitiesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityLineFacilitiesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityLineFacilitiesEntity value)  $default,){
final _that = this;
switch (_that) {
case _ActivityLineFacilitiesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityLineFacilitiesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityLineFacilitiesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CollapsedFacilityEntity> facilities,  List<TagWithCountEntity> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityLineFacilitiesEntity() when $default != null:
return $default(_that.facilities,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CollapsedFacilityEntity> facilities,  List<TagWithCountEntity> tags)  $default,) {final _that = this;
switch (_that) {
case _ActivityLineFacilitiesEntity():
return $default(_that.facilities,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CollapsedFacilityEntity> facilities,  List<TagWithCountEntity> tags)?  $default,) {final _that = this;
switch (_that) {
case _ActivityLineFacilitiesEntity() when $default != null:
return $default(_that.facilities,_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class _ActivityLineFacilitiesEntity implements ActivityLineFacilitiesEntity {
  const _ActivityLineFacilitiesEntity({required final  List<CollapsedFacilityEntity> facilities, required final  List<TagWithCountEntity> tags}): _facilities = facilities,_tags = tags;
  

 final  List<CollapsedFacilityEntity> _facilities;
@override List<CollapsedFacilityEntity> get facilities {
  if (_facilities is EqualUnmodifiableListView) return _facilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_facilities);
}

 final  List<TagWithCountEntity> _tags;
@override List<TagWithCountEntity> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of ActivityLineFacilitiesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityLineFacilitiesEntityCopyWith<_ActivityLineFacilitiesEntity> get copyWith => __$ActivityLineFacilitiesEntityCopyWithImpl<_ActivityLineFacilitiesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityLineFacilitiesEntity&&const DeepCollectionEquality().equals(other._facilities, _facilities)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_facilities),const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'ActivityLineFacilitiesEntity(facilities: $facilities, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$ActivityLineFacilitiesEntityCopyWith<$Res> implements $ActivityLineFacilitiesEntityCopyWith<$Res> {
  factory _$ActivityLineFacilitiesEntityCopyWith(_ActivityLineFacilitiesEntity value, $Res Function(_ActivityLineFacilitiesEntity) _then) = __$ActivityLineFacilitiesEntityCopyWithImpl;
@override @useResult
$Res call({
 List<CollapsedFacilityEntity> facilities, List<TagWithCountEntity> tags
});




}
/// @nodoc
class __$ActivityLineFacilitiesEntityCopyWithImpl<$Res>
    implements _$ActivityLineFacilitiesEntityCopyWith<$Res> {
  __$ActivityLineFacilitiesEntityCopyWithImpl(this._self, this._then);

  final _ActivityLineFacilitiesEntity _self;
  final $Res Function(_ActivityLineFacilitiesEntity) _then;

/// Create a copy of ActivityLineFacilitiesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? facilities = null,Object? tags = null,}) {
  return _then(_ActivityLineFacilitiesEntity(
facilities: null == facilities ? _self._facilities : facilities // ignore: cast_nullable_to_non_nullable
as List<CollapsedFacilityEntity>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagWithCountEntity>,
  ));
}


}

// dart format on
