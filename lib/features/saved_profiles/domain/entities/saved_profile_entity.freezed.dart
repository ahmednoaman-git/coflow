// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedProfileEntity {

/// The saved facility — also everything its profile screen needs to open.
 CollapsedFacilityEntity get facility;/// Where the facility is, e.g. `New Cairo, Cairo`. Null when the payload
/// names neither the area nor the city.
 String? get branchLabel;/// Whether the user is tracking this facility's updates.
 bool get isTracked;
/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedProfileEntityCopyWith<SavedProfileEntity> get copyWith => _$SavedProfileEntityCopyWithImpl<SavedProfileEntity>(this as SavedProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedProfileEntity&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.branchLabel, branchLabel) || other.branchLabel == branchLabel)&&(identical(other.isTracked, isTracked) || other.isTracked == isTracked));
}


@override
int get hashCode => Object.hash(runtimeType,facility,branchLabel,isTracked);

@override
String toString() {
  return 'SavedProfileEntity(facility: $facility, branchLabel: $branchLabel, isTracked: $isTracked)';
}


}

/// @nodoc
abstract mixin class $SavedProfileEntityCopyWith<$Res>  {
  factory $SavedProfileEntityCopyWith(SavedProfileEntity value, $Res Function(SavedProfileEntity) _then) = _$SavedProfileEntityCopyWithImpl;
@useResult
$Res call({
 CollapsedFacilityEntity facility, String? branchLabel, bool isTracked
});


$CollapsedFacilityEntityCopyWith<$Res> get facility;

}
/// @nodoc
class _$SavedProfileEntityCopyWithImpl<$Res>
    implements $SavedProfileEntityCopyWith<$Res> {
  _$SavedProfileEntityCopyWithImpl(this._self, this._then);

  final SavedProfileEntity _self;
  final $Res Function(SavedProfileEntity) _then;

/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? facility = null,Object? branchLabel = freezed,Object? isTracked = null,}) {
  return _then(_self.copyWith(
facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity,branchLabel: freezed == branchLabel ? _self.branchLabel : branchLabel // ignore: cast_nullable_to_non_nullable
as String?,isTracked: null == isTracked ? _self.isTracked : isTracked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res> get facility {
  
  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedProfileEntity].
extension SavedProfileEntityPatterns on SavedProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavedProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavedProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CollapsedFacilityEntity facility,  String? branchLabel,  bool isTracked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedProfileEntity() when $default != null:
return $default(_that.facility,_that.branchLabel,_that.isTracked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CollapsedFacilityEntity facility,  String? branchLabel,  bool isTracked)  $default,) {final _that = this;
switch (_that) {
case _SavedProfileEntity():
return $default(_that.facility,_that.branchLabel,_that.isTracked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CollapsedFacilityEntity facility,  String? branchLabel,  bool isTracked)?  $default,) {final _that = this;
switch (_that) {
case _SavedProfileEntity() when $default != null:
return $default(_that.facility,_that.branchLabel,_that.isTracked);case _:
  return null;

}
}

}

/// @nodoc


class _SavedProfileEntity extends SavedProfileEntity {
  const _SavedProfileEntity({required this.facility, this.branchLabel, this.isTracked = false}): super._();
  

/// The saved facility — also everything its profile screen needs to open.
@override final  CollapsedFacilityEntity facility;
/// Where the facility is, e.g. `New Cairo, Cairo`. Null when the payload
/// names neither the area nor the city.
@override final  String? branchLabel;
/// Whether the user is tracking this facility's updates.
@override@JsonKey() final  bool isTracked;

/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedProfileEntityCopyWith<_SavedProfileEntity> get copyWith => __$SavedProfileEntityCopyWithImpl<_SavedProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedProfileEntity&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.branchLabel, branchLabel) || other.branchLabel == branchLabel)&&(identical(other.isTracked, isTracked) || other.isTracked == isTracked));
}


@override
int get hashCode => Object.hash(runtimeType,facility,branchLabel,isTracked);

@override
String toString() {
  return 'SavedProfileEntity(facility: $facility, branchLabel: $branchLabel, isTracked: $isTracked)';
}


}

/// @nodoc
abstract mixin class _$SavedProfileEntityCopyWith<$Res> implements $SavedProfileEntityCopyWith<$Res> {
  factory _$SavedProfileEntityCopyWith(_SavedProfileEntity value, $Res Function(_SavedProfileEntity) _then) = __$SavedProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 CollapsedFacilityEntity facility, String? branchLabel, bool isTracked
});


@override $CollapsedFacilityEntityCopyWith<$Res> get facility;

}
/// @nodoc
class __$SavedProfileEntityCopyWithImpl<$Res>
    implements _$SavedProfileEntityCopyWith<$Res> {
  __$SavedProfileEntityCopyWithImpl(this._self, this._then);

  final _SavedProfileEntity _self;
  final $Res Function(_SavedProfileEntity) _then;

/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? facility = null,Object? branchLabel = freezed,Object? isTracked = null,}) {
  return _then(_SavedProfileEntity(
facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity,branchLabel: freezed == branchLabel ? _self.branchLabel : branchLabel // ignore: cast_nullable_to_non_nullable
as String?,isTracked: null == isTracked ? _self.isTracked : isTracked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res> get facility {
  
  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}
}

// dart format on
