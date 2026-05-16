// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_promotion_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityPromotionDetailsEntity {

 FacilityPromotionEntity get promotion; String get description; String get requirements; String get conditions; bool get unlimited; int? get validityDays;
/// Create a copy of FacilityPromotionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionDetailsEntityCopyWith<FacilityPromotionDetailsEntity> get copyWith => _$FacilityPromotionDetailsEntityCopyWithImpl<FacilityPromotionDetailsEntity>(this as FacilityPromotionDetailsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionDetailsEntity&&(identical(other.promotion, promotion) || other.promotion == promotion)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&(identical(other.unlimited, unlimited) || other.unlimited == unlimited)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays));
}


@override
int get hashCode => Object.hash(runtimeType,promotion,description,requirements,conditions,unlimited,validityDays);

@override
String toString() {
  return 'FacilityPromotionDetailsEntity(promotion: $promotion, description: $description, requirements: $requirements, conditions: $conditions, unlimited: $unlimited, validityDays: $validityDays)';
}


}

/// @nodoc
abstract mixin class $FacilityPromotionDetailsEntityCopyWith<$Res>  {
  factory $FacilityPromotionDetailsEntityCopyWith(FacilityPromotionDetailsEntity value, $Res Function(FacilityPromotionDetailsEntity) _then) = _$FacilityPromotionDetailsEntityCopyWithImpl;
@useResult
$Res call({
 FacilityPromotionEntity promotion, String description, String requirements, String conditions, bool unlimited, int? validityDays
});


$FacilityPromotionEntityCopyWith<$Res> get promotion;

}
/// @nodoc
class _$FacilityPromotionDetailsEntityCopyWithImpl<$Res>
    implements $FacilityPromotionDetailsEntityCopyWith<$Res> {
  _$FacilityPromotionDetailsEntityCopyWithImpl(this._self, this._then);

  final FacilityPromotionDetailsEntity _self;
  final $Res Function(FacilityPromotionDetailsEntity) _then;

/// Create a copy of FacilityPromotionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? promotion = null,Object? description = null,Object? requirements = null,Object? conditions = null,Object? unlimited = null,Object? validityDays = freezed,}) {
  return _then(_self.copyWith(
promotion: null == promotion ? _self.promotion : promotion // ignore: cast_nullable_to_non_nullable
as FacilityPromotionEntity,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String,unlimited: null == unlimited ? _self.unlimited : unlimited // ignore: cast_nullable_to_non_nullable
as bool,validityDays: freezed == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of FacilityPromotionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilityPromotionEntityCopyWith<$Res> get promotion {
  
  return $FacilityPromotionEntityCopyWith<$Res>(_self.promotion, (value) {
    return _then(_self.copyWith(promotion: value));
  });
}
}


/// Adds pattern-matching-related methods to [FacilityPromotionDetailsEntity].
extension FacilityPromotionDetailsEntityPatterns on FacilityPromotionDetailsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityPromotionDetailsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityPromotionDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityPromotionDetailsEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityPromotionDetailsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityPromotionDetailsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityPromotionDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FacilityPromotionEntity promotion,  String description,  String requirements,  String conditions,  bool unlimited,  int? validityDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityPromotionDetailsEntity() when $default != null:
return $default(_that.promotion,_that.description,_that.requirements,_that.conditions,_that.unlimited,_that.validityDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FacilityPromotionEntity promotion,  String description,  String requirements,  String conditions,  bool unlimited,  int? validityDays)  $default,) {final _that = this;
switch (_that) {
case _FacilityPromotionDetailsEntity():
return $default(_that.promotion,_that.description,_that.requirements,_that.conditions,_that.unlimited,_that.validityDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FacilityPromotionEntity promotion,  String description,  String requirements,  String conditions,  bool unlimited,  int? validityDays)?  $default,) {final _that = this;
switch (_that) {
case _FacilityPromotionDetailsEntity() when $default != null:
return $default(_that.promotion,_that.description,_that.requirements,_that.conditions,_that.unlimited,_that.validityDays);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityPromotionDetailsEntity extends FacilityPromotionDetailsEntity {
  const _FacilityPromotionDetailsEntity({required this.promotion, this.description = '', this.requirements = '', this.conditions = '', this.unlimited = false, this.validityDays}): super._();
  

@override final  FacilityPromotionEntity promotion;
@override@JsonKey() final  String description;
@override@JsonKey() final  String requirements;
@override@JsonKey() final  String conditions;
@override@JsonKey() final  bool unlimited;
@override final  int? validityDays;

/// Create a copy of FacilityPromotionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityPromotionDetailsEntityCopyWith<_FacilityPromotionDetailsEntity> get copyWith => __$FacilityPromotionDetailsEntityCopyWithImpl<_FacilityPromotionDetailsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityPromotionDetailsEntity&&(identical(other.promotion, promotion) || other.promotion == promotion)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&(identical(other.unlimited, unlimited) || other.unlimited == unlimited)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays));
}


@override
int get hashCode => Object.hash(runtimeType,promotion,description,requirements,conditions,unlimited,validityDays);

@override
String toString() {
  return 'FacilityPromotionDetailsEntity(promotion: $promotion, description: $description, requirements: $requirements, conditions: $conditions, unlimited: $unlimited, validityDays: $validityDays)';
}


}

/// @nodoc
abstract mixin class _$FacilityPromotionDetailsEntityCopyWith<$Res> implements $FacilityPromotionDetailsEntityCopyWith<$Res> {
  factory _$FacilityPromotionDetailsEntityCopyWith(_FacilityPromotionDetailsEntity value, $Res Function(_FacilityPromotionDetailsEntity) _then) = __$FacilityPromotionDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 FacilityPromotionEntity promotion, String description, String requirements, String conditions, bool unlimited, int? validityDays
});


@override $FacilityPromotionEntityCopyWith<$Res> get promotion;

}
/// @nodoc
class __$FacilityPromotionDetailsEntityCopyWithImpl<$Res>
    implements _$FacilityPromotionDetailsEntityCopyWith<$Res> {
  __$FacilityPromotionDetailsEntityCopyWithImpl(this._self, this._then);

  final _FacilityPromotionDetailsEntity _self;
  final $Res Function(_FacilityPromotionDetailsEntity) _then;

/// Create a copy of FacilityPromotionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? promotion = null,Object? description = null,Object? requirements = null,Object? conditions = null,Object? unlimited = null,Object? validityDays = freezed,}) {
  return _then(_FacilityPromotionDetailsEntity(
promotion: null == promotion ? _self.promotion : promotion // ignore: cast_nullable_to_non_nullable
as FacilityPromotionEntity,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String,unlimited: null == unlimited ? _self.unlimited : unlimited // ignore: cast_nullable_to_non_nullable
as bool,validityDays: freezed == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of FacilityPromotionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilityPromotionEntityCopyWith<$Res> get promotion {
  
  return $FacilityPromotionEntityCopyWith<$Res>(_self.promotion, (value) {
    return _then(_self.copyWith(promotion: value));
  });
}
}

// dart format on
