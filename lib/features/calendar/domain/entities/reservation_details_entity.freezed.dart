// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReservationDetailsEntity {

 int get facilityId; String get facilityName; FacilitySessionDetailsEntity get slot; String? get facilityLogoUrl; CollapsedFacilityEntity? get facility;
/// Create a copy of ReservationDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationDetailsEntityCopyWith<ReservationDetailsEntity> get copyWith => _$ReservationDetailsEntityCopyWithImpl<ReservationDetailsEntity>(this as ReservationDetailsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationDetailsEntity&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.facilityName, facilityName) || other.facilityName == facilityName)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.facilityLogoUrl, facilityLogoUrl) || other.facilityLogoUrl == facilityLogoUrl)&&(identical(other.facility, facility) || other.facility == facility));
}


@override
int get hashCode => Object.hash(runtimeType,facilityId,facilityName,slot,facilityLogoUrl,facility);

@override
String toString() {
  return 'ReservationDetailsEntity(facilityId: $facilityId, facilityName: $facilityName, slot: $slot, facilityLogoUrl: $facilityLogoUrl, facility: $facility)';
}


}

/// @nodoc
abstract mixin class $ReservationDetailsEntityCopyWith<$Res>  {
  factory $ReservationDetailsEntityCopyWith(ReservationDetailsEntity value, $Res Function(ReservationDetailsEntity) _then) = _$ReservationDetailsEntityCopyWithImpl;
@useResult
$Res call({
 int facilityId, String facilityName, FacilitySessionDetailsEntity slot, String? facilityLogoUrl, CollapsedFacilityEntity? facility
});


$FacilitySessionDetailsEntityCopyWith<$Res> get slot;$CollapsedFacilityEntityCopyWith<$Res>? get facility;

}
/// @nodoc
class _$ReservationDetailsEntityCopyWithImpl<$Res>
    implements $ReservationDetailsEntityCopyWith<$Res> {
  _$ReservationDetailsEntityCopyWithImpl(this._self, this._then);

  final ReservationDetailsEntity _self;
  final $Res Function(ReservationDetailsEntity) _then;

/// Create a copy of ReservationDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? facilityId = null,Object? facilityName = null,Object? slot = null,Object? facilityLogoUrl = freezed,Object? facility = freezed,}) {
  return _then(_self.copyWith(
facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,facilityName: null == facilityName ? _self.facilityName : facilityName // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as FacilitySessionDetailsEntity,facilityLogoUrl: freezed == facilityLogoUrl ? _self.facilityLogoUrl : facilityLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,facility: freezed == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity?,
  ));
}
/// Create a copy of ReservationDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilitySessionDetailsEntityCopyWith<$Res> get slot {
  
  return $FacilitySessionDetailsEntityCopyWith<$Res>(_self.slot, (value) {
    return _then(_self.copyWith(slot: value));
  });
}/// Create a copy of ReservationDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res>? get facility {
    if (_self.facility == null) {
    return null;
  }

  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility!, (value) {
    return _then(_self.copyWith(facility: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReservationDetailsEntity].
extension ReservationDetailsEntityPatterns on ReservationDetailsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationDetailsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationDetailsEntity value)  $default,){
final _that = this;
switch (_that) {
case _ReservationDetailsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationDetailsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int facilityId,  String facilityName,  FacilitySessionDetailsEntity slot,  String? facilityLogoUrl,  CollapsedFacilityEntity? facility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationDetailsEntity() when $default != null:
return $default(_that.facilityId,_that.facilityName,_that.slot,_that.facilityLogoUrl,_that.facility);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int facilityId,  String facilityName,  FacilitySessionDetailsEntity slot,  String? facilityLogoUrl,  CollapsedFacilityEntity? facility)  $default,) {final _that = this;
switch (_that) {
case _ReservationDetailsEntity():
return $default(_that.facilityId,_that.facilityName,_that.slot,_that.facilityLogoUrl,_that.facility);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int facilityId,  String facilityName,  FacilitySessionDetailsEntity slot,  String? facilityLogoUrl,  CollapsedFacilityEntity? facility)?  $default,) {final _that = this;
switch (_that) {
case _ReservationDetailsEntity() when $default != null:
return $default(_that.facilityId,_that.facilityName,_that.slot,_that.facilityLogoUrl,_that.facility);case _:
  return null;

}
}

}

/// @nodoc


class _ReservationDetailsEntity extends ReservationDetailsEntity {
  const _ReservationDetailsEntity({required this.facilityId, required this.facilityName, required this.slot, this.facilityLogoUrl, this.facility}): super._();
  

@override final  int facilityId;
@override final  String facilityName;
@override final  FacilitySessionDetailsEntity slot;
@override final  String? facilityLogoUrl;
@override final  CollapsedFacilityEntity? facility;

/// Create a copy of ReservationDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationDetailsEntityCopyWith<_ReservationDetailsEntity> get copyWith => __$ReservationDetailsEntityCopyWithImpl<_ReservationDetailsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationDetailsEntity&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.facilityName, facilityName) || other.facilityName == facilityName)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.facilityLogoUrl, facilityLogoUrl) || other.facilityLogoUrl == facilityLogoUrl)&&(identical(other.facility, facility) || other.facility == facility));
}


@override
int get hashCode => Object.hash(runtimeType,facilityId,facilityName,slot,facilityLogoUrl,facility);

@override
String toString() {
  return 'ReservationDetailsEntity(facilityId: $facilityId, facilityName: $facilityName, slot: $slot, facilityLogoUrl: $facilityLogoUrl, facility: $facility)';
}


}

/// @nodoc
abstract mixin class _$ReservationDetailsEntityCopyWith<$Res> implements $ReservationDetailsEntityCopyWith<$Res> {
  factory _$ReservationDetailsEntityCopyWith(_ReservationDetailsEntity value, $Res Function(_ReservationDetailsEntity) _then) = __$ReservationDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 int facilityId, String facilityName, FacilitySessionDetailsEntity slot, String? facilityLogoUrl, CollapsedFacilityEntity? facility
});


@override $FacilitySessionDetailsEntityCopyWith<$Res> get slot;@override $CollapsedFacilityEntityCopyWith<$Res>? get facility;

}
/// @nodoc
class __$ReservationDetailsEntityCopyWithImpl<$Res>
    implements _$ReservationDetailsEntityCopyWith<$Res> {
  __$ReservationDetailsEntityCopyWithImpl(this._self, this._then);

  final _ReservationDetailsEntity _self;
  final $Res Function(_ReservationDetailsEntity) _then;

/// Create a copy of ReservationDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? facilityId = null,Object? facilityName = null,Object? slot = null,Object? facilityLogoUrl = freezed,Object? facility = freezed,}) {
  return _then(_ReservationDetailsEntity(
facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,facilityName: null == facilityName ? _self.facilityName : facilityName // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as FacilitySessionDetailsEntity,facilityLogoUrl: freezed == facilityLogoUrl ? _self.facilityLogoUrl : facilityLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,facility: freezed == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity?,
  ));
}

/// Create a copy of ReservationDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilitySessionDetailsEntityCopyWith<$Res> get slot {
  
  return $FacilitySessionDetailsEntityCopyWith<$Res>(_self.slot, (value) {
    return _then(_self.copyWith(slot: value));
  });
}/// Create a copy of ReservationDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res>? get facility {
    if (_self.facility == null) {
    return null;
  }

  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility!, (value) {
    return _then(_self.copyWith(facility: value));
  });
}
}

// dart format on
