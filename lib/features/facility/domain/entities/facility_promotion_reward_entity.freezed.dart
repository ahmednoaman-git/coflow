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
mixin _$FacilityPromotionGiftRewardEntity {

 String get giftName;
/// Create a copy of FacilityPromotionGiftRewardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionGiftRewardEntityCopyWith<FacilityPromotionGiftRewardEntity> get copyWith => _$FacilityPromotionGiftRewardEntityCopyWithImpl<FacilityPromotionGiftRewardEntity>(this as FacilityPromotionGiftRewardEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionGiftRewardEntity&&(identical(other.giftName, giftName) || other.giftName == giftName));
}


@override
int get hashCode => Object.hash(runtimeType,giftName);

@override
String toString() {
  return 'FacilityPromotionGiftRewardEntity(giftName: $giftName)';
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

/// Create a copy of FacilityPromotionGiftRewardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? giftName = null,}) {
  return _then(FacilityPromotionGiftRewardEntity(
giftName: null == giftName ? _self.giftName : giftName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityPromotionGiftRewardEntity].
extension FacilityPromotionGiftRewardEntityPatterns on FacilityPromotionGiftRewardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$FacilityPromotionTicketRewardEntity {

 List<FacilityPromotionTicketLineEntity> get tickets;
/// Create a copy of FacilityPromotionTicketRewardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionTicketRewardEntityCopyWith<FacilityPromotionTicketRewardEntity> get copyWith => _$FacilityPromotionTicketRewardEntityCopyWithImpl<FacilityPromotionTicketRewardEntity>(this as FacilityPromotionTicketRewardEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionTicketRewardEntity&&const DeepCollectionEquality().equals(other.tickets, tickets));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tickets));

@override
String toString() {
  return 'FacilityPromotionTicketRewardEntity(tickets: $tickets)';
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

/// Create a copy of FacilityPromotionTicketRewardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tickets = null,}) {
  return _then(FacilityPromotionTicketRewardEntity(
tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<FacilityPromotionTicketLineEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityPromotionTicketRewardEntity].
extension FacilityPromotionTicketRewardEntityPatterns on FacilityPromotionTicketRewardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$FacilityPromotionCouponRewardEntity {

 List<FacilityPromotionCouponEntity> get coupons;
/// Create a copy of FacilityPromotionCouponRewardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionCouponRewardEntityCopyWith<FacilityPromotionCouponRewardEntity> get copyWith => _$FacilityPromotionCouponRewardEntityCopyWithImpl<FacilityPromotionCouponRewardEntity>(this as FacilityPromotionCouponRewardEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionCouponRewardEntity&&const DeepCollectionEquality().equals(other.coupons, coupons));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(coupons));

@override
String toString() {
  return 'FacilityPromotionCouponRewardEntity(coupons: $coupons)';
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

/// Create a copy of FacilityPromotionCouponRewardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coupons = null,}) {
  return _then(FacilityPromotionCouponRewardEntity(
coupons: null == coupons ? _self.coupons : coupons // ignore: cast_nullable_to_non_nullable
as List<FacilityPromotionCouponEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityPromotionCouponRewardEntity].
extension FacilityPromotionCouponRewardEntityPatterns on FacilityPromotionCouponRewardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
