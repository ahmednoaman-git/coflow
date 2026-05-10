// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_promotion_ticket_line_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityPromotionTicketLineEntity {

 String get name; int? get count; bool get unlimited;
/// Create a copy of FacilityPromotionTicketLineEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPromotionTicketLineEntityCopyWith<FacilityPromotionTicketLineEntity> get copyWith => _$FacilityPromotionTicketLineEntityCopyWithImpl<FacilityPromotionTicketLineEntity>(this as FacilityPromotionTicketLineEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPromotionTicketLineEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.count, count) || other.count == count)&&(identical(other.unlimited, unlimited) || other.unlimited == unlimited));
}


@override
int get hashCode => Object.hash(runtimeType,name,count,unlimited);

@override
String toString() {
  return 'FacilityPromotionTicketLineEntity(name: $name, count: $count, unlimited: $unlimited)';
}


}

/// @nodoc
abstract mixin class $FacilityPromotionTicketLineEntityCopyWith<$Res>  {
  factory $FacilityPromotionTicketLineEntityCopyWith(FacilityPromotionTicketLineEntity value, $Res Function(FacilityPromotionTicketLineEntity) _then) = _$FacilityPromotionTicketLineEntityCopyWithImpl;
@useResult
$Res call({
 String name, int? count, bool unlimited
});




}
/// @nodoc
class _$FacilityPromotionTicketLineEntityCopyWithImpl<$Res>
    implements $FacilityPromotionTicketLineEntityCopyWith<$Res> {
  _$FacilityPromotionTicketLineEntityCopyWithImpl(this._self, this._then);

  final FacilityPromotionTicketLineEntity _self;
  final $Res Function(FacilityPromotionTicketLineEntity) _then;

/// Create a copy of FacilityPromotionTicketLineEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? count = freezed,Object? unlimited = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,unlimited: null == unlimited ? _self.unlimited : unlimited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityPromotionTicketLineEntity].
extension FacilityPromotionTicketLineEntityPatterns on FacilityPromotionTicketLineEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityPromotionTicketLineEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityPromotionTicketLineEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityPromotionTicketLineEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityPromotionTicketLineEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityPromotionTicketLineEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityPromotionTicketLineEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int? count,  bool unlimited)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityPromotionTicketLineEntity() when $default != null:
return $default(_that.name,_that.count,_that.unlimited);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int? count,  bool unlimited)  $default,) {final _that = this;
switch (_that) {
case _FacilityPromotionTicketLineEntity():
return $default(_that.name,_that.count,_that.unlimited);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int? count,  bool unlimited)?  $default,) {final _that = this;
switch (_that) {
case _FacilityPromotionTicketLineEntity() when $default != null:
return $default(_that.name,_that.count,_that.unlimited);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityPromotionTicketLineEntity extends FacilityPromotionTicketLineEntity {
  const _FacilityPromotionTicketLineEntity({required this.name, this.count, this.unlimited = false}): super._();
  

@override final  String name;
@override final  int? count;
@override@JsonKey() final  bool unlimited;

/// Create a copy of FacilityPromotionTicketLineEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityPromotionTicketLineEntityCopyWith<_FacilityPromotionTicketLineEntity> get copyWith => __$FacilityPromotionTicketLineEntityCopyWithImpl<_FacilityPromotionTicketLineEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityPromotionTicketLineEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.count, count) || other.count == count)&&(identical(other.unlimited, unlimited) || other.unlimited == unlimited));
}


@override
int get hashCode => Object.hash(runtimeType,name,count,unlimited);

@override
String toString() {
  return 'FacilityPromotionTicketLineEntity(name: $name, count: $count, unlimited: $unlimited)';
}


}

/// @nodoc
abstract mixin class _$FacilityPromotionTicketLineEntityCopyWith<$Res> implements $FacilityPromotionTicketLineEntityCopyWith<$Res> {
  factory _$FacilityPromotionTicketLineEntityCopyWith(_FacilityPromotionTicketLineEntity value, $Res Function(_FacilityPromotionTicketLineEntity) _then) = __$FacilityPromotionTicketLineEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, int? count, bool unlimited
});




}
/// @nodoc
class __$FacilityPromotionTicketLineEntityCopyWithImpl<$Res>
    implements _$FacilityPromotionTicketLineEntityCopyWith<$Res> {
  __$FacilityPromotionTicketLineEntityCopyWithImpl(this._self, this._then);

  final _FacilityPromotionTicketLineEntity _self;
  final $Res Function(_FacilityPromotionTicketLineEntity) _then;

/// Create a copy of FacilityPromotionTicketLineEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? count = freezed,Object? unlimited = null,}) {
  return _then(_FacilityPromotionTicketLineEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,unlimited: null == unlimited ? _self.unlimited : unlimited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
