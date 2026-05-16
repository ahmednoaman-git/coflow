// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_promotion_coupon_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityPromotionCouponEntity {

 double get discountRatio; FacilityPromotionAppliesOn get appliesOn;
/// Create a copy of FacilityPromotionCouponEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionCouponEntityCopyWith<FacilityPromotionCouponEntity> get copyWith => _$FacilityPromotionCouponEntityCopyWithImpl<FacilityPromotionCouponEntity>(this as FacilityPromotionCouponEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionCouponEntity&&(identical(other.discountRatio, discountRatio) || other.discountRatio == discountRatio)&&(identical(other.appliesOn, appliesOn) || other.appliesOn == appliesOn));
}


@override
int get hashCode => Object.hash(runtimeType,discountRatio,appliesOn);

@override
String toString() {
  return 'FacilityPromotionCouponEntity(discountRatio: $discountRatio, appliesOn: $appliesOn)';
}


}

/// @nodoc
abstract mixin class $FacilityPromotionCouponEntityCopyWith<$Res>  {
  factory $FacilityPromotionCouponEntityCopyWith(FacilityPromotionCouponEntity value, $Res Function(FacilityPromotionCouponEntity) _then) = _$FacilityPromotionCouponEntityCopyWithImpl;
@useResult
$Res call({
 double discountRatio, FacilityPromotionAppliesOn appliesOn
});




}
/// @nodoc
class _$FacilityPromotionCouponEntityCopyWithImpl<$Res>
    implements $FacilityPromotionCouponEntityCopyWith<$Res> {
  _$FacilityPromotionCouponEntityCopyWithImpl(this._self, this._then);

  final FacilityPromotionCouponEntity _self;
  final $Res Function(FacilityPromotionCouponEntity) _then;

/// Create a copy of FacilityPromotionCouponEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? discountRatio = null,Object? appliesOn = null,}) {
  return _then(_self.copyWith(
discountRatio: null == discountRatio ? _self.discountRatio : discountRatio // ignore: cast_nullable_to_non_nullable
as double,appliesOn: null == appliesOn ? _self.appliesOn : appliesOn // ignore: cast_nullable_to_non_nullable
as FacilityPromotionAppliesOn,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityPromotionCouponEntity].
extension FacilityPromotionCouponEntityPatterns on FacilityPromotionCouponEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityPromotionCouponEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityPromotionCouponEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityPromotionCouponEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityPromotionCouponEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityPromotionCouponEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityPromotionCouponEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double discountRatio,  FacilityPromotionAppliesOn appliesOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityPromotionCouponEntity() when $default != null:
return $default(_that.discountRatio,_that.appliesOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double discountRatio,  FacilityPromotionAppliesOn appliesOn)  $default,) {final _that = this;
switch (_that) {
case _FacilityPromotionCouponEntity():
return $default(_that.discountRatio,_that.appliesOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double discountRatio,  FacilityPromotionAppliesOn appliesOn)?  $default,) {final _that = this;
switch (_that) {
case _FacilityPromotionCouponEntity() when $default != null:
return $default(_that.discountRatio,_that.appliesOn);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityPromotionCouponEntity extends FacilityPromotionCouponEntity {
  const _FacilityPromotionCouponEntity({required this.discountRatio, required this.appliesOn}): super._();
  

@override final  double discountRatio;
@override final  FacilityPromotionAppliesOn appliesOn;

/// Create a copy of FacilityPromotionCouponEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityPromotionCouponEntityCopyWith<_FacilityPromotionCouponEntity> get copyWith => __$FacilityPromotionCouponEntityCopyWithImpl<_FacilityPromotionCouponEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityPromotionCouponEntity&&(identical(other.discountRatio, discountRatio) || other.discountRatio == discountRatio)&&(identical(other.appliesOn, appliesOn) || other.appliesOn == appliesOn));
}


@override
int get hashCode => Object.hash(runtimeType,discountRatio,appliesOn);

@override
String toString() {
  return 'FacilityPromotionCouponEntity(discountRatio: $discountRatio, appliesOn: $appliesOn)';
}


}

/// @nodoc
abstract mixin class _$FacilityPromotionCouponEntityCopyWith<$Res> implements $FacilityPromotionCouponEntityCopyWith<$Res> {
  factory _$FacilityPromotionCouponEntityCopyWith(_FacilityPromotionCouponEntity value, $Res Function(_FacilityPromotionCouponEntity) _then) = __$FacilityPromotionCouponEntityCopyWithImpl;
@override @useResult
$Res call({
 double discountRatio, FacilityPromotionAppliesOn appliesOn
});




}
/// @nodoc
class __$FacilityPromotionCouponEntityCopyWithImpl<$Res>
    implements _$FacilityPromotionCouponEntityCopyWith<$Res> {
  __$FacilityPromotionCouponEntityCopyWithImpl(this._self, this._then);

  final _FacilityPromotionCouponEntity _self;
  final $Res Function(_FacilityPromotionCouponEntity) _then;

/// Create a copy of FacilityPromotionCouponEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? discountRatio = null,Object? appliesOn = null,}) {
  return _then(_FacilityPromotionCouponEntity(
discountRatio: null == discountRatio ? _self.discountRatio : discountRatio // ignore: cast_nullable_to_non_nullable
as double,appliesOn: null == appliesOn ? _self.appliesOn : appliesOn // ignore: cast_nullable_to_non_nullable
as FacilityPromotionAppliesOn,
  ));
}


}

// dart format on
