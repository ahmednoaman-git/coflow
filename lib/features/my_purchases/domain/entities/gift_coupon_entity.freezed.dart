// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_coupon_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GiftCouponEntity {

/// The discount, in percent.
 double get discountRatio; int? get validityDays; bool get unlimited; CouponScope get scope;/// The tickets or promotions it is limited to.
 List<String> get targetNames;
/// Create a copy of GiftCouponEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftCouponEntityCopyWith<GiftCouponEntity> get copyWith => _$GiftCouponEntityCopyWithImpl<GiftCouponEntity>(this as GiftCouponEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftCouponEntity&&(identical(other.discountRatio, discountRatio) || other.discountRatio == discountRatio)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays)&&(identical(other.unlimited, unlimited) || other.unlimited == unlimited)&&(identical(other.scope, scope) || other.scope == scope)&&const DeepCollectionEquality().equals(other.targetNames, targetNames));
}


@override
int get hashCode => Object.hash(runtimeType,discountRatio,validityDays,unlimited,scope,const DeepCollectionEquality().hash(targetNames));

@override
String toString() {
  return 'GiftCouponEntity(discountRatio: $discountRatio, validityDays: $validityDays, unlimited: $unlimited, scope: $scope, targetNames: $targetNames)';
}


}

/// @nodoc
abstract mixin class $GiftCouponEntityCopyWith<$Res>  {
  factory $GiftCouponEntityCopyWith(GiftCouponEntity value, $Res Function(GiftCouponEntity) _then) = _$GiftCouponEntityCopyWithImpl;
@useResult
$Res call({
 double discountRatio, int? validityDays, bool unlimited, CouponScope scope, List<String> targetNames
});




}
/// @nodoc
class _$GiftCouponEntityCopyWithImpl<$Res>
    implements $GiftCouponEntityCopyWith<$Res> {
  _$GiftCouponEntityCopyWithImpl(this._self, this._then);

  final GiftCouponEntity _self;
  final $Res Function(GiftCouponEntity) _then;

/// Create a copy of GiftCouponEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? discountRatio = null,Object? validityDays = freezed,Object? unlimited = null,Object? scope = null,Object? targetNames = null,}) {
  return _then(_self.copyWith(
discountRatio: null == discountRatio ? _self.discountRatio : discountRatio // ignore: cast_nullable_to_non_nullable
as double,validityDays: freezed == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int?,unlimited: null == unlimited ? _self.unlimited : unlimited // ignore: cast_nullable_to_non_nullable
as bool,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as CouponScope,targetNames: null == targetNames ? _self.targetNames : targetNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftCouponEntity].
extension GiftCouponEntityPatterns on GiftCouponEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftCouponEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftCouponEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftCouponEntity value)  $default,){
final _that = this;
switch (_that) {
case _GiftCouponEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftCouponEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GiftCouponEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double discountRatio,  int? validityDays,  bool unlimited,  CouponScope scope,  List<String> targetNames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftCouponEntity() when $default != null:
return $default(_that.discountRatio,_that.validityDays,_that.unlimited,_that.scope,_that.targetNames);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double discountRatio,  int? validityDays,  bool unlimited,  CouponScope scope,  List<String> targetNames)  $default,) {final _that = this;
switch (_that) {
case _GiftCouponEntity():
return $default(_that.discountRatio,_that.validityDays,_that.unlimited,_that.scope,_that.targetNames);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double discountRatio,  int? validityDays,  bool unlimited,  CouponScope scope,  List<String> targetNames)?  $default,) {final _that = this;
switch (_that) {
case _GiftCouponEntity() when $default != null:
return $default(_that.discountRatio,_that.validityDays,_that.unlimited,_that.scope,_that.targetNames);case _:
  return null;

}
}

}

/// @nodoc


class _GiftCouponEntity extends GiftCouponEntity {
  const _GiftCouponEntity({required this.discountRatio, this.validityDays, this.unlimited = false, this.scope = CouponScope.unknown, final  List<String> targetNames = const <String>[]}): _targetNames = targetNames,super._();
  

/// The discount, in percent.
@override final  double discountRatio;
@override final  int? validityDays;
@override@JsonKey() final  bool unlimited;
@override@JsonKey() final  CouponScope scope;
/// The tickets or promotions it is limited to.
 final  List<String> _targetNames;
/// The tickets or promotions it is limited to.
@override@JsonKey() List<String> get targetNames {
  if (_targetNames is EqualUnmodifiableListView) return _targetNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetNames);
}


/// Create a copy of GiftCouponEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftCouponEntityCopyWith<_GiftCouponEntity> get copyWith => __$GiftCouponEntityCopyWithImpl<_GiftCouponEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftCouponEntity&&(identical(other.discountRatio, discountRatio) || other.discountRatio == discountRatio)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays)&&(identical(other.unlimited, unlimited) || other.unlimited == unlimited)&&(identical(other.scope, scope) || other.scope == scope)&&const DeepCollectionEquality().equals(other._targetNames, _targetNames));
}


@override
int get hashCode => Object.hash(runtimeType,discountRatio,validityDays,unlimited,scope,const DeepCollectionEquality().hash(_targetNames));

@override
String toString() {
  return 'GiftCouponEntity(discountRatio: $discountRatio, validityDays: $validityDays, unlimited: $unlimited, scope: $scope, targetNames: $targetNames)';
}


}

/// @nodoc
abstract mixin class _$GiftCouponEntityCopyWith<$Res> implements $GiftCouponEntityCopyWith<$Res> {
  factory _$GiftCouponEntityCopyWith(_GiftCouponEntity value, $Res Function(_GiftCouponEntity) _then) = __$GiftCouponEntityCopyWithImpl;
@override @useResult
$Res call({
 double discountRatio, int? validityDays, bool unlimited, CouponScope scope, List<String> targetNames
});




}
/// @nodoc
class __$GiftCouponEntityCopyWithImpl<$Res>
    implements _$GiftCouponEntityCopyWith<$Res> {
  __$GiftCouponEntityCopyWithImpl(this._self, this._then);

  final _GiftCouponEntity _self;
  final $Res Function(_GiftCouponEntity) _then;

/// Create a copy of GiftCouponEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? discountRatio = null,Object? validityDays = freezed,Object? unlimited = null,Object? scope = null,Object? targetNames = null,}) {
  return _then(_GiftCouponEntity(
discountRatio: null == discountRatio ? _self.discountRatio : discountRatio // ignore: cast_nullable_to_non_nullable
as double,validityDays: freezed == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int?,unlimited: null == unlimited ? _self.unlimited : unlimited // ignore: cast_nullable_to_non_nullable
as bool,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as CouponScope,targetNames: null == targetNames ? _self._targetNames : targetNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
