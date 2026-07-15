// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_invoice_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseInvoiceLineEntity {

 String get label; int get quantity; double get amount;
/// Create a copy of PurchaseInvoiceLineEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseInvoiceLineEntityCopyWith<PurchaseInvoiceLineEntity> get copyWith => _$PurchaseInvoiceLineEntityCopyWithImpl<PurchaseInvoiceLineEntity>(this as PurchaseInvoiceLineEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseInvoiceLineEntity&&(identical(other.label, label) || other.label == label)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,label,quantity,amount);

@override
String toString() {
  return 'PurchaseInvoiceLineEntity(label: $label, quantity: $quantity, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $PurchaseInvoiceLineEntityCopyWith<$Res>  {
  factory $PurchaseInvoiceLineEntityCopyWith(PurchaseInvoiceLineEntity value, $Res Function(PurchaseInvoiceLineEntity) _then) = _$PurchaseInvoiceLineEntityCopyWithImpl;
@useResult
$Res call({
 String label, int quantity, double amount
});




}
/// @nodoc
class _$PurchaseInvoiceLineEntityCopyWithImpl<$Res>
    implements $PurchaseInvoiceLineEntityCopyWith<$Res> {
  _$PurchaseInvoiceLineEntityCopyWithImpl(this._self, this._then);

  final PurchaseInvoiceLineEntity _self;
  final $Res Function(PurchaseInvoiceLineEntity) _then;

/// Create a copy of PurchaseInvoiceLineEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? quantity = null,Object? amount = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseInvoiceLineEntity].
extension PurchaseInvoiceLineEntityPatterns on PurchaseInvoiceLineEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseInvoiceLineEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseInvoiceLineEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseInvoiceLineEntity value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceLineEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseInvoiceLineEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceLineEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  int quantity,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseInvoiceLineEntity() when $default != null:
return $default(_that.label,_that.quantity,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  int quantity,  double amount)  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceLineEntity():
return $default(_that.label,_that.quantity,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  int quantity,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceLineEntity() when $default != null:
return $default(_that.label,_that.quantity,_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseInvoiceLineEntity implements PurchaseInvoiceLineEntity {
  const _PurchaseInvoiceLineEntity({required this.label, required this.quantity, required this.amount});
  

@override final  String label;
@override final  int quantity;
@override final  double amount;

/// Create a copy of PurchaseInvoiceLineEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseInvoiceLineEntityCopyWith<_PurchaseInvoiceLineEntity> get copyWith => __$PurchaseInvoiceLineEntityCopyWithImpl<_PurchaseInvoiceLineEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseInvoiceLineEntity&&(identical(other.label, label) || other.label == label)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,label,quantity,amount);

@override
String toString() {
  return 'PurchaseInvoiceLineEntity(label: $label, quantity: $quantity, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$PurchaseInvoiceLineEntityCopyWith<$Res> implements $PurchaseInvoiceLineEntityCopyWith<$Res> {
  factory _$PurchaseInvoiceLineEntityCopyWith(_PurchaseInvoiceLineEntity value, $Res Function(_PurchaseInvoiceLineEntity) _then) = __$PurchaseInvoiceLineEntityCopyWithImpl;
@override @useResult
$Res call({
 String label, int quantity, double amount
});




}
/// @nodoc
class __$PurchaseInvoiceLineEntityCopyWithImpl<$Res>
    implements _$PurchaseInvoiceLineEntityCopyWith<$Res> {
  __$PurchaseInvoiceLineEntityCopyWithImpl(this._self, this._then);

  final _PurchaseInvoiceLineEntity _self;
  final $Res Function(_PurchaseInvoiceLineEntity) _then;

/// Create a copy of PurchaseInvoiceLineEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? quantity = null,Object? amount = null,}) {
  return _then(_PurchaseInvoiceLineEntity(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$PurchaseInvoiceEntity {

 String get currency; List<PurchaseInvoiceLineEntity> get lines; double get subtotal; double get couponDiscount; double get total; double? get depositAmount;
/// Create a copy of PurchaseInvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseInvoiceEntityCopyWith<PurchaseInvoiceEntity> get copyWith => _$PurchaseInvoiceEntityCopyWithImpl<PurchaseInvoiceEntity>(this as PurchaseInvoiceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseInvoiceEntity&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.couponDiscount, couponDiscount) || other.couponDiscount == couponDiscount)&&(identical(other.total, total) || other.total == total)&&(identical(other.depositAmount, depositAmount) || other.depositAmount == depositAmount));
}


@override
int get hashCode => Object.hash(runtimeType,currency,const DeepCollectionEquality().hash(lines),subtotal,couponDiscount,total,depositAmount);

@override
String toString() {
  return 'PurchaseInvoiceEntity(currency: $currency, lines: $lines, subtotal: $subtotal, couponDiscount: $couponDiscount, total: $total, depositAmount: $depositAmount)';
}


}

/// @nodoc
abstract mixin class $PurchaseInvoiceEntityCopyWith<$Res>  {
  factory $PurchaseInvoiceEntityCopyWith(PurchaseInvoiceEntity value, $Res Function(PurchaseInvoiceEntity) _then) = _$PurchaseInvoiceEntityCopyWithImpl;
@useResult
$Res call({
 String currency, List<PurchaseInvoiceLineEntity> lines, double subtotal, double couponDiscount, double total, double? depositAmount
});




}
/// @nodoc
class _$PurchaseInvoiceEntityCopyWithImpl<$Res>
    implements $PurchaseInvoiceEntityCopyWith<$Res> {
  _$PurchaseInvoiceEntityCopyWithImpl(this._self, this._then);

  final PurchaseInvoiceEntity _self;
  final $Res Function(PurchaseInvoiceEntity) _then;

/// Create a copy of PurchaseInvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = null,Object? lines = null,Object? subtotal = null,Object? couponDiscount = null,Object? total = null,Object? depositAmount = freezed,}) {
  return _then(_self.copyWith(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<PurchaseInvoiceLineEntity>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,couponDiscount: null == couponDiscount ? _self.couponDiscount : couponDiscount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,depositAmount: freezed == depositAmount ? _self.depositAmount : depositAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseInvoiceEntity].
extension PurchaseInvoiceEntityPatterns on PurchaseInvoiceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseInvoiceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseInvoiceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseInvoiceEntity value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseInvoiceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currency,  List<PurchaseInvoiceLineEntity> lines,  double subtotal,  double couponDiscount,  double total,  double? depositAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseInvoiceEntity() when $default != null:
return $default(_that.currency,_that.lines,_that.subtotal,_that.couponDiscount,_that.total,_that.depositAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currency,  List<PurchaseInvoiceLineEntity> lines,  double subtotal,  double couponDiscount,  double total,  double? depositAmount)  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceEntity():
return $default(_that.currency,_that.lines,_that.subtotal,_that.couponDiscount,_that.total,_that.depositAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currency,  List<PurchaseInvoiceLineEntity> lines,  double subtotal,  double couponDiscount,  double total,  double? depositAmount)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceEntity() when $default != null:
return $default(_that.currency,_that.lines,_that.subtotal,_that.couponDiscount,_that.total,_that.depositAmount);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseInvoiceEntity extends PurchaseInvoiceEntity {
  const _PurchaseInvoiceEntity({required this.currency, required final  List<PurchaseInvoiceLineEntity> lines, required this.subtotal, required this.couponDiscount, required this.total, this.depositAmount}): _lines = lines,super._();
  

@override final  String currency;
 final  List<PurchaseInvoiceLineEntity> _lines;
@override List<PurchaseInvoiceLineEntity> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  double subtotal;
@override final  double couponDiscount;
@override final  double total;
@override final  double? depositAmount;

/// Create a copy of PurchaseInvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseInvoiceEntityCopyWith<_PurchaseInvoiceEntity> get copyWith => __$PurchaseInvoiceEntityCopyWithImpl<_PurchaseInvoiceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseInvoiceEntity&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._lines, _lines)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.couponDiscount, couponDiscount) || other.couponDiscount == couponDiscount)&&(identical(other.total, total) || other.total == total)&&(identical(other.depositAmount, depositAmount) || other.depositAmount == depositAmount));
}


@override
int get hashCode => Object.hash(runtimeType,currency,const DeepCollectionEquality().hash(_lines),subtotal,couponDiscount,total,depositAmount);

@override
String toString() {
  return 'PurchaseInvoiceEntity(currency: $currency, lines: $lines, subtotal: $subtotal, couponDiscount: $couponDiscount, total: $total, depositAmount: $depositAmount)';
}


}

/// @nodoc
abstract mixin class _$PurchaseInvoiceEntityCopyWith<$Res> implements $PurchaseInvoiceEntityCopyWith<$Res> {
  factory _$PurchaseInvoiceEntityCopyWith(_PurchaseInvoiceEntity value, $Res Function(_PurchaseInvoiceEntity) _then) = __$PurchaseInvoiceEntityCopyWithImpl;
@override @useResult
$Res call({
 String currency, List<PurchaseInvoiceLineEntity> lines, double subtotal, double couponDiscount, double total, double? depositAmount
});




}
/// @nodoc
class __$PurchaseInvoiceEntityCopyWithImpl<$Res>
    implements _$PurchaseInvoiceEntityCopyWith<$Res> {
  __$PurchaseInvoiceEntityCopyWithImpl(this._self, this._then);

  final _PurchaseInvoiceEntity _self;
  final $Res Function(_PurchaseInvoiceEntity) _then;

/// Create a copy of PurchaseInvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = null,Object? lines = null,Object? subtotal = null,Object? couponDiscount = null,Object? total = null,Object? depositAmount = freezed,}) {
  return _then(_PurchaseInvoiceEntity(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<PurchaseInvoiceLineEntity>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,couponDiscount: null == couponDiscount ? _self.couponDiscount : couponDiscount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,depositAmount: freezed == depositAmount ? _self.depositAmount : depositAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
