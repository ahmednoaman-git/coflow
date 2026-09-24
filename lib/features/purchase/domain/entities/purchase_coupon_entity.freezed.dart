// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_coupon_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseCouponEntity {

/// The coupon's own id — what quotes and purchases take as `coupon_id`.
/// The customer can hold the same coupon more than once; the copies share
/// this id.
 int get id; int get facilityId; double get discountRatio;/// Whether it discounts every ticket of the facility.
 bool get coversAllTickets;/// Whether it discounts every promotion of the facility.
 bool get coversAllPromotions;/// The tickets it is limited to, when it does not cover them all.
 List<PurchaseCouponTarget> get tickets;/// The promotions it is limited to, when it does not cover them all.
 List<PurchaseCouponTarget> get promotions;
/// Create a copy of PurchaseCouponEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseCouponEntityCopyWith<PurchaseCouponEntity> get copyWith => _$PurchaseCouponEntityCopyWithImpl<PurchaseCouponEntity>(this as PurchaseCouponEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseCouponEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.discountRatio, discountRatio) || other.discountRatio == discountRatio)&&(identical(other.coversAllTickets, coversAllTickets) || other.coversAllTickets == coversAllTickets)&&(identical(other.coversAllPromotions, coversAllPromotions) || other.coversAllPromotions == coversAllPromotions)&&const DeepCollectionEquality().equals(other.tickets, tickets)&&const DeepCollectionEquality().equals(other.promotions, promotions));
}


@override
int get hashCode => Object.hash(runtimeType,id,facilityId,discountRatio,coversAllTickets,coversAllPromotions,const DeepCollectionEquality().hash(tickets),const DeepCollectionEquality().hash(promotions));

@override
String toString() {
  return 'PurchaseCouponEntity(id: $id, facilityId: $facilityId, discountRatio: $discountRatio, coversAllTickets: $coversAllTickets, coversAllPromotions: $coversAllPromotions, tickets: $tickets, promotions: $promotions)';
}


}

/// @nodoc
abstract mixin class $PurchaseCouponEntityCopyWith<$Res>  {
  factory $PurchaseCouponEntityCopyWith(PurchaseCouponEntity value, $Res Function(PurchaseCouponEntity) _then) = _$PurchaseCouponEntityCopyWithImpl;
@useResult
$Res call({
 int id, int facilityId, double discountRatio, bool coversAllTickets, bool coversAllPromotions, List<PurchaseCouponTarget> tickets, List<PurchaseCouponTarget> promotions
});




}
/// @nodoc
class _$PurchaseCouponEntityCopyWithImpl<$Res>
    implements $PurchaseCouponEntityCopyWith<$Res> {
  _$PurchaseCouponEntityCopyWithImpl(this._self, this._then);

  final PurchaseCouponEntity _self;
  final $Res Function(PurchaseCouponEntity) _then;

/// Create a copy of PurchaseCouponEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? facilityId = null,Object? discountRatio = null,Object? coversAllTickets = null,Object? coversAllPromotions = null,Object? tickets = null,Object? promotions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,discountRatio: null == discountRatio ? _self.discountRatio : discountRatio // ignore: cast_nullable_to_non_nullable
as double,coversAllTickets: null == coversAllTickets ? _self.coversAllTickets : coversAllTickets // ignore: cast_nullable_to_non_nullable
as bool,coversAllPromotions: null == coversAllPromotions ? _self.coversAllPromotions : coversAllPromotions // ignore: cast_nullable_to_non_nullable
as bool,tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<PurchaseCouponTarget>,promotions: null == promotions ? _self.promotions : promotions // ignore: cast_nullable_to_non_nullable
as List<PurchaseCouponTarget>,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseCouponEntity].
extension PurchaseCouponEntityPatterns on PurchaseCouponEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseCouponEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseCouponEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseCouponEntity value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseCouponEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseCouponEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseCouponEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int facilityId,  double discountRatio,  bool coversAllTickets,  bool coversAllPromotions,  List<PurchaseCouponTarget> tickets,  List<PurchaseCouponTarget> promotions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseCouponEntity() when $default != null:
return $default(_that.id,_that.facilityId,_that.discountRatio,_that.coversAllTickets,_that.coversAllPromotions,_that.tickets,_that.promotions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int facilityId,  double discountRatio,  bool coversAllTickets,  bool coversAllPromotions,  List<PurchaseCouponTarget> tickets,  List<PurchaseCouponTarget> promotions)  $default,) {final _that = this;
switch (_that) {
case _PurchaseCouponEntity():
return $default(_that.id,_that.facilityId,_that.discountRatio,_that.coversAllTickets,_that.coversAllPromotions,_that.tickets,_that.promotions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int facilityId,  double discountRatio,  bool coversAllTickets,  bool coversAllPromotions,  List<PurchaseCouponTarget> tickets,  List<PurchaseCouponTarget> promotions)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseCouponEntity() when $default != null:
return $default(_that.id,_that.facilityId,_that.discountRatio,_that.coversAllTickets,_that.coversAllPromotions,_that.tickets,_that.promotions);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseCouponEntity extends PurchaseCouponEntity {
  const _PurchaseCouponEntity({required this.id, required this.facilityId, required this.discountRatio, this.coversAllTickets = false, this.coversAllPromotions = false, final  List<PurchaseCouponTarget> tickets = const <PurchaseCouponTarget>[], final  List<PurchaseCouponTarget> promotions = const <PurchaseCouponTarget>[]}): _tickets = tickets,_promotions = promotions,super._();
  

/// The coupon's own id — what quotes and purchases take as `coupon_id`.
/// The customer can hold the same coupon more than once; the copies share
/// this id.
@override final  int id;
@override final  int facilityId;
@override final  double discountRatio;
/// Whether it discounts every ticket of the facility.
@override@JsonKey() final  bool coversAllTickets;
/// Whether it discounts every promotion of the facility.
@override@JsonKey() final  bool coversAllPromotions;
/// The tickets it is limited to, when it does not cover them all.
 final  List<PurchaseCouponTarget> _tickets;
/// The tickets it is limited to, when it does not cover them all.
@override@JsonKey() List<PurchaseCouponTarget> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}

/// The promotions it is limited to, when it does not cover them all.
 final  List<PurchaseCouponTarget> _promotions;
/// The promotions it is limited to, when it does not cover them all.
@override@JsonKey() List<PurchaseCouponTarget> get promotions {
  if (_promotions is EqualUnmodifiableListView) return _promotions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_promotions);
}


/// Create a copy of PurchaseCouponEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseCouponEntityCopyWith<_PurchaseCouponEntity> get copyWith => __$PurchaseCouponEntityCopyWithImpl<_PurchaseCouponEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseCouponEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.discountRatio, discountRatio) || other.discountRatio == discountRatio)&&(identical(other.coversAllTickets, coversAllTickets) || other.coversAllTickets == coversAllTickets)&&(identical(other.coversAllPromotions, coversAllPromotions) || other.coversAllPromotions == coversAllPromotions)&&const DeepCollectionEquality().equals(other._tickets, _tickets)&&const DeepCollectionEquality().equals(other._promotions, _promotions));
}


@override
int get hashCode => Object.hash(runtimeType,id,facilityId,discountRatio,coversAllTickets,coversAllPromotions,const DeepCollectionEquality().hash(_tickets),const DeepCollectionEquality().hash(_promotions));

@override
String toString() {
  return 'PurchaseCouponEntity(id: $id, facilityId: $facilityId, discountRatio: $discountRatio, coversAllTickets: $coversAllTickets, coversAllPromotions: $coversAllPromotions, tickets: $tickets, promotions: $promotions)';
}


}

/// @nodoc
abstract mixin class _$PurchaseCouponEntityCopyWith<$Res> implements $PurchaseCouponEntityCopyWith<$Res> {
  factory _$PurchaseCouponEntityCopyWith(_PurchaseCouponEntity value, $Res Function(_PurchaseCouponEntity) _then) = __$PurchaseCouponEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int facilityId, double discountRatio, bool coversAllTickets, bool coversAllPromotions, List<PurchaseCouponTarget> tickets, List<PurchaseCouponTarget> promotions
});




}
/// @nodoc
class __$PurchaseCouponEntityCopyWithImpl<$Res>
    implements _$PurchaseCouponEntityCopyWith<$Res> {
  __$PurchaseCouponEntityCopyWithImpl(this._self, this._then);

  final _PurchaseCouponEntity _self;
  final $Res Function(_PurchaseCouponEntity) _then;

/// Create a copy of PurchaseCouponEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? facilityId = null,Object? discountRatio = null,Object? coversAllTickets = null,Object? coversAllPromotions = null,Object? tickets = null,Object? promotions = null,}) {
  return _then(_PurchaseCouponEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,discountRatio: null == discountRatio ? _self.discountRatio : discountRatio // ignore: cast_nullable_to_non_nullable
as double,coversAllTickets: null == coversAllTickets ? _self.coversAllTickets : coversAllTickets // ignore: cast_nullable_to_non_nullable
as bool,coversAllPromotions: null == coversAllPromotions ? _self.coversAllPromotions : coversAllPromotions // ignore: cast_nullable_to_non_nullable
as bool,tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<PurchaseCouponTarget>,promotions: null == promotions ? _self._promotions : promotions // ignore: cast_nullable_to_non_nullable
as List<PurchaseCouponTarget>,
  ));
}


}

// dart format on
