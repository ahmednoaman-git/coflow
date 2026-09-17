// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_quote_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseQuoteEntity {

 double get totalPrice; double get finalPrice; double get couponDiscount; double get addOnsPrice; String? get currency;
/// Create a copy of PurchaseQuoteEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseQuoteEntityCopyWith<PurchaseQuoteEntity> get copyWith => _$PurchaseQuoteEntityCopyWithImpl<PurchaseQuoteEntity>(this as PurchaseQuoteEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseQuoteEntity&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.couponDiscount, couponDiscount) || other.couponDiscount == couponDiscount)&&(identical(other.addOnsPrice, addOnsPrice) || other.addOnsPrice == addOnsPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,totalPrice,finalPrice,couponDiscount,addOnsPrice,currency);

@override
String toString() {
  return 'PurchaseQuoteEntity(totalPrice: $totalPrice, finalPrice: $finalPrice, couponDiscount: $couponDiscount, addOnsPrice: $addOnsPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $PurchaseQuoteEntityCopyWith<$Res>  {
  factory $PurchaseQuoteEntityCopyWith(PurchaseQuoteEntity value, $Res Function(PurchaseQuoteEntity) _then) = _$PurchaseQuoteEntityCopyWithImpl;
@useResult
$Res call({
 double totalPrice, double finalPrice, double couponDiscount, double addOnsPrice, String? currency
});




}
/// @nodoc
class _$PurchaseQuoteEntityCopyWithImpl<$Res>
    implements $PurchaseQuoteEntityCopyWith<$Res> {
  _$PurchaseQuoteEntityCopyWithImpl(this._self, this._then);

  final PurchaseQuoteEntity _self;
  final $Res Function(PurchaseQuoteEntity) _then;

/// Create a copy of PurchaseQuoteEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalPrice = null,Object? finalPrice = null,Object? couponDiscount = null,Object? addOnsPrice = null,Object? currency = freezed,}) {
  return _then(_self.copyWith(
totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double,couponDiscount: null == couponDiscount ? _self.couponDiscount : couponDiscount // ignore: cast_nullable_to_non_nullable
as double,addOnsPrice: null == addOnsPrice ? _self.addOnsPrice : addOnsPrice // ignore: cast_nullable_to_non_nullable
as double,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseQuoteEntity].
extension PurchaseQuoteEntityPatterns on PurchaseQuoteEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseQuoteEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseQuoteEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseQuoteEntity value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseQuoteEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseQuoteEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseQuoteEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalPrice,  double finalPrice,  double couponDiscount,  double addOnsPrice,  String? currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseQuoteEntity() when $default != null:
return $default(_that.totalPrice,_that.finalPrice,_that.couponDiscount,_that.addOnsPrice,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalPrice,  double finalPrice,  double couponDiscount,  double addOnsPrice,  String? currency)  $default,) {final _that = this;
switch (_that) {
case _PurchaseQuoteEntity():
return $default(_that.totalPrice,_that.finalPrice,_that.couponDiscount,_that.addOnsPrice,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalPrice,  double finalPrice,  double couponDiscount,  double addOnsPrice,  String? currency)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseQuoteEntity() when $default != null:
return $default(_that.totalPrice,_that.finalPrice,_that.couponDiscount,_that.addOnsPrice,_that.currency);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseQuoteEntity implements PurchaseQuoteEntity {
  const _PurchaseQuoteEntity({required this.totalPrice, required this.finalPrice, required this.couponDiscount, this.addOnsPrice = 0, this.currency});
  

@override final  double totalPrice;
@override final  double finalPrice;
@override final  double couponDiscount;
@override@JsonKey() final  double addOnsPrice;
@override final  String? currency;

/// Create a copy of PurchaseQuoteEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseQuoteEntityCopyWith<_PurchaseQuoteEntity> get copyWith => __$PurchaseQuoteEntityCopyWithImpl<_PurchaseQuoteEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseQuoteEntity&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.couponDiscount, couponDiscount) || other.couponDiscount == couponDiscount)&&(identical(other.addOnsPrice, addOnsPrice) || other.addOnsPrice == addOnsPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,totalPrice,finalPrice,couponDiscount,addOnsPrice,currency);

@override
String toString() {
  return 'PurchaseQuoteEntity(totalPrice: $totalPrice, finalPrice: $finalPrice, couponDiscount: $couponDiscount, addOnsPrice: $addOnsPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$PurchaseQuoteEntityCopyWith<$Res> implements $PurchaseQuoteEntityCopyWith<$Res> {
  factory _$PurchaseQuoteEntityCopyWith(_PurchaseQuoteEntity value, $Res Function(_PurchaseQuoteEntity) _then) = __$PurchaseQuoteEntityCopyWithImpl;
@override @useResult
$Res call({
 double totalPrice, double finalPrice, double couponDiscount, double addOnsPrice, String? currency
});




}
/// @nodoc
class __$PurchaseQuoteEntityCopyWithImpl<$Res>
    implements _$PurchaseQuoteEntityCopyWith<$Res> {
  __$PurchaseQuoteEntityCopyWithImpl(this._self, this._then);

  final _PurchaseQuoteEntity _self;
  final $Res Function(_PurchaseQuoteEntity) _then;

/// Create a copy of PurchaseQuoteEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalPrice = null,Object? finalPrice = null,Object? couponDiscount = null,Object? addOnsPrice = null,Object? currency = freezed,}) {
  return _then(_PurchaseQuoteEntity(
totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double,couponDiscount: null == couponDiscount ? _self.couponDiscount : couponDiscount // ignore: cast_nullable_to_non_nullable
as double,addOnsPrice: null == addOnsPrice ? _self.addOnsPrice : addOnsPrice // ignore: cast_nullable_to_non_nullable
as double,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
