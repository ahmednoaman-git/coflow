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

 int get id; String get name; double get discountRatio;
/// Create a copy of PurchaseCouponEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseCouponEntityCopyWith<PurchaseCouponEntity> get copyWith => _$PurchaseCouponEntityCopyWithImpl<PurchaseCouponEntity>(this as PurchaseCouponEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseCouponEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.discountRatio, discountRatio) || other.discountRatio == discountRatio));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,discountRatio);

@override
String toString() {
  return 'PurchaseCouponEntity(id: $id, name: $name, discountRatio: $discountRatio)';
}


}

/// @nodoc
abstract mixin class $PurchaseCouponEntityCopyWith<$Res>  {
  factory $PurchaseCouponEntityCopyWith(PurchaseCouponEntity value, $Res Function(PurchaseCouponEntity) _then) = _$PurchaseCouponEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, double discountRatio
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? discountRatio = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,discountRatio: null == discountRatio ? _self.discountRatio : discountRatio // ignore: cast_nullable_to_non_nullable
as double,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  double discountRatio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseCouponEntity() when $default != null:
return $default(_that.id,_that.name,_that.discountRatio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  double discountRatio)  $default,) {final _that = this;
switch (_that) {
case _PurchaseCouponEntity():
return $default(_that.id,_that.name,_that.discountRatio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  double discountRatio)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseCouponEntity() when $default != null:
return $default(_that.id,_that.name,_that.discountRatio);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseCouponEntity extends PurchaseCouponEntity {
  const _PurchaseCouponEntity({required this.id, required this.name, required this.discountRatio}): super._();
  

@override final  int id;
@override final  String name;
@override final  double discountRatio;

/// Create a copy of PurchaseCouponEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseCouponEntityCopyWith<_PurchaseCouponEntity> get copyWith => __$PurchaseCouponEntityCopyWithImpl<_PurchaseCouponEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseCouponEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.discountRatio, discountRatio) || other.discountRatio == discountRatio));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,discountRatio);

@override
String toString() {
  return 'PurchaseCouponEntity(id: $id, name: $name, discountRatio: $discountRatio)';
}


}

/// @nodoc
abstract mixin class _$PurchaseCouponEntityCopyWith<$Res> implements $PurchaseCouponEntityCopyWith<$Res> {
  factory _$PurchaseCouponEntityCopyWith(_PurchaseCouponEntity value, $Res Function(_PurchaseCouponEntity) _then) = __$PurchaseCouponEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double discountRatio
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? discountRatio = null,}) {
  return _then(_PurchaseCouponEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,discountRatio: null == discountRatio ? _self.discountRatio : discountRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
