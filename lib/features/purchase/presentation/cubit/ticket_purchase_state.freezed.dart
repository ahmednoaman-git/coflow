// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_purchase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TicketPurchaseState {

 FacilityTicketDetailsEntity get ticket; CollapsedFacilityEntity get facility; Color get accentColor; Set<int> get selectedAddOnIds; int get quantity; PurchaseCouponEntity? get selectedCoupon; AsyncState<List<PurchaseCouponEntity>> get couponsRequest;
/// Create a copy of TicketPurchaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketPurchaseStateCopyWith<TicketPurchaseState> get copyWith => _$TicketPurchaseStateCopyWithImpl<TicketPurchaseState>(this as TicketPurchaseState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketPurchaseState&&(identical(other.ticket, ticket) || other.ticket == ticket)&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.accentColor, accentColor) || other.accentColor == accentColor)&&const DeepCollectionEquality().equals(other.selectedAddOnIds, selectedAddOnIds)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.selectedCoupon, selectedCoupon) || other.selectedCoupon == selectedCoupon)&&(identical(other.couponsRequest, couponsRequest) || other.couponsRequest == couponsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,ticket,facility,accentColor,const DeepCollectionEquality().hash(selectedAddOnIds),quantity,selectedCoupon,couponsRequest);

@override
String toString() {
  return 'TicketPurchaseState(ticket: $ticket, facility: $facility, accentColor: $accentColor, selectedAddOnIds: $selectedAddOnIds, quantity: $quantity, selectedCoupon: $selectedCoupon, couponsRequest: $couponsRequest)';
}


}

/// @nodoc
abstract mixin class $TicketPurchaseStateCopyWith<$Res>  {
  factory $TicketPurchaseStateCopyWith(TicketPurchaseState value, $Res Function(TicketPurchaseState) _then) = _$TicketPurchaseStateCopyWithImpl;
@useResult
$Res call({
 FacilityTicketDetailsEntity ticket, CollapsedFacilityEntity facility, Color accentColor, Set<int> selectedAddOnIds, int quantity, PurchaseCouponEntity? selectedCoupon, AsyncState<List<PurchaseCouponEntity>> couponsRequest
});


$FacilityTicketDetailsEntityCopyWith<$Res> get ticket;$CollapsedFacilityEntityCopyWith<$Res> get facility;$PurchaseCouponEntityCopyWith<$Res>? get selectedCoupon;$AsyncStateCopyWith<List<PurchaseCouponEntity>, $Res> get couponsRequest;

}
/// @nodoc
class _$TicketPurchaseStateCopyWithImpl<$Res>
    implements $TicketPurchaseStateCopyWith<$Res> {
  _$TicketPurchaseStateCopyWithImpl(this._self, this._then);

  final TicketPurchaseState _self;
  final $Res Function(TicketPurchaseState) _then;

/// Create a copy of TicketPurchaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticket = null,Object? facility = null,Object? accentColor = null,Object? selectedAddOnIds = null,Object? quantity = null,Object? selectedCoupon = freezed,Object? couponsRequest = null,}) {
  return _then(_self.copyWith(
ticket: null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as FacilityTicketDetailsEntity,facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity,accentColor: null == accentColor ? _self.accentColor : accentColor // ignore: cast_nullable_to_non_nullable
as Color,selectedAddOnIds: null == selectedAddOnIds ? _self.selectedAddOnIds : selectedAddOnIds // ignore: cast_nullable_to_non_nullable
as Set<int>,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedCoupon: freezed == selectedCoupon ? _self.selectedCoupon : selectedCoupon // ignore: cast_nullable_to_non_nullable
as PurchaseCouponEntity?,couponsRequest: null == couponsRequest ? _self.couponsRequest : couponsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PurchaseCouponEntity>>,
  ));
}
/// Create a copy of TicketPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilityTicketDetailsEntityCopyWith<$Res> get ticket {
  
  return $FacilityTicketDetailsEntityCopyWith<$Res>(_self.ticket, (value) {
    return _then(_self.copyWith(ticket: value));
  });
}/// Create a copy of TicketPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res> get facility {
  
  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}/// Create a copy of TicketPurchaseState
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
}/// Create a copy of TicketPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<PurchaseCouponEntity>, $Res> get couponsRequest {
  
  return $AsyncStateCopyWith<List<PurchaseCouponEntity>, $Res>(_self.couponsRequest, (value) {
    return _then(_self.copyWith(couponsRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketPurchaseState].
extension TicketPurchaseStatePatterns on TicketPurchaseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketPurchaseState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketPurchaseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketPurchaseState value)  $default,){
final _that = this;
switch (_that) {
case _TicketPurchaseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketPurchaseState value)?  $default,){
final _that = this;
switch (_that) {
case _TicketPurchaseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FacilityTicketDetailsEntity ticket,  CollapsedFacilityEntity facility,  Color accentColor,  Set<int> selectedAddOnIds,  int quantity,  PurchaseCouponEntity? selectedCoupon,  AsyncState<List<PurchaseCouponEntity>> couponsRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketPurchaseState() when $default != null:
return $default(_that.ticket,_that.facility,_that.accentColor,_that.selectedAddOnIds,_that.quantity,_that.selectedCoupon,_that.couponsRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FacilityTicketDetailsEntity ticket,  CollapsedFacilityEntity facility,  Color accentColor,  Set<int> selectedAddOnIds,  int quantity,  PurchaseCouponEntity? selectedCoupon,  AsyncState<List<PurchaseCouponEntity>> couponsRequest)  $default,) {final _that = this;
switch (_that) {
case _TicketPurchaseState():
return $default(_that.ticket,_that.facility,_that.accentColor,_that.selectedAddOnIds,_that.quantity,_that.selectedCoupon,_that.couponsRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FacilityTicketDetailsEntity ticket,  CollapsedFacilityEntity facility,  Color accentColor,  Set<int> selectedAddOnIds,  int quantity,  PurchaseCouponEntity? selectedCoupon,  AsyncState<List<PurchaseCouponEntity>> couponsRequest)?  $default,) {final _that = this;
switch (_that) {
case _TicketPurchaseState() when $default != null:
return $default(_that.ticket,_that.facility,_that.accentColor,_that.selectedAddOnIds,_that.quantity,_that.selectedCoupon,_that.couponsRequest);case _:
  return null;

}
}

}

/// @nodoc


class _TicketPurchaseState extends TicketPurchaseState {
  const _TicketPurchaseState({required this.ticket, required this.facility, required this.accentColor, final  Set<int> selectedAddOnIds = const <int>{}, this.quantity = 1, this.selectedCoupon, this.couponsRequest = const AsyncState.idle()}): _selectedAddOnIds = selectedAddOnIds,super._();
  

@override final  FacilityTicketDetailsEntity ticket;
@override final  CollapsedFacilityEntity facility;
@override final  Color accentColor;
 final  Set<int> _selectedAddOnIds;
@override@JsonKey() Set<int> get selectedAddOnIds {
  if (_selectedAddOnIds is EqualUnmodifiableSetView) return _selectedAddOnIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedAddOnIds);
}

@override@JsonKey() final  int quantity;
@override final  PurchaseCouponEntity? selectedCoupon;
@override@JsonKey() final  AsyncState<List<PurchaseCouponEntity>> couponsRequest;

/// Create a copy of TicketPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketPurchaseStateCopyWith<_TicketPurchaseState> get copyWith => __$TicketPurchaseStateCopyWithImpl<_TicketPurchaseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketPurchaseState&&(identical(other.ticket, ticket) || other.ticket == ticket)&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.accentColor, accentColor) || other.accentColor == accentColor)&&const DeepCollectionEquality().equals(other._selectedAddOnIds, _selectedAddOnIds)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.selectedCoupon, selectedCoupon) || other.selectedCoupon == selectedCoupon)&&(identical(other.couponsRequest, couponsRequest) || other.couponsRequest == couponsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,ticket,facility,accentColor,const DeepCollectionEquality().hash(_selectedAddOnIds),quantity,selectedCoupon,couponsRequest);

@override
String toString() {
  return 'TicketPurchaseState(ticket: $ticket, facility: $facility, accentColor: $accentColor, selectedAddOnIds: $selectedAddOnIds, quantity: $quantity, selectedCoupon: $selectedCoupon, couponsRequest: $couponsRequest)';
}


}

/// @nodoc
abstract mixin class _$TicketPurchaseStateCopyWith<$Res> implements $TicketPurchaseStateCopyWith<$Res> {
  factory _$TicketPurchaseStateCopyWith(_TicketPurchaseState value, $Res Function(_TicketPurchaseState) _then) = __$TicketPurchaseStateCopyWithImpl;
@override @useResult
$Res call({
 FacilityTicketDetailsEntity ticket, CollapsedFacilityEntity facility, Color accentColor, Set<int> selectedAddOnIds, int quantity, PurchaseCouponEntity? selectedCoupon, AsyncState<List<PurchaseCouponEntity>> couponsRequest
});


@override $FacilityTicketDetailsEntityCopyWith<$Res> get ticket;@override $CollapsedFacilityEntityCopyWith<$Res> get facility;@override $PurchaseCouponEntityCopyWith<$Res>? get selectedCoupon;@override $AsyncStateCopyWith<List<PurchaseCouponEntity>, $Res> get couponsRequest;

}
/// @nodoc
class __$TicketPurchaseStateCopyWithImpl<$Res>
    implements _$TicketPurchaseStateCopyWith<$Res> {
  __$TicketPurchaseStateCopyWithImpl(this._self, this._then);

  final _TicketPurchaseState _self;
  final $Res Function(_TicketPurchaseState) _then;

/// Create a copy of TicketPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticket = null,Object? facility = null,Object? accentColor = null,Object? selectedAddOnIds = null,Object? quantity = null,Object? selectedCoupon = freezed,Object? couponsRequest = null,}) {
  return _then(_TicketPurchaseState(
ticket: null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as FacilityTicketDetailsEntity,facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity,accentColor: null == accentColor ? _self.accentColor : accentColor // ignore: cast_nullable_to_non_nullable
as Color,selectedAddOnIds: null == selectedAddOnIds ? _self._selectedAddOnIds : selectedAddOnIds // ignore: cast_nullable_to_non_nullable
as Set<int>,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedCoupon: freezed == selectedCoupon ? _self.selectedCoupon : selectedCoupon // ignore: cast_nullable_to_non_nullable
as PurchaseCouponEntity?,couponsRequest: null == couponsRequest ? _self.couponsRequest : couponsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<PurchaseCouponEntity>>,
  ));
}

/// Create a copy of TicketPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilityTicketDetailsEntityCopyWith<$Res> get ticket {
  
  return $FacilityTicketDetailsEntityCopyWith<$Res>(_self.ticket, (value) {
    return _then(_self.copyWith(ticket: value));
  });
}/// Create a copy of TicketPurchaseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res> get facility {
  
  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}/// Create a copy of TicketPurchaseState
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
}/// Create a copy of TicketPurchaseState
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
