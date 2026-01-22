// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_ticket_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityTicketEntity {

 int get id; String get name; int get servicesCount; double get originalPrice; double? get discountPrice; String get currency;
/// Create a copy of FacilityTicketEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityTicketEntityCopyWith<FacilityTicketEntity> get copyWith => _$FacilityTicketEntityCopyWithImpl<FacilityTicketEntity>(this as FacilityTicketEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityTicketEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.servicesCount, servicesCount) || other.servicesCount == servicesCount)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,servicesCount,originalPrice,discountPrice,currency);

@override
String toString() {
  return 'FacilityTicketEntity(id: $id, name: $name, servicesCount: $servicesCount, originalPrice: $originalPrice, discountPrice: $discountPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $FacilityTicketEntityCopyWith<$Res>  {
  factory $FacilityTicketEntityCopyWith(FacilityTicketEntity value, $Res Function(FacilityTicketEntity) _then) = _$FacilityTicketEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, int servicesCount, double originalPrice, double? discountPrice, String currency
});




}
/// @nodoc
class _$FacilityTicketEntityCopyWithImpl<$Res>
    implements $FacilityTicketEntityCopyWith<$Res> {
  _$FacilityTicketEntityCopyWithImpl(this._self, this._then);

  final FacilityTicketEntity _self;
  final $Res Function(FacilityTicketEntity) _then;

/// Create a copy of FacilityTicketEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? servicesCount = null,Object? originalPrice = null,Object? discountPrice = freezed,Object? currency = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,servicesCount: null == servicesCount ? _self.servicesCount : servicesCount // ignore: cast_nullable_to_non_nullable
as int,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double,discountPrice: freezed == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityTicketEntity].
extension FacilityTicketEntityPatterns on FacilityTicketEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityTicketEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityTicketEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityTicketEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityTicketEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityTicketEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityTicketEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int servicesCount,  double originalPrice,  double? discountPrice,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityTicketEntity() when $default != null:
return $default(_that.id,_that.name,_that.servicesCount,_that.originalPrice,_that.discountPrice,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int servicesCount,  double originalPrice,  double? discountPrice,  String currency)  $default,) {final _that = this;
switch (_that) {
case _FacilityTicketEntity():
return $default(_that.id,_that.name,_that.servicesCount,_that.originalPrice,_that.discountPrice,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int servicesCount,  double originalPrice,  double? discountPrice,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _FacilityTicketEntity() when $default != null:
return $default(_that.id,_that.name,_that.servicesCount,_that.originalPrice,_that.discountPrice,_that.currency);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityTicketEntity implements FacilityTicketEntity {
  const _FacilityTicketEntity({required this.id, required this.name, required this.servicesCount, required this.originalPrice, this.discountPrice, required this.currency});
  

@override final  int id;
@override final  String name;
@override final  int servicesCount;
@override final  double originalPrice;
@override final  double? discountPrice;
@override final  String currency;

/// Create a copy of FacilityTicketEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityTicketEntityCopyWith<_FacilityTicketEntity> get copyWith => __$FacilityTicketEntityCopyWithImpl<_FacilityTicketEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityTicketEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.servicesCount, servicesCount) || other.servicesCount == servicesCount)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,servicesCount,originalPrice,discountPrice,currency);

@override
String toString() {
  return 'FacilityTicketEntity(id: $id, name: $name, servicesCount: $servicesCount, originalPrice: $originalPrice, discountPrice: $discountPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$FacilityTicketEntityCopyWith<$Res> implements $FacilityTicketEntityCopyWith<$Res> {
  factory _$FacilityTicketEntityCopyWith(_FacilityTicketEntity value, $Res Function(_FacilityTicketEntity) _then) = __$FacilityTicketEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int servicesCount, double originalPrice, double? discountPrice, String currency
});




}
/// @nodoc
class __$FacilityTicketEntityCopyWithImpl<$Res>
    implements _$FacilityTicketEntityCopyWith<$Res> {
  __$FacilityTicketEntityCopyWithImpl(this._self, this._then);

  final _FacilityTicketEntity _self;
  final $Res Function(_FacilityTicketEntity) _then;

/// Create a copy of FacilityTicketEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? servicesCount = null,Object? originalPrice = null,Object? discountPrice = freezed,Object? currency = null,}) {
  return _then(_FacilityTicketEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,servicesCount: null == servicesCount ? _self.servicesCount : servicesCount // ignore: cast_nullable_to_non_nullable
as int,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double,discountPrice: freezed == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
