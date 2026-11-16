// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_facility_group_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseFacilityGroupEntity {

 int get facilityId; String get facilityName;/// The facility's profile, from the first row that carried one.
 CollapsedFacilityEntity? get facility; List<UserPurchaseEntity> get purchases;
/// Create a copy of PurchaseFacilityGroupEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseFacilityGroupEntityCopyWith<PurchaseFacilityGroupEntity> get copyWith => _$PurchaseFacilityGroupEntityCopyWithImpl<PurchaseFacilityGroupEntity>(this as PurchaseFacilityGroupEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseFacilityGroupEntity&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.facilityName, facilityName) || other.facilityName == facilityName)&&(identical(other.facility, facility) || other.facility == facility)&&const DeepCollectionEquality().equals(other.purchases, purchases));
}


@override
int get hashCode => Object.hash(runtimeType,facilityId,facilityName,facility,const DeepCollectionEquality().hash(purchases));

@override
String toString() {
  return 'PurchaseFacilityGroupEntity(facilityId: $facilityId, facilityName: $facilityName, facility: $facility, purchases: $purchases)';
}


}

/// @nodoc
abstract mixin class $PurchaseFacilityGroupEntityCopyWith<$Res>  {
  factory $PurchaseFacilityGroupEntityCopyWith(PurchaseFacilityGroupEntity value, $Res Function(PurchaseFacilityGroupEntity) _then) = _$PurchaseFacilityGroupEntityCopyWithImpl;
@useResult
$Res call({
 int facilityId, String facilityName, CollapsedFacilityEntity? facility, List<UserPurchaseEntity> purchases
});


$CollapsedFacilityEntityCopyWith<$Res>? get facility;

}
/// @nodoc
class _$PurchaseFacilityGroupEntityCopyWithImpl<$Res>
    implements $PurchaseFacilityGroupEntityCopyWith<$Res> {
  _$PurchaseFacilityGroupEntityCopyWithImpl(this._self, this._then);

  final PurchaseFacilityGroupEntity _self;
  final $Res Function(PurchaseFacilityGroupEntity) _then;

/// Create a copy of PurchaseFacilityGroupEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? facilityId = null,Object? facilityName = null,Object? facility = freezed,Object? purchases = null,}) {
  return _then(_self.copyWith(
facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,facilityName: null == facilityName ? _self.facilityName : facilityName // ignore: cast_nullable_to_non_nullable
as String,facility: freezed == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity?,purchases: null == purchases ? _self.purchases : purchases // ignore: cast_nullable_to_non_nullable
as List<UserPurchaseEntity>,
  ));
}
/// Create a copy of PurchaseFacilityGroupEntity
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


/// Adds pattern-matching-related methods to [PurchaseFacilityGroupEntity].
extension PurchaseFacilityGroupEntityPatterns on PurchaseFacilityGroupEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseFacilityGroupEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseFacilityGroupEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseFacilityGroupEntity value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseFacilityGroupEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseFacilityGroupEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseFacilityGroupEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int facilityId,  String facilityName,  CollapsedFacilityEntity? facility,  List<UserPurchaseEntity> purchases)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseFacilityGroupEntity() when $default != null:
return $default(_that.facilityId,_that.facilityName,_that.facility,_that.purchases);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int facilityId,  String facilityName,  CollapsedFacilityEntity? facility,  List<UserPurchaseEntity> purchases)  $default,) {final _that = this;
switch (_that) {
case _PurchaseFacilityGroupEntity():
return $default(_that.facilityId,_that.facilityName,_that.facility,_that.purchases);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int facilityId,  String facilityName,  CollapsedFacilityEntity? facility,  List<UserPurchaseEntity> purchases)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseFacilityGroupEntity() when $default != null:
return $default(_that.facilityId,_that.facilityName,_that.facility,_that.purchases);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseFacilityGroupEntity implements PurchaseFacilityGroupEntity {
  const _PurchaseFacilityGroupEntity({required this.facilityId, required this.facilityName, this.facility, required final  List<UserPurchaseEntity> purchases}): _purchases = purchases;
  

@override final  int facilityId;
@override final  String facilityName;
/// The facility's profile, from the first row that carried one.
@override final  CollapsedFacilityEntity? facility;
 final  List<UserPurchaseEntity> _purchases;
@override List<UserPurchaseEntity> get purchases {
  if (_purchases is EqualUnmodifiableListView) return _purchases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_purchases);
}


/// Create a copy of PurchaseFacilityGroupEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseFacilityGroupEntityCopyWith<_PurchaseFacilityGroupEntity> get copyWith => __$PurchaseFacilityGroupEntityCopyWithImpl<_PurchaseFacilityGroupEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseFacilityGroupEntity&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.facilityName, facilityName) || other.facilityName == facilityName)&&(identical(other.facility, facility) || other.facility == facility)&&const DeepCollectionEquality().equals(other._purchases, _purchases));
}


@override
int get hashCode => Object.hash(runtimeType,facilityId,facilityName,facility,const DeepCollectionEquality().hash(_purchases));

@override
String toString() {
  return 'PurchaseFacilityGroupEntity(facilityId: $facilityId, facilityName: $facilityName, facility: $facility, purchases: $purchases)';
}


}

/// @nodoc
abstract mixin class _$PurchaseFacilityGroupEntityCopyWith<$Res> implements $PurchaseFacilityGroupEntityCopyWith<$Res> {
  factory _$PurchaseFacilityGroupEntityCopyWith(_PurchaseFacilityGroupEntity value, $Res Function(_PurchaseFacilityGroupEntity) _then) = __$PurchaseFacilityGroupEntityCopyWithImpl;
@override @useResult
$Res call({
 int facilityId, String facilityName, CollapsedFacilityEntity? facility, List<UserPurchaseEntity> purchases
});


@override $CollapsedFacilityEntityCopyWith<$Res>? get facility;

}
/// @nodoc
class __$PurchaseFacilityGroupEntityCopyWithImpl<$Res>
    implements _$PurchaseFacilityGroupEntityCopyWith<$Res> {
  __$PurchaseFacilityGroupEntityCopyWithImpl(this._self, this._then);

  final _PurchaseFacilityGroupEntity _self;
  final $Res Function(_PurchaseFacilityGroupEntity) _then;

/// Create a copy of PurchaseFacilityGroupEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? facilityId = null,Object? facilityName = null,Object? facility = freezed,Object? purchases = null,}) {
  return _then(_PurchaseFacilityGroupEntity(
facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,facilityName: null == facilityName ? _self.facilityName : facilityName // ignore: cast_nullable_to_non_nullable
as String,facility: freezed == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity?,purchases: null == purchases ? _self._purchases : purchases // ignore: cast_nullable_to_non_nullable
as List<UserPurchaseEntity>,
  ));
}

/// Create a copy of PurchaseFacilityGroupEntity
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
