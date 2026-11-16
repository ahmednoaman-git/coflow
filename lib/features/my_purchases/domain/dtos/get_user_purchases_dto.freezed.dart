// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_purchases_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetUserPurchasesDto {

 UserPurchaseCategory get category; UserPurchasePeriod get period;
/// Create a copy of GetUserPurchasesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetUserPurchasesDtoCopyWith<GetUserPurchasesDto> get copyWith => _$GetUserPurchasesDtoCopyWithImpl<GetUserPurchasesDto>(this as GetUserPurchasesDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetUserPurchasesDto&&(identical(other.category, category) || other.category == category)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,category,period);

@override
String toString() {
  return 'GetUserPurchasesDto(category: $category, period: $period)';
}


}

/// @nodoc
abstract mixin class $GetUserPurchasesDtoCopyWith<$Res>  {
  factory $GetUserPurchasesDtoCopyWith(GetUserPurchasesDto value, $Res Function(GetUserPurchasesDto) _then) = _$GetUserPurchasesDtoCopyWithImpl;
@useResult
$Res call({
 UserPurchaseCategory category, UserPurchasePeriod period
});




}
/// @nodoc
class _$GetUserPurchasesDtoCopyWithImpl<$Res>
    implements $GetUserPurchasesDtoCopyWith<$Res> {
  _$GetUserPurchasesDtoCopyWithImpl(this._self, this._then);

  final GetUserPurchasesDto _self;
  final $Res Function(GetUserPurchasesDto) _then;

/// Create a copy of GetUserPurchasesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? period = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as UserPurchaseCategory,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as UserPurchasePeriod,
  ));
}

}


/// Adds pattern-matching-related methods to [GetUserPurchasesDto].
extension GetUserPurchasesDtoPatterns on GetUserPurchasesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetUserPurchasesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetUserPurchasesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetUserPurchasesDto value)  $default,){
final _that = this;
switch (_that) {
case _GetUserPurchasesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetUserPurchasesDto value)?  $default,){
final _that = this;
switch (_that) {
case _GetUserPurchasesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserPurchaseCategory category,  UserPurchasePeriod period)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetUserPurchasesDto() when $default != null:
return $default(_that.category,_that.period);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserPurchaseCategory category,  UserPurchasePeriod period)  $default,) {final _that = this;
switch (_that) {
case _GetUserPurchasesDto():
return $default(_that.category,_that.period);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserPurchaseCategory category,  UserPurchasePeriod period)?  $default,) {final _that = this;
switch (_that) {
case _GetUserPurchasesDto() when $default != null:
return $default(_that.category,_that.period);case _:
  return null;

}
}

}

/// @nodoc


class _GetUserPurchasesDto implements GetUserPurchasesDto {
  const _GetUserPurchasesDto({required this.category, required this.period});
  

@override final  UserPurchaseCategory category;
@override final  UserPurchasePeriod period;

/// Create a copy of GetUserPurchasesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetUserPurchasesDtoCopyWith<_GetUserPurchasesDto> get copyWith => __$GetUserPurchasesDtoCopyWithImpl<_GetUserPurchasesDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUserPurchasesDto&&(identical(other.category, category) || other.category == category)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,category,period);

@override
String toString() {
  return 'GetUserPurchasesDto(category: $category, period: $period)';
}


}

/// @nodoc
abstract mixin class _$GetUserPurchasesDtoCopyWith<$Res> implements $GetUserPurchasesDtoCopyWith<$Res> {
  factory _$GetUserPurchasesDtoCopyWith(_GetUserPurchasesDto value, $Res Function(_GetUserPurchasesDto) _then) = __$GetUserPurchasesDtoCopyWithImpl;
@override @useResult
$Res call({
 UserPurchaseCategory category, UserPurchasePeriod period
});




}
/// @nodoc
class __$GetUserPurchasesDtoCopyWithImpl<$Res>
    implements _$GetUserPurchasesDtoCopyWith<$Res> {
  __$GetUserPurchasesDtoCopyWithImpl(this._self, this._then);

  final _GetUserPurchasesDto _self;
  final $Res Function(_GetUserPurchasesDto) _then;

/// Create a copy of GetUserPurchasesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? period = null,}) {
  return _then(_GetUserPurchasesDto(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as UserPurchaseCategory,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as UserPurchasePeriod,
  ));
}


}

// dart format on
