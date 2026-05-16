// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_promotion_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityPromotionEntity {

 int get id; String get name; DateTime get endDate; bool get isLiked;
/// Create a copy of FacilityPromotionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionEntityCopyWith<FacilityPromotionEntity> get copyWith => _$FacilityPromotionEntityCopyWithImpl<FacilityPromotionEntity>(this as FacilityPromotionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,endDate,isLiked);

@override
String toString() {
  return 'FacilityPromotionEntity(id: $id, name: $name, endDate: $endDate, isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class $FacilityPromotionEntityCopyWith<$Res>  {
  factory $FacilityPromotionEntityCopyWith(FacilityPromotionEntity value, $Res Function(FacilityPromotionEntity) _then) = _$FacilityPromotionEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, DateTime endDate, bool isLiked
});




}
/// @nodoc
class _$FacilityPromotionEntityCopyWithImpl<$Res>
    implements $FacilityPromotionEntityCopyWith<$Res> {
  _$FacilityPromotionEntityCopyWithImpl(this._self, this._then);

  final FacilityPromotionEntity _self;
  final $Res Function(FacilityPromotionEntity) _then;

/// Create a copy of FacilityPromotionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? endDate = null,Object? isLiked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityPromotionEntity].
extension FacilityPromotionEntityPatterns on FacilityPromotionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FacilityPromotionDiscountEntity value)?  discount,TResult Function( FacilityPromotionPackageEntity value)?  package,TResult Function( FacilityPromotionBuyGetEntity value)?  buyGet,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FacilityPromotionDiscountEntity() when discount != null:
return discount(_that);case FacilityPromotionPackageEntity() when package != null:
return package(_that);case FacilityPromotionBuyGetEntity() when buyGet != null:
return buyGet(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FacilityPromotionDiscountEntity value)  discount,required TResult Function( FacilityPromotionPackageEntity value)  package,required TResult Function( FacilityPromotionBuyGetEntity value)  buyGet,}){
final _that = this;
switch (_that) {
case FacilityPromotionDiscountEntity():
return discount(_that);case FacilityPromotionPackageEntity():
return package(_that);case FacilityPromotionBuyGetEntity():
return buyGet(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FacilityPromotionDiscountEntity value)?  discount,TResult? Function( FacilityPromotionPackageEntity value)?  package,TResult? Function( FacilityPromotionBuyGetEntity value)?  buyGet,}){
final _that = this;
switch (_that) {
case FacilityPromotionDiscountEntity() when discount != null:
return discount(_that);case FacilityPromotionPackageEntity() when package != null:
return package(_that);case FacilityPromotionBuyGetEntity() when buyGet != null:
return buyGet(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String name,  DateTime endDate,  bool isLiked,  double discountRatio,  FacilityPromotionAppliesOn discountFor)?  discount,TResult Function( int id,  String name,  DateTime endDate,  bool isLiked,  double displayPrice,  String currency,  List<FacilityPromotionTicketLineEntity> tickets,  bool remainingUnlimited,  int? remainingCount)?  package,TResult Function( int id,  String name,  DateTime endDate,  bool isLiked,  double displayPrice,  String currency,  List<FacilityPromotionTicketLineEntity> buyTickets,  FacilityPromotionRewardEntity reward,  bool remainingUnlimited,  int? remainingCount)?  buyGet,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FacilityPromotionDiscountEntity() when discount != null:
return discount(_that.id,_that.name,_that.endDate,_that.isLiked,_that.discountRatio,_that.discountFor);case FacilityPromotionPackageEntity() when package != null:
return package(_that.id,_that.name,_that.endDate,_that.isLiked,_that.displayPrice,_that.currency,_that.tickets,_that.remainingUnlimited,_that.remainingCount);case FacilityPromotionBuyGetEntity() when buyGet != null:
return buyGet(_that.id,_that.name,_that.endDate,_that.isLiked,_that.displayPrice,_that.currency,_that.buyTickets,_that.reward,_that.remainingUnlimited,_that.remainingCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String name,  DateTime endDate,  bool isLiked,  double discountRatio,  FacilityPromotionAppliesOn discountFor)  discount,required TResult Function( int id,  String name,  DateTime endDate,  bool isLiked,  double displayPrice,  String currency,  List<FacilityPromotionTicketLineEntity> tickets,  bool remainingUnlimited,  int? remainingCount)  package,required TResult Function( int id,  String name,  DateTime endDate,  bool isLiked,  double displayPrice,  String currency,  List<FacilityPromotionTicketLineEntity> buyTickets,  FacilityPromotionRewardEntity reward,  bool remainingUnlimited,  int? remainingCount)  buyGet,}) {final _that = this;
switch (_that) {
case FacilityPromotionDiscountEntity():
return discount(_that.id,_that.name,_that.endDate,_that.isLiked,_that.discountRatio,_that.discountFor);case FacilityPromotionPackageEntity():
return package(_that.id,_that.name,_that.endDate,_that.isLiked,_that.displayPrice,_that.currency,_that.tickets,_that.remainingUnlimited,_that.remainingCount);case FacilityPromotionBuyGetEntity():
return buyGet(_that.id,_that.name,_that.endDate,_that.isLiked,_that.displayPrice,_that.currency,_that.buyTickets,_that.reward,_that.remainingUnlimited,_that.remainingCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String name,  DateTime endDate,  bool isLiked,  double discountRatio,  FacilityPromotionAppliesOn discountFor)?  discount,TResult? Function( int id,  String name,  DateTime endDate,  bool isLiked,  double displayPrice,  String currency,  List<FacilityPromotionTicketLineEntity> tickets,  bool remainingUnlimited,  int? remainingCount)?  package,TResult? Function( int id,  String name,  DateTime endDate,  bool isLiked,  double displayPrice,  String currency,  List<FacilityPromotionTicketLineEntity> buyTickets,  FacilityPromotionRewardEntity reward,  bool remainingUnlimited,  int? remainingCount)?  buyGet,}) {final _that = this;
switch (_that) {
case FacilityPromotionDiscountEntity() when discount != null:
return discount(_that.id,_that.name,_that.endDate,_that.isLiked,_that.discountRatio,_that.discountFor);case FacilityPromotionPackageEntity() when package != null:
return package(_that.id,_that.name,_that.endDate,_that.isLiked,_that.displayPrice,_that.currency,_that.tickets,_that.remainingUnlimited,_that.remainingCount);case FacilityPromotionBuyGetEntity() when buyGet != null:
return buyGet(_that.id,_that.name,_that.endDate,_that.isLiked,_that.displayPrice,_that.currency,_that.buyTickets,_that.reward,_that.remainingUnlimited,_that.remainingCount);case _:
  return null;

}
}

}




/// @nodoc
mixin _$FacilityPromotionDiscountEntity {

 int get id; String get name; DateTime get endDate; bool get isLiked; double get discountRatio; FacilityPromotionAppliesOn get discountFor;
/// Create a copy of FacilityPromotionDiscountEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionDiscountEntityCopyWith<FacilityPromotionDiscountEntity> get copyWith => _$FacilityPromotionDiscountEntityCopyWithImpl<FacilityPromotionDiscountEntity>(this as FacilityPromotionDiscountEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionDiscountEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.discountRatio, discountRatio) || other.discountRatio == discountRatio)&&(identical(other.discountFor, discountFor) || other.discountFor == discountFor));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,endDate,isLiked,discountRatio,discountFor);

@override
String toString() {
  return 'FacilityPromotionDiscountEntity(id: $id, name: $name, endDate: $endDate, isLiked: $isLiked, discountRatio: $discountRatio, discountFor: $discountFor)';
}


}

/// @nodoc
abstract mixin class $FacilityPromotionDiscountEntityCopyWith<$Res> implements $FacilityPromotionEntityCopyWith<$Res> {
  factory $FacilityPromotionDiscountEntityCopyWith(FacilityPromotionDiscountEntity value, $Res Function(FacilityPromotionDiscountEntity) _then) = _$FacilityPromotionDiscountEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, DateTime endDate, bool isLiked, double discountRatio, FacilityPromotionAppliesOn discountFor
});




}
/// @nodoc
class _$FacilityPromotionDiscountEntityCopyWithImpl<$Res>
    implements $FacilityPromotionDiscountEntityCopyWith<$Res> {
  _$FacilityPromotionDiscountEntityCopyWithImpl(this._self, this._then);

  final FacilityPromotionDiscountEntity _self;
  final $Res Function(FacilityPromotionDiscountEntity) _then;

/// Create a copy of FacilityPromotionDiscountEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? endDate = null,Object? isLiked = null,Object? discountRatio = null,Object? discountFor = null,}) {
  return _then(FacilityPromotionDiscountEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,discountRatio: null == discountRatio ? _self.discountRatio : discountRatio // ignore: cast_nullable_to_non_nullable
as double,discountFor: null == discountFor ? _self.discountFor : discountFor // ignore: cast_nullable_to_non_nullable
as FacilityPromotionAppliesOn,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityPromotionDiscountEntity].
extension FacilityPromotionDiscountEntityPatterns on FacilityPromotionDiscountEntity {
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
mixin _$FacilityPromotionPackageEntity {

 int get id; String get name; DateTime get endDate; bool get isLiked; double get displayPrice; String get currency; List<FacilityPromotionTicketLineEntity> get tickets; bool get remainingUnlimited; int? get remainingCount;
/// Create a copy of FacilityPromotionPackageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionPackageEntityCopyWith<FacilityPromotionPackageEntity> get copyWith => _$FacilityPromotionPackageEntityCopyWithImpl<FacilityPromotionPackageEntity>(this as FacilityPromotionPackageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionPackageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.displayPrice, displayPrice) || other.displayPrice == displayPrice)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.tickets, tickets)&&(identical(other.remainingUnlimited, remainingUnlimited) || other.remainingUnlimited == remainingUnlimited)&&(identical(other.remainingCount, remainingCount) || other.remainingCount == remainingCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,endDate,isLiked,displayPrice,currency,const DeepCollectionEquality().hash(tickets),remainingUnlimited,remainingCount);

@override
String toString() {
  return 'FacilityPromotionPackageEntity(id: $id, name: $name, endDate: $endDate, isLiked: $isLiked, displayPrice: $displayPrice, currency: $currency, tickets: $tickets, remainingUnlimited: $remainingUnlimited, remainingCount: $remainingCount)';
}


}

/// @nodoc
abstract mixin class $FacilityPromotionPackageEntityCopyWith<$Res> implements $FacilityPromotionEntityCopyWith<$Res> {
  factory $FacilityPromotionPackageEntityCopyWith(FacilityPromotionPackageEntity value, $Res Function(FacilityPromotionPackageEntity) _then) = _$FacilityPromotionPackageEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, DateTime endDate, bool isLiked, double displayPrice, String currency, List<FacilityPromotionTicketLineEntity> tickets, bool remainingUnlimited, int? remainingCount
});




}
/// @nodoc
class _$FacilityPromotionPackageEntityCopyWithImpl<$Res>
    implements $FacilityPromotionPackageEntityCopyWith<$Res> {
  _$FacilityPromotionPackageEntityCopyWithImpl(this._self, this._then);

  final FacilityPromotionPackageEntity _self;
  final $Res Function(FacilityPromotionPackageEntity) _then;

/// Create a copy of FacilityPromotionPackageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? endDate = null,Object? isLiked = null,Object? displayPrice = null,Object? currency = null,Object? tickets = null,Object? remainingUnlimited = null,Object? remainingCount = freezed,}) {
  return _then(FacilityPromotionPackageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,displayPrice: null == displayPrice ? _self.displayPrice : displayPrice // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<FacilityPromotionTicketLineEntity>,remainingUnlimited: null == remainingUnlimited ? _self.remainingUnlimited : remainingUnlimited // ignore: cast_nullable_to_non_nullable
as bool,remainingCount: freezed == remainingCount ? _self.remainingCount : remainingCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityPromotionPackageEntity].
extension FacilityPromotionPackageEntityPatterns on FacilityPromotionPackageEntity {
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
mixin _$FacilityPromotionBuyGetEntity {

 int get id; String get name; DateTime get endDate; bool get isLiked; double get displayPrice; String get currency; List<FacilityPromotionTicketLineEntity> get buyTickets; FacilityPromotionRewardEntity get reward; bool get remainingUnlimited; int? get remainingCount;
/// Create a copy of FacilityPromotionBuyGetEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionBuyGetEntityCopyWith<FacilityPromotionBuyGetEntity> get copyWith => _$FacilityPromotionBuyGetEntityCopyWithImpl<FacilityPromotionBuyGetEntity>(this as FacilityPromotionBuyGetEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionBuyGetEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.displayPrice, displayPrice) || other.displayPrice == displayPrice)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.buyTickets, buyTickets)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.remainingUnlimited, remainingUnlimited) || other.remainingUnlimited == remainingUnlimited)&&(identical(other.remainingCount, remainingCount) || other.remainingCount == remainingCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,endDate,isLiked,displayPrice,currency,const DeepCollectionEquality().hash(buyTickets),reward,remainingUnlimited,remainingCount);

@override
String toString() {
  return 'FacilityPromotionBuyGetEntity(id: $id, name: $name, endDate: $endDate, isLiked: $isLiked, displayPrice: $displayPrice, currency: $currency, buyTickets: $buyTickets, reward: $reward, remainingUnlimited: $remainingUnlimited, remainingCount: $remainingCount)';
}


}

/// @nodoc
abstract mixin class $FacilityPromotionBuyGetEntityCopyWith<$Res> implements $FacilityPromotionEntityCopyWith<$Res> {
  factory $FacilityPromotionBuyGetEntityCopyWith(FacilityPromotionBuyGetEntity value, $Res Function(FacilityPromotionBuyGetEntity) _then) = _$FacilityPromotionBuyGetEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, DateTime endDate, bool isLiked, double displayPrice, String currency, List<FacilityPromotionTicketLineEntity> buyTickets, FacilityPromotionRewardEntity reward, bool remainingUnlimited, int? remainingCount
});




}
/// @nodoc
class _$FacilityPromotionBuyGetEntityCopyWithImpl<$Res>
    implements $FacilityPromotionBuyGetEntityCopyWith<$Res> {
  _$FacilityPromotionBuyGetEntityCopyWithImpl(this._self, this._then);

  final FacilityPromotionBuyGetEntity _self;
  final $Res Function(FacilityPromotionBuyGetEntity) _then;

/// Create a copy of FacilityPromotionBuyGetEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? endDate = null,Object? isLiked = null,Object? displayPrice = null,Object? currency = null,Object? buyTickets = null,Object? reward = null,Object? remainingUnlimited = null,Object? remainingCount = freezed,}) {
  return _then(FacilityPromotionBuyGetEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,displayPrice: null == displayPrice ? _self.displayPrice : displayPrice // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,buyTickets: null == buyTickets ? _self.buyTickets : buyTickets // ignore: cast_nullable_to_non_nullable
as List<FacilityPromotionTicketLineEntity>,reward: null == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as FacilityPromotionRewardEntity,remainingUnlimited: null == remainingUnlimited ? _self.remainingUnlimited : remainingUnlimited // ignore: cast_nullable_to_non_nullable
as bool,remainingCount: freezed == remainingCount ? _self.remainingCount : remainingCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityPromotionBuyGetEntity].
extension FacilityPromotionBuyGetEntityPatterns on FacilityPromotionBuyGetEntity {
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
