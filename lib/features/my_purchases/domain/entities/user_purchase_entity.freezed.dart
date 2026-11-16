// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_purchase_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchasedAddOnEntity {

 String get name; int get quantity;/// What it came to across [quantity].
 double get price;
/// Create a copy of PurchasedAddOnEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchasedAddOnEntityCopyWith<PurchasedAddOnEntity> get copyWith => _$PurchasedAddOnEntityCopyWithImpl<PurchasedAddOnEntity>(this as PurchasedAddOnEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchasedAddOnEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,name,quantity,price);

@override
String toString() {
  return 'PurchasedAddOnEntity(name: $name, quantity: $quantity, price: $price)';
}


}

/// @nodoc
abstract mixin class $PurchasedAddOnEntityCopyWith<$Res>  {
  factory $PurchasedAddOnEntityCopyWith(PurchasedAddOnEntity value, $Res Function(PurchasedAddOnEntity) _then) = _$PurchasedAddOnEntityCopyWithImpl;
@useResult
$Res call({
 String name, int quantity, double price
});




}
/// @nodoc
class _$PurchasedAddOnEntityCopyWithImpl<$Res>
    implements $PurchasedAddOnEntityCopyWith<$Res> {
  _$PurchasedAddOnEntityCopyWithImpl(this._self, this._then);

  final PurchasedAddOnEntity _self;
  final $Res Function(PurchasedAddOnEntity) _then;

/// Create a copy of PurchasedAddOnEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? quantity = null,Object? price = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchasedAddOnEntity].
extension PurchasedAddOnEntityPatterns on PurchasedAddOnEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchasedAddOnEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchasedAddOnEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchasedAddOnEntity value)  $default,){
final _that = this;
switch (_that) {
case _PurchasedAddOnEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchasedAddOnEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PurchasedAddOnEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int quantity,  double price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchasedAddOnEntity() when $default != null:
return $default(_that.name,_that.quantity,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int quantity,  double price)  $default,) {final _that = this;
switch (_that) {
case _PurchasedAddOnEntity():
return $default(_that.name,_that.quantity,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int quantity,  double price)?  $default,) {final _that = this;
switch (_that) {
case _PurchasedAddOnEntity() when $default != null:
return $default(_that.name,_that.quantity,_that.price);case _:
  return null;

}
}

}

/// @nodoc


class _PurchasedAddOnEntity implements PurchasedAddOnEntity {
  const _PurchasedAddOnEntity({required this.name, this.quantity = 1, this.price = 0});
  

@override final  String name;
@override@JsonKey() final  int quantity;
/// What it came to across [quantity].
@override@JsonKey() final  double price;

/// Create a copy of PurchasedAddOnEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchasedAddOnEntityCopyWith<_PurchasedAddOnEntity> get copyWith => __$PurchasedAddOnEntityCopyWithImpl<_PurchasedAddOnEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchasedAddOnEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,name,quantity,price);

@override
String toString() {
  return 'PurchasedAddOnEntity(name: $name, quantity: $quantity, price: $price)';
}


}

/// @nodoc
abstract mixin class _$PurchasedAddOnEntityCopyWith<$Res> implements $PurchasedAddOnEntityCopyWith<$Res> {
  factory _$PurchasedAddOnEntityCopyWith(_PurchasedAddOnEntity value, $Res Function(_PurchasedAddOnEntity) _then) = __$PurchasedAddOnEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, int quantity, double price
});




}
/// @nodoc
class __$PurchasedAddOnEntityCopyWithImpl<$Res>
    implements _$PurchasedAddOnEntityCopyWith<$Res> {
  __$PurchasedAddOnEntityCopyWithImpl(this._self, this._then);

  final _PurchasedAddOnEntity _self;
  final $Res Function(_PurchasedAddOnEntity) _then;

/// Create a copy of PurchasedAddOnEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? quantity = null,Object? price = null,}) {
  return _then(_PurchasedAddOnEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$UserPurchaseEntity {

 int get id; String get name; PurchaseKind get kind; PurchaseStatus get status; bool get isGift; int get facilityId; String get facilityName;/// The facility's profile, for its logo and to open it; null when the row
/// didn't carry a usable record.
 CollapsedFacilityEntity? get facility;/// Whether [facility] is only a preview — id, name and activity line —
/// because the row carried no facility record (gift rows don't).
 bool get isFacilityPreview; String get currency; DateTime? get createdAt; DateTime? get expireDate; int get quantity;/// The items' price after any promotion offer, add-ons excluded.
 double get price; double get addOnsPrice; double get couponDiscount;/// [price] plus [addOnsPrice].
 double get totalPrice;/// What the user owes: [totalPrice] less [couponDiscount].
 double get finalPrice; double get refundAmount;/// The sum of the ledger's `paid` entries.
 double get paidAmount;/// When the latest refund was recorded.
 DateTime? get refundedAt; List<PurchasedTicketEntity> get tickets; List<PurchasedAddOnEntity> get addOns;/// The promotion it was bought as, for package and Buy & Get rows.
 FacilityPromotionEntity? get promotion;/// The promotion's own validity, when it has one.
 int? get promotionValidityDays;/// The coupon a gifted coupon grants.
 GiftCouponEntity? get coupon;/// The purchase a gift came from — "From Promotion".
 UserPurchaseEntity? get sourcePurchase;/// The purchase a used coupon was applied to — "Applied" and its invoice.
 UserPurchaseEntity? get appliedPurchase;
/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPurchaseEntityCopyWith<UserPurchaseEntity> get copyWith => _$UserPurchaseEntityCopyWithImpl<UserPurchaseEntity>(this as UserPurchaseEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPurchaseEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.status, status) || other.status == status)&&(identical(other.isGift, isGift) || other.isGift == isGift)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.facilityName, facilityName) || other.facilityName == facilityName)&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.isFacilityPreview, isFacilityPreview) || other.isFacilityPreview == isFacilityPreview)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expireDate, expireDate) || other.expireDate == expireDate)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.addOnsPrice, addOnsPrice) || other.addOnsPrice == addOnsPrice)&&(identical(other.couponDiscount, couponDiscount) || other.couponDiscount == couponDiscount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.refundedAt, refundedAt) || other.refundedAt == refundedAt)&&const DeepCollectionEquality().equals(other.tickets, tickets)&&const DeepCollectionEquality().equals(other.addOns, addOns)&&(identical(other.promotion, promotion) || other.promotion == promotion)&&(identical(other.promotionValidityDays, promotionValidityDays) || other.promotionValidityDays == promotionValidityDays)&&(identical(other.coupon, coupon) || other.coupon == coupon)&&(identical(other.sourcePurchase, sourcePurchase) || other.sourcePurchase == sourcePurchase)&&(identical(other.appliedPurchase, appliedPurchase) || other.appliedPurchase == appliedPurchase));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,kind,status,isGift,facilityId,facilityName,facility,isFacilityPreview,currency,createdAt,expireDate,quantity,price,addOnsPrice,couponDiscount,totalPrice,finalPrice,refundAmount,paidAmount,refundedAt,const DeepCollectionEquality().hash(tickets),const DeepCollectionEquality().hash(addOns),promotion,promotionValidityDays,coupon,sourcePurchase,appliedPurchase]);

@override
String toString() {
  return 'UserPurchaseEntity(id: $id, name: $name, kind: $kind, status: $status, isGift: $isGift, facilityId: $facilityId, facilityName: $facilityName, facility: $facility, isFacilityPreview: $isFacilityPreview, currency: $currency, createdAt: $createdAt, expireDate: $expireDate, quantity: $quantity, price: $price, addOnsPrice: $addOnsPrice, couponDiscount: $couponDiscount, totalPrice: $totalPrice, finalPrice: $finalPrice, refundAmount: $refundAmount, paidAmount: $paidAmount, refundedAt: $refundedAt, tickets: $tickets, addOns: $addOns, promotion: $promotion, promotionValidityDays: $promotionValidityDays, coupon: $coupon, sourcePurchase: $sourcePurchase, appliedPurchase: $appliedPurchase)';
}


}

/// @nodoc
abstract mixin class $UserPurchaseEntityCopyWith<$Res>  {
  factory $UserPurchaseEntityCopyWith(UserPurchaseEntity value, $Res Function(UserPurchaseEntity) _then) = _$UserPurchaseEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, PurchaseKind kind, PurchaseStatus status, bool isGift, int facilityId, String facilityName, CollapsedFacilityEntity? facility, bool isFacilityPreview, String currency, DateTime? createdAt, DateTime? expireDate, int quantity, double price, double addOnsPrice, double couponDiscount, double totalPrice, double finalPrice, double refundAmount, double paidAmount, DateTime? refundedAt, List<PurchasedTicketEntity> tickets, List<PurchasedAddOnEntity> addOns, FacilityPromotionEntity? promotion, int? promotionValidityDays, GiftCouponEntity? coupon, UserPurchaseEntity? sourcePurchase, UserPurchaseEntity? appliedPurchase
});


$CollapsedFacilityEntityCopyWith<$Res>? get facility;$FacilityPromotionEntityCopyWith<$Res>? get promotion;$GiftCouponEntityCopyWith<$Res>? get coupon;$UserPurchaseEntityCopyWith<$Res>? get sourcePurchase;$UserPurchaseEntityCopyWith<$Res>? get appliedPurchase;

}
/// @nodoc
class _$UserPurchaseEntityCopyWithImpl<$Res>
    implements $UserPurchaseEntityCopyWith<$Res> {
  _$UserPurchaseEntityCopyWithImpl(this._self, this._then);

  final UserPurchaseEntity _self;
  final $Res Function(UserPurchaseEntity) _then;

/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? status = null,Object? isGift = null,Object? facilityId = null,Object? facilityName = null,Object? facility = freezed,Object? isFacilityPreview = null,Object? currency = null,Object? createdAt = freezed,Object? expireDate = freezed,Object? quantity = null,Object? price = null,Object? addOnsPrice = null,Object? couponDiscount = null,Object? totalPrice = null,Object? finalPrice = null,Object? refundAmount = null,Object? paidAmount = null,Object? refundedAt = freezed,Object? tickets = null,Object? addOns = null,Object? promotion = freezed,Object? promotionValidityDays = freezed,Object? coupon = freezed,Object? sourcePurchase = freezed,Object? appliedPurchase = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PurchaseKind,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PurchaseStatus,isGift: null == isGift ? _self.isGift : isGift // ignore: cast_nullable_to_non_nullable
as bool,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,facilityName: null == facilityName ? _self.facilityName : facilityName // ignore: cast_nullable_to_non_nullable
as String,facility: freezed == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity?,isFacilityPreview: null == isFacilityPreview ? _self.isFacilityPreview : isFacilityPreview // ignore: cast_nullable_to_non_nullable
as bool,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expireDate: freezed == expireDate ? _self.expireDate : expireDate // ignore: cast_nullable_to_non_nullable
as DateTime?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,addOnsPrice: null == addOnsPrice ? _self.addOnsPrice : addOnsPrice // ignore: cast_nullable_to_non_nullable
as double,couponDiscount: null == couponDiscount ? _self.couponDiscount : couponDiscount // ignore: cast_nullable_to_non_nullable
as double,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double,refundAmount: null == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,refundedAt: freezed == refundedAt ? _self.refundedAt : refundedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<PurchasedTicketEntity>,addOns: null == addOns ? _self.addOns : addOns // ignore: cast_nullable_to_non_nullable
as List<PurchasedAddOnEntity>,promotion: freezed == promotion ? _self.promotion : promotion // ignore: cast_nullable_to_non_nullable
as FacilityPromotionEntity?,promotionValidityDays: freezed == promotionValidityDays ? _self.promotionValidityDays : promotionValidityDays // ignore: cast_nullable_to_non_nullable
as int?,coupon: freezed == coupon ? _self.coupon : coupon // ignore: cast_nullable_to_non_nullable
as GiftCouponEntity?,sourcePurchase: freezed == sourcePurchase ? _self.sourcePurchase : sourcePurchase // ignore: cast_nullable_to_non_nullable
as UserPurchaseEntity?,appliedPurchase: freezed == appliedPurchase ? _self.appliedPurchase : appliedPurchase // ignore: cast_nullable_to_non_nullable
as UserPurchaseEntity?,
  ));
}
/// Create a copy of UserPurchaseEntity
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
}/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilityPromotionEntityCopyWith<$Res>? get promotion {
    if (_self.promotion == null) {
    return null;
  }

  return $FacilityPromotionEntityCopyWith<$Res>(_self.promotion!, (value) {
    return _then(_self.copyWith(promotion: value));
  });
}/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftCouponEntityCopyWith<$Res>? get coupon {
    if (_self.coupon == null) {
    return null;
  }

  return $GiftCouponEntityCopyWith<$Res>(_self.coupon!, (value) {
    return _then(_self.copyWith(coupon: value));
  });
}/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPurchaseEntityCopyWith<$Res>? get sourcePurchase {
    if (_self.sourcePurchase == null) {
    return null;
  }

  return $UserPurchaseEntityCopyWith<$Res>(_self.sourcePurchase!, (value) {
    return _then(_self.copyWith(sourcePurchase: value));
  });
}/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPurchaseEntityCopyWith<$Res>? get appliedPurchase {
    if (_self.appliedPurchase == null) {
    return null;
  }

  return $UserPurchaseEntityCopyWith<$Res>(_self.appliedPurchase!, (value) {
    return _then(_self.copyWith(appliedPurchase: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserPurchaseEntity].
extension UserPurchaseEntityPatterns on UserPurchaseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPurchaseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPurchaseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPurchaseEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserPurchaseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPurchaseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserPurchaseEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  PurchaseKind kind,  PurchaseStatus status,  bool isGift,  int facilityId,  String facilityName,  CollapsedFacilityEntity? facility,  bool isFacilityPreview,  String currency,  DateTime? createdAt,  DateTime? expireDate,  int quantity,  double price,  double addOnsPrice,  double couponDiscount,  double totalPrice,  double finalPrice,  double refundAmount,  double paidAmount,  DateTime? refundedAt,  List<PurchasedTicketEntity> tickets,  List<PurchasedAddOnEntity> addOns,  FacilityPromotionEntity? promotion,  int? promotionValidityDays,  GiftCouponEntity? coupon,  UserPurchaseEntity? sourcePurchase,  UserPurchaseEntity? appliedPurchase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPurchaseEntity() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.status,_that.isGift,_that.facilityId,_that.facilityName,_that.facility,_that.isFacilityPreview,_that.currency,_that.createdAt,_that.expireDate,_that.quantity,_that.price,_that.addOnsPrice,_that.couponDiscount,_that.totalPrice,_that.finalPrice,_that.refundAmount,_that.paidAmount,_that.refundedAt,_that.tickets,_that.addOns,_that.promotion,_that.promotionValidityDays,_that.coupon,_that.sourcePurchase,_that.appliedPurchase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  PurchaseKind kind,  PurchaseStatus status,  bool isGift,  int facilityId,  String facilityName,  CollapsedFacilityEntity? facility,  bool isFacilityPreview,  String currency,  DateTime? createdAt,  DateTime? expireDate,  int quantity,  double price,  double addOnsPrice,  double couponDiscount,  double totalPrice,  double finalPrice,  double refundAmount,  double paidAmount,  DateTime? refundedAt,  List<PurchasedTicketEntity> tickets,  List<PurchasedAddOnEntity> addOns,  FacilityPromotionEntity? promotion,  int? promotionValidityDays,  GiftCouponEntity? coupon,  UserPurchaseEntity? sourcePurchase,  UserPurchaseEntity? appliedPurchase)  $default,) {final _that = this;
switch (_that) {
case _UserPurchaseEntity():
return $default(_that.id,_that.name,_that.kind,_that.status,_that.isGift,_that.facilityId,_that.facilityName,_that.facility,_that.isFacilityPreview,_that.currency,_that.createdAt,_that.expireDate,_that.quantity,_that.price,_that.addOnsPrice,_that.couponDiscount,_that.totalPrice,_that.finalPrice,_that.refundAmount,_that.paidAmount,_that.refundedAt,_that.tickets,_that.addOns,_that.promotion,_that.promotionValidityDays,_that.coupon,_that.sourcePurchase,_that.appliedPurchase);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  PurchaseKind kind,  PurchaseStatus status,  bool isGift,  int facilityId,  String facilityName,  CollapsedFacilityEntity? facility,  bool isFacilityPreview,  String currency,  DateTime? createdAt,  DateTime? expireDate,  int quantity,  double price,  double addOnsPrice,  double couponDiscount,  double totalPrice,  double finalPrice,  double refundAmount,  double paidAmount,  DateTime? refundedAt,  List<PurchasedTicketEntity> tickets,  List<PurchasedAddOnEntity> addOns,  FacilityPromotionEntity? promotion,  int? promotionValidityDays,  GiftCouponEntity? coupon,  UserPurchaseEntity? sourcePurchase,  UserPurchaseEntity? appliedPurchase)?  $default,) {final _that = this;
switch (_that) {
case _UserPurchaseEntity() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.status,_that.isGift,_that.facilityId,_that.facilityName,_that.facility,_that.isFacilityPreview,_that.currency,_that.createdAt,_that.expireDate,_that.quantity,_that.price,_that.addOnsPrice,_that.couponDiscount,_that.totalPrice,_that.finalPrice,_that.refundAmount,_that.paidAmount,_that.refundedAt,_that.tickets,_that.addOns,_that.promotion,_that.promotionValidityDays,_that.coupon,_that.sourcePurchase,_that.appliedPurchase);case _:
  return null;

}
}

}

/// @nodoc


class _UserPurchaseEntity extends UserPurchaseEntity {
  const _UserPurchaseEntity({required this.id, required this.name, required this.kind, required this.status, this.isGift = false, required this.facilityId, required this.facilityName, this.facility, this.isFacilityPreview = false, this.currency = '', this.createdAt, this.expireDate, this.quantity = 1, this.price = 0, this.addOnsPrice = 0, this.couponDiscount = 0, this.totalPrice = 0, this.finalPrice = 0, this.refundAmount = 0, this.paidAmount = 0, this.refundedAt, final  List<PurchasedTicketEntity> tickets = const <PurchasedTicketEntity>[], final  List<PurchasedAddOnEntity> addOns = const <PurchasedAddOnEntity>[], this.promotion, this.promotionValidityDays, this.coupon, this.sourcePurchase, this.appliedPurchase}): _tickets = tickets,_addOns = addOns,super._();
  

@override final  int id;
@override final  String name;
@override final  PurchaseKind kind;
@override final  PurchaseStatus status;
@override@JsonKey() final  bool isGift;
@override final  int facilityId;
@override final  String facilityName;
/// The facility's profile, for its logo and to open it; null when the row
/// didn't carry a usable record.
@override final  CollapsedFacilityEntity? facility;
/// Whether [facility] is only a preview — id, name and activity line —
/// because the row carried no facility record (gift rows don't).
@override@JsonKey() final  bool isFacilityPreview;
@override@JsonKey() final  String currency;
@override final  DateTime? createdAt;
@override final  DateTime? expireDate;
@override@JsonKey() final  int quantity;
/// The items' price after any promotion offer, add-ons excluded.
@override@JsonKey() final  double price;
@override@JsonKey() final  double addOnsPrice;
@override@JsonKey() final  double couponDiscount;
/// [price] plus [addOnsPrice].
@override@JsonKey() final  double totalPrice;
/// What the user owes: [totalPrice] less [couponDiscount].
@override@JsonKey() final  double finalPrice;
@override@JsonKey() final  double refundAmount;
/// The sum of the ledger's `paid` entries.
@override@JsonKey() final  double paidAmount;
/// When the latest refund was recorded.
@override final  DateTime? refundedAt;
 final  List<PurchasedTicketEntity> _tickets;
@override@JsonKey() List<PurchasedTicketEntity> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}

 final  List<PurchasedAddOnEntity> _addOns;
@override@JsonKey() List<PurchasedAddOnEntity> get addOns {
  if (_addOns is EqualUnmodifiableListView) return _addOns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addOns);
}

/// The promotion it was bought as, for package and Buy & Get rows.
@override final  FacilityPromotionEntity? promotion;
/// The promotion's own validity, when it has one.
@override final  int? promotionValidityDays;
/// The coupon a gifted coupon grants.
@override final  GiftCouponEntity? coupon;
/// The purchase a gift came from — "From Promotion".
@override final  UserPurchaseEntity? sourcePurchase;
/// The purchase a used coupon was applied to — "Applied" and its invoice.
@override final  UserPurchaseEntity? appliedPurchase;

/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPurchaseEntityCopyWith<_UserPurchaseEntity> get copyWith => __$UserPurchaseEntityCopyWithImpl<_UserPurchaseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPurchaseEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.status, status) || other.status == status)&&(identical(other.isGift, isGift) || other.isGift == isGift)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.facilityName, facilityName) || other.facilityName == facilityName)&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.isFacilityPreview, isFacilityPreview) || other.isFacilityPreview == isFacilityPreview)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expireDate, expireDate) || other.expireDate == expireDate)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.addOnsPrice, addOnsPrice) || other.addOnsPrice == addOnsPrice)&&(identical(other.couponDiscount, couponDiscount) || other.couponDiscount == couponDiscount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.refundedAt, refundedAt) || other.refundedAt == refundedAt)&&const DeepCollectionEquality().equals(other._tickets, _tickets)&&const DeepCollectionEquality().equals(other._addOns, _addOns)&&(identical(other.promotion, promotion) || other.promotion == promotion)&&(identical(other.promotionValidityDays, promotionValidityDays) || other.promotionValidityDays == promotionValidityDays)&&(identical(other.coupon, coupon) || other.coupon == coupon)&&(identical(other.sourcePurchase, sourcePurchase) || other.sourcePurchase == sourcePurchase)&&(identical(other.appliedPurchase, appliedPurchase) || other.appliedPurchase == appliedPurchase));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,kind,status,isGift,facilityId,facilityName,facility,isFacilityPreview,currency,createdAt,expireDate,quantity,price,addOnsPrice,couponDiscount,totalPrice,finalPrice,refundAmount,paidAmount,refundedAt,const DeepCollectionEquality().hash(_tickets),const DeepCollectionEquality().hash(_addOns),promotion,promotionValidityDays,coupon,sourcePurchase,appliedPurchase]);

@override
String toString() {
  return 'UserPurchaseEntity(id: $id, name: $name, kind: $kind, status: $status, isGift: $isGift, facilityId: $facilityId, facilityName: $facilityName, facility: $facility, isFacilityPreview: $isFacilityPreview, currency: $currency, createdAt: $createdAt, expireDate: $expireDate, quantity: $quantity, price: $price, addOnsPrice: $addOnsPrice, couponDiscount: $couponDiscount, totalPrice: $totalPrice, finalPrice: $finalPrice, refundAmount: $refundAmount, paidAmount: $paidAmount, refundedAt: $refundedAt, tickets: $tickets, addOns: $addOns, promotion: $promotion, promotionValidityDays: $promotionValidityDays, coupon: $coupon, sourcePurchase: $sourcePurchase, appliedPurchase: $appliedPurchase)';
}


}

/// @nodoc
abstract mixin class _$UserPurchaseEntityCopyWith<$Res> implements $UserPurchaseEntityCopyWith<$Res> {
  factory _$UserPurchaseEntityCopyWith(_UserPurchaseEntity value, $Res Function(_UserPurchaseEntity) _then) = __$UserPurchaseEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, PurchaseKind kind, PurchaseStatus status, bool isGift, int facilityId, String facilityName, CollapsedFacilityEntity? facility, bool isFacilityPreview, String currency, DateTime? createdAt, DateTime? expireDate, int quantity, double price, double addOnsPrice, double couponDiscount, double totalPrice, double finalPrice, double refundAmount, double paidAmount, DateTime? refundedAt, List<PurchasedTicketEntity> tickets, List<PurchasedAddOnEntity> addOns, FacilityPromotionEntity? promotion, int? promotionValidityDays, GiftCouponEntity? coupon, UserPurchaseEntity? sourcePurchase, UserPurchaseEntity? appliedPurchase
});


@override $CollapsedFacilityEntityCopyWith<$Res>? get facility;@override $FacilityPromotionEntityCopyWith<$Res>? get promotion;@override $GiftCouponEntityCopyWith<$Res>? get coupon;@override $UserPurchaseEntityCopyWith<$Res>? get sourcePurchase;@override $UserPurchaseEntityCopyWith<$Res>? get appliedPurchase;

}
/// @nodoc
class __$UserPurchaseEntityCopyWithImpl<$Res>
    implements _$UserPurchaseEntityCopyWith<$Res> {
  __$UserPurchaseEntityCopyWithImpl(this._self, this._then);

  final _UserPurchaseEntity _self;
  final $Res Function(_UserPurchaseEntity) _then;

/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? status = null,Object? isGift = null,Object? facilityId = null,Object? facilityName = null,Object? facility = freezed,Object? isFacilityPreview = null,Object? currency = null,Object? createdAt = freezed,Object? expireDate = freezed,Object? quantity = null,Object? price = null,Object? addOnsPrice = null,Object? couponDiscount = null,Object? totalPrice = null,Object? finalPrice = null,Object? refundAmount = null,Object? paidAmount = null,Object? refundedAt = freezed,Object? tickets = null,Object? addOns = null,Object? promotion = freezed,Object? promotionValidityDays = freezed,Object? coupon = freezed,Object? sourcePurchase = freezed,Object? appliedPurchase = freezed,}) {
  return _then(_UserPurchaseEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PurchaseKind,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PurchaseStatus,isGift: null == isGift ? _self.isGift : isGift // ignore: cast_nullable_to_non_nullable
as bool,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,facilityName: null == facilityName ? _self.facilityName : facilityName // ignore: cast_nullable_to_non_nullable
as String,facility: freezed == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity?,isFacilityPreview: null == isFacilityPreview ? _self.isFacilityPreview : isFacilityPreview // ignore: cast_nullable_to_non_nullable
as bool,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expireDate: freezed == expireDate ? _self.expireDate : expireDate // ignore: cast_nullable_to_non_nullable
as DateTime?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,addOnsPrice: null == addOnsPrice ? _self.addOnsPrice : addOnsPrice // ignore: cast_nullable_to_non_nullable
as double,couponDiscount: null == couponDiscount ? _self.couponDiscount : couponDiscount // ignore: cast_nullable_to_non_nullable
as double,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double,refundAmount: null == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,refundedAt: freezed == refundedAt ? _self.refundedAt : refundedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<PurchasedTicketEntity>,addOns: null == addOns ? _self._addOns : addOns // ignore: cast_nullable_to_non_nullable
as List<PurchasedAddOnEntity>,promotion: freezed == promotion ? _self.promotion : promotion // ignore: cast_nullable_to_non_nullable
as FacilityPromotionEntity?,promotionValidityDays: freezed == promotionValidityDays ? _self.promotionValidityDays : promotionValidityDays // ignore: cast_nullable_to_non_nullable
as int?,coupon: freezed == coupon ? _self.coupon : coupon // ignore: cast_nullable_to_non_nullable
as GiftCouponEntity?,sourcePurchase: freezed == sourcePurchase ? _self.sourcePurchase : sourcePurchase // ignore: cast_nullable_to_non_nullable
as UserPurchaseEntity?,appliedPurchase: freezed == appliedPurchase ? _self.appliedPurchase : appliedPurchase // ignore: cast_nullable_to_non_nullable
as UserPurchaseEntity?,
  ));
}

/// Create a copy of UserPurchaseEntity
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
}/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilityPromotionEntityCopyWith<$Res>? get promotion {
    if (_self.promotion == null) {
    return null;
  }

  return $FacilityPromotionEntityCopyWith<$Res>(_self.promotion!, (value) {
    return _then(_self.copyWith(promotion: value));
  });
}/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftCouponEntityCopyWith<$Res>? get coupon {
    if (_self.coupon == null) {
    return null;
  }

  return $GiftCouponEntityCopyWith<$Res>(_self.coupon!, (value) {
    return _then(_self.copyWith(coupon: value));
  });
}/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPurchaseEntityCopyWith<$Res>? get sourcePurchase {
    if (_self.sourcePurchase == null) {
    return null;
  }

  return $UserPurchaseEntityCopyWith<$Res>(_self.sourcePurchase!, (value) {
    return _then(_self.copyWith(sourcePurchase: value));
  });
}/// Create a copy of UserPurchaseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPurchaseEntityCopyWith<$Res>? get appliedPurchase {
    if (_self.appliedPurchase == null) {
    return null;
  }

  return $UserPurchaseEntityCopyWith<$Res>(_self.appliedPurchase!, (value) {
    return _then(_self.copyWith(appliedPurchase: value));
  });
}
}

// dart format on
