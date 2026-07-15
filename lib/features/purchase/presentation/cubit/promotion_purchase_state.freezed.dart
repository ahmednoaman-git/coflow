// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_purchase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PromotionPurchaseState {

 FacilityPromotionDetailsEntity get promotion; CollapsedFacilityEntity get facility; Color get accentColor; int get quantity; PurchaseCouponEntity? get selectedCoupon; AsyncState<List<PurchaseCouponEntity>> get couponsRequest;
/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromotionPurchaseStateCopyWith<PromotionPurchaseState> get copyWith => _$PromotionPurchaseStateCopyWithImpl<PromotionPurchaseState>(this as PromotionPurchaseState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromotionPurchaseState&&(identical(other.promotion, promotion) || other.promotion == promotion)&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.accentColor, accentColor) || other.accentColor == accentColor)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.selectedCoupon, selectedCoupon) || other.selectedCoupon == selectedCoupon)&&(identical(other.couponsRequest, couponsRequest) || other.couponsRequest == couponsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,promotion,facility,accentColor,quantity,selectedCoupon,couponsRequest);

@override
String toString() {
  return 'PromotionPurchaseState(promotion: $promotion, facility: $facility, accentColor: $accentColor, quantity: $quantity, selectedCoupon: $selectedCoupon, couponsRequest: $couponsRequest)';
}


}

/// @nodoc
abstract mixin class $PromotionPurchaseStateCopyWith<$Res>  {
  factory $PromotionPurchaseStateCopyWith(PromotionPurchaseState value, $Res Function(PromotionPurchaseState) _then) = _$PromotionPurchaseStateCopyWithImpl;
@useResult
$Res call({
 FacilityPromotionDetailsEntity promotion, CollapsedFacilityEntity facility, Color accentColor, int quantity, PurchaseCouponEntity? selectedCoupon, AsyncState<List<PurchaseCouponEntity>> couponsRequest
});


$FacilityPromotionDetailsEntityCopyWith<$Res> get promotion;$CollapsedFacilityEntityCopyWith<$Res> get facility;$PurchaseCouponEntityCopyWith<$Res>? get selectedCoupon;$AsyncStateCopyWith<List<PurchaseCouponEntity>, $Res> get couponsRequest;

}
/// @nodoc
class _$PromotionPurchaseStateCopyWithImpl<$Res>
    implements $PromotionPurchaseStateCopyWith<$Res> {
  _$PromotionPurchaseStateCopyWithImpl(this._self, this._then);

  final PromotionPurchaseState _self;
  final $Res Function(PromotionPurchaseState) _then;

/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? promotion = null,Object? facility = null,Object? accentColor = null,Object? quantity = null,Object? selectedCoupon = freezed,Object? couponsRequest = null,}) {
  return _then(_self.copyWith(
promotion: null == promotion ? _self.promotion : promotion // ignore: cast_nullable_to_non_nullable
as FacilityPromotionDetailsEntity,facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity,accentColor: null == accentColor ? _self.accentColor : accentColor // ignore: cast_nullable_to_non_nullable
as Color,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedCoupon: freezed == selectedCoupon ? _self.selectedCoupon : selectedCoupon // ignore: cast_nullable_to_non_nullable
as PurchaseCouponEntity?,couponsRequest: null == couponsRequest ? _self.couponsRequest : couponsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PurchaseCouponEntity>>,
  ));
}
/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilityPromotionDetailsEntityCopyWith<$Res> get promotion {
  
  return $FacilityPromotionDetailsEntityCopyWith<$Res>(_self.promotion, (value) {
    return _then(_self.copyWith(promotion: value));
  });
}/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res> get facility {
  
  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PurchaseCouponEntityCopyWith<$Res>? get selectedCoupon {
    if (_self.selectedCoupon == null) {
    return null;
  }

  return $PurchaseCouponEntityCopyWith<$Res>(_self.selectedCoupon!, (value) {
    return _then(_self.copyWith(selectedCoupon: value));
  });
}/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PurchaseCouponEntity>, $Res> get couponsRequest {
  
  return $AsyncStateCopyWith<List<PurchaseCouponEntity>, $Res>(_self.couponsRequest, (value) {
    return _then(_self.copyWith(couponsRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [PromotionPurchaseState].
extension PromotionPurchaseStatePatterns on PromotionPurchaseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromotionPurchaseState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromotionPurchaseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromotionPurchaseState value)  $default,){
final _that = this;
switch (_that) {
case _PromotionPurchaseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromotionPurchaseState value)?  $default,){
final _that = this;
switch (_that) {
case _PromotionPurchaseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FacilityPromotionDetailsEntity promotion,  CollapsedFacilityEntity facility,  Color accentColor,  int quantity,  PurchaseCouponEntity? selectedCoupon,  AsyncState<List<PurchaseCouponEntity>> couponsRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromotionPurchaseState() when $default != null:
return $default(_that.promotion,_that.facility,_that.accentColor,_that.quantity,_that.selectedCoupon,_that.couponsRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FacilityPromotionDetailsEntity promotion,  CollapsedFacilityEntity facility,  Color accentColor,  int quantity,  PurchaseCouponEntity? selectedCoupon,  AsyncState<List<PurchaseCouponEntity>> couponsRequest)  $default,) {final _that = this;
switch (_that) {
case _PromotionPurchaseState():
return $default(_that.promotion,_that.facility,_that.accentColor,_that.quantity,_that.selectedCoupon,_that.couponsRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FacilityPromotionDetailsEntity promotion,  CollapsedFacilityEntity facility,  Color accentColor,  int quantity,  PurchaseCouponEntity? selectedCoupon,  AsyncState<List<PurchaseCouponEntity>> couponsRequest)?  $default,) {final _that = this;
switch (_that) {
case _PromotionPurchaseState() when $default != null:
return $default(_that.promotion,_that.facility,_that.accentColor,_that.quantity,_that.selectedCoupon,_that.couponsRequest);case _:
  return null;

}
}

}

/// @nodoc


class _PromotionPurchaseState extends PromotionPurchaseState {
  const _PromotionPurchaseState({required this.promotion, required this.facility, required this.accentColor, this.quantity = 1, this.selectedCoupon, this.couponsRequest = const AsyncState.idle()}): super._();
  

@override final  FacilityPromotionDetailsEntity promotion;
@override final  CollapsedFacilityEntity facility;
@override final  Color accentColor;
@override@JsonKey() final  int quantity;
@override final  PurchaseCouponEntity? selectedCoupon;
@override@JsonKey() final  AsyncState<List<PurchaseCouponEntity>> couponsRequest;

/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromotionPurchaseStateCopyWith<_PromotionPurchaseState> get copyWith => __$PromotionPurchaseStateCopyWithImpl<_PromotionPurchaseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromotionPurchaseState&&(identical(other.promotion, promotion) || other.promotion == promotion)&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.accentColor, accentColor) || other.accentColor == accentColor)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.selectedCoupon, selectedCoupon) || other.selectedCoupon == selectedCoupon)&&(identical(other.couponsRequest, couponsRequest) || other.couponsRequest == couponsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,promotion,facility,accentColor,quantity,selectedCoupon,couponsRequest);

@override
String toString() {
  return 'PromotionPurchaseState(promotion: $promotion, facility: $facility, accentColor: $accentColor, quantity: $quantity, selectedCoupon: $selectedCoupon, couponsRequest: $couponsRequest)';
}


}

/// @nodoc
abstract mixin class _$PromotionPurchaseStateCopyWith<$Res> implements $PromotionPurchaseStateCopyWith<$Res> {
  factory _$PromotionPurchaseStateCopyWith(_PromotionPurchaseState value, $Res Function(_PromotionPurchaseState) _then) = __$PromotionPurchaseStateCopyWithImpl;
@override @useResult
$Res call({
 FacilityPromotionDetailsEntity promotion, CollapsedFacilityEntity facility, Color accentColor, int quantity, PurchaseCouponEntity? selectedCoupon, AsyncState<List<PurchaseCouponEntity>> couponsRequest
});


@override $FacilityPromotionDetailsEntityCopyWith<$Res> get promotion;@override $CollapsedFacilityEntityCopyWith<$Res> get facility;@override $PurchaseCouponEntityCopyWith<$Res>? get selectedCoupon;@override $AsyncStateCopyWith<List<PurchaseCouponEntity>, $Res> get couponsRequest;

}
/// @nodoc
class __$PromotionPurchaseStateCopyWithImpl<$Res>
    implements _$PromotionPurchaseStateCopyWith<$Res> {
  __$PromotionPurchaseStateCopyWithImpl(this._self, this._then);

  final _PromotionPurchaseState _self;
  final $Res Function(_PromotionPurchaseState) _then;

/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? promotion = null,Object? facility = null,Object? accentColor = null,Object? quantity = null,Object? selectedCoupon = freezed,Object? couponsRequest = null,}) {
  return _then(_PromotionPurchaseState(
promotion: null == promotion ? _self.promotion : promotion // ignore: cast_nullable_to_non_nullable
as FacilityPromotionDetailsEntity,facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity,accentColor: null == accentColor ? _self.accentColor : accentColor // ignore: cast_nullable_to_non_nullable
as Color,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedCoupon: freezed == selectedCoupon ? _self.selectedCoupon : selectedCoupon // ignore: cast_nullable_to_non_nullable
as PurchaseCouponEntity?,couponsRequest: null == couponsRequest ? _self.couponsRequest : couponsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PurchaseCouponEntity>>,
  ));
}

/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilityPromotionDetailsEntityCopyWith<$Res> get promotion {
  
  return $FacilityPromotionDetailsEntityCopyWith<$Res>(_self.promotion, (value) {
    return _then(_self.copyWith(promotion: value));
  });
}/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res> get facility {
  
  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PurchaseCouponEntityCopyWith<$Res>? get selectedCoupon {
    if (_self.selectedCoupon == null) {
    return null;
  }

  return $PurchaseCouponEntityCopyWith<$Res>(_self.selectedCoupon!, (value) {
    return _then(_self.copyWith(selectedCoupon: value));
  });
}/// Create a copy of PromotionPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PurchaseCouponEntity>, $Res> get couponsRequest {
  
  return $AsyncStateCopyWith<List<PurchaseCouponEntity>, $Res>(_self.couponsRequest, (value) {
    return _then(_self.copyWith(couponsRequest: value));
  });
}
}

// dart format on
