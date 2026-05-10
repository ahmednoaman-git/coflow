// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_promotion_reward_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityPromotionRewardEntity {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionRewardEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FacilityPromotionRewardEntity()';
}


}

/// @nodoc
class $FacilityPromotionRewardEntityCopyWith<$Res>  {
$FacilityPromotionRewardEntityCopyWith(FacilityPromotionRewardEntity _, $Res Function(FacilityPromotionRewardEntity) __);
}


/// Adds pattern-matching-related methods to [FacilityPromotionRewardEntity].
extension FacilityPromotionRewardEntityPatterns on FacilityPromotionRewardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FacilityPromotionGiftRewardEntity value)?  gift,TResult Function( FacilityPromotionTicketRewardEntity value)?  tickets,TResult Function( FacilityPromotionCouponRewardEntity value)?  coupons,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FacilityPromotionGiftRewardEntity() when gift != null:
return gift(_that);case FacilityPromotionTicketRewardEntity() when tickets != null:
return tickets(_that);case FacilityPromotionCouponRewardEntity() when coupons != null:
return coupons(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FacilityPromotionGiftRewardEntity value)  gift,required TResult Function( FacilityPromotionTicketRewardEntity value)  tickets,required TResult Function( FacilityPromotionCouponRewardEntity value)  coupons,}){
final _that = this;
switch (_that) {
case FacilityPromotionGiftRewardEntity():
return gift(_that);case FacilityPromotionTicketRewardEntity():
return tickets(_that);case FacilityPromotionCouponRewardEntity():
return coupons(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FacilityPromotionGiftRewardEntity value)?  gift,TResult? Function( FacilityPromotionTicketRewardEntity value)?  tickets,TResult? Function( FacilityPromotionCouponRewardEntity value)?  coupons,}){
final _that = this;
switch (_that) {
case FacilityPromotionGiftRewardEntity() when gift != null:
return gift(_that);case FacilityPromotionTicketRewardEntity() when tickets != null:
return tickets(_that);case FacilityPromotionCouponRewardEntity() when coupons != null:
return coupons(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String giftName)?  gift,TResult Function( List<FacilityPromotionTicketLineEntity> tickets)?  tickets,TResult Function( List<FacilityPromotionCouponEntity> coupons)?  coupons,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FacilityPromotionGiftRewardEntity() when gift != null:
return gift(_that.giftName);case FacilityPromotionTicketRewardEntity() when tickets != null:
return tickets(_that.tickets);case FacilityPromotionCouponRewardEntity() when coupons != null:
return coupons(_that.coupons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String giftName)  gift,required TResult Function( List<FacilityPromotionTicketLineEntity> tickets)  tickets,required TResult Function( List<FacilityPromotionCouponEntity> coupons)  coupons,}) {final _that = this;
switch (_that) {
case FacilityPromotionGiftRewardEntity():
return gift(_that.giftName);case FacilityPromotionTicketRewardEntity():
return tickets(_that.tickets);case FacilityPromotionCouponRewardEntity():
return coupons(_that.coupons);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String giftName)?  gift,TResult? Function( List<FacilityPromotionTicketLineEntity> tickets)?  tickets,TResult? Function( List<FacilityPromotionCouponEntity> coupons)?  coupons,}) {final _that = this;
switch (_that) {
case FacilityPromotionGiftRewardEntity() when gift != null:
return gift(_that.giftName);case FacilityPromotionTicketRewardEntity() when tickets != null:
return tickets(_that.tickets);case FacilityPromotionCouponRewardEntity() when coupons != null:
return coupons(_that.coupons);case _:
  return null;

}
}

}

/// @nodoc


class FacilityPromotionGiftRewardEntity extends FacilityPromotionRewardEntity {
  const FacilityPromotionGiftRewardEntity({required this.giftName}): super._();
  

 final  String giftName;

/// Create a copy of FacilityPromotionRewardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionGiftRewardEntityCopyWith<FacilityPromotionGiftRewardEntity> get copyWith => _$FacilityPromotionGiftRewardEntityCopyWithImpl<FacilityPromotionGiftRewardEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionGiftRewardEntity&&(identical(other.giftName, giftName) || other.giftName == giftName));
}


@override
int get hashCode => Object.hash(runtimeType,giftName);

@override
String toString() {
  return 'FacilityPromotionRewardEntity.gift(giftName: $giftName)';
}


}

/// @nodoc
abstract mixin class $FacilityPromotionGiftRewardEntityCopyWith<$Res> implements $FacilityPromotionRewardEntityCopyWith<$Res> {
  factory $FacilityPromotionGiftRewardEntityCopyWith(FacilityPromotionGiftRewardEntity value, $Res Function(FacilityPromotionGiftRewardEntity) _then) = _$FacilityPromotionGiftRewardEntityCopyWithImpl;
@useResult
$Res call({
 String giftName
});




}
/// @nodoc
class _$FacilityPromotionGiftRewardEntityCopyWithImpl<$Res>
    implements $FacilityPromotionGiftRewardEntityCopyWith<$Res> {
  _$FacilityPromotionGiftRewardEntityCopyWithImpl(this._self, this._then);

  final FacilityPromotionGiftRewardEntity _self;
  final $Res Function(FacilityPromotionGiftRewardEntity) _then;

/// Create a copy of FacilityPromotionRewardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? giftName = null,}) {
  return _then(FacilityPromotionGiftRewardEntity(
giftName: null == giftName ? _self.giftName : giftName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FacilityPromotionTicketRewardEntity extends FacilityPromotionRewardEntity {
  const FacilityPromotionTicketRewardEntity({final  List<FacilityPromotionTicketLineEntity> tickets = const <FacilityPromotionTicketLineEntity>[]}): _tickets = tickets,super._();
  

 final  List<FacilityPromotionTicketLineEntity> _tickets;
@JsonKey() List<FacilityPromotionTicketLineEntity> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}


/// Create a copy of FacilityPromotionRewardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionTicketRewardEntityCopyWith<FacilityPromotionTicketRewardEntity> get copyWith => _$FacilityPromotionTicketRewardEntityCopyWithImpl<FacilityPromotionTicketRewardEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionTicketRewardEntity&&const DeepCollectionEquality().equals(other._tickets, _tickets));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tickets));

@override
String toString() {
  return 'FacilityPromotionRewardEntity.tickets(tickets: $tickets)';
}


}

/// @nodoc
abstract mixin class $FacilityPromotionTicketRewardEntityCopyWith<$Res> implements $FacilityPromotionRewardEntityCopyWith<$Res> {
  factory $FacilityPromotionTicketRewardEntityCopyWith(FacilityPromotionTicketRewardEntity value, $Res Function(FacilityPromotionTicketRewardEntity) _then) = _$FacilityPromotionTicketRewardEntityCopyWithImpl;
@useResult
$Res call({
 List<FacilityPromotionTicketLineEntity> tickets
});




}
/// @nodoc
class _$FacilityPromotionTicketRewardEntityCopyWithImpl<$Res>
    implements $FacilityPromotionTicketRewardEntityCopyWith<$Res> {
  _$FacilityPromotionTicketRewardEntityCopyWithImpl(this._self, this._then);

  final FacilityPromotionTicketRewardEntity _self;
  final $Res Function(FacilityPromotionTicketRewardEntity) _then;

/// Create a copy of FacilityPromotionRewardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tickets = null,}) {
  return _then(FacilityPromotionTicketRewardEntity(
tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<FacilityPromotionTicketLineEntity>,
  ));
}


}

/// @nodoc


class FacilityPromotionCouponRewardEntity extends FacilityPromotionRewardEntity {
  const FacilityPromotionCouponRewardEntity({final  List<FacilityPromotionCouponEntity> coupons = const <FacilityPromotionCouponEntity>[]}): _coupons = coupons,super._();
  

 final  List<FacilityPromotionCouponEntity> _coupons;
@JsonKey() List<FacilityPromotionCouponEntity> get coupons {
  if (_coupons is EqualUnmodifiableListView) return _coupons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coupons);
}


/// Create a copy of FacilityPromotionRewardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionCouponRewardEntityCopyWith<FacilityPromotionCouponRewardEntity> get copyWith => _$FacilityPromotionCouponRewardEntityCopyWithImpl<FacilityPromotionCouponRewardEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionCouponRewardEntity&&const DeepCollectionEquality().equals(other._coupons, _coupons));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_coupons));

@override
String toString() {
  return 'FacilityPromotionRewardEntity.coupons(coupons: $coupons)';
}


}

/// @nodoc
abstract mixin class $FacilityPromotionCouponRewardEntityCopyWith<$Res> implements $FacilityPromotionRewardEntityCopyWith<$Res> {
  factory $FacilityPromotionCouponRewardEntityCopyWith(FacilityPromotionCouponRewardEntity value, $Res Function(FacilityPromotionCouponRewardEntity) _then) = _$FacilityPromotionCouponRewardEntityCopyWithImpl;
@useResult
$Res call({
 List<FacilityPromotionCouponEntity> coupons
});




}
/// @nodoc
class _$FacilityPromotionCouponRewardEntityCopyWithImpl<$Res>
    implements $FacilityPromotionCouponRewardEntityCopyWith<$Res> {
  _$FacilityPromotionCouponRewardEntityCopyWithImpl(this._self, this._then);

  final FacilityPromotionCouponRewardEntity _self;
  final $Res Function(FacilityPromotionCouponRewardEntity) _then;

/// Create a copy of FacilityPromotionRewardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? coupons = null,}) {
  return _then(FacilityPromotionCouponRewardEntity(
coupons: null == coupons ? _self._coupons : coupons // ignore: cast_nullable_to_non_nullable
as List<FacilityPromotionCouponEntity>,
  ));
}


}

// dart format on
