// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeRequestDto {

 LocationType? get locationType; int? get cityId; int? get areaId;
/// Create a copy of HomeRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeRequestDtoCopyWith<HomeRequestDto> get copyWith => _$HomeRequestDtoCopyWithImpl<HomeRequestDto>(this as HomeRequestDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeRequestDto&&(identical(other.locationType, locationType) || other.locationType == locationType)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.areaId, areaId) || other.areaId == areaId));
}


@override
int get hashCode => Object.hash(runtimeType,locationType,cityId,areaId);

@override
String toString() {
  return 'HomeRequestDto(locationType: $locationType, cityId: $cityId, areaId: $areaId)';
}


}

/// @nodoc
abstract mixin class $HomeRequestDtoCopyWith<$Res>  {
  factory $HomeRequestDtoCopyWith(HomeRequestDto value, $Res Function(HomeRequestDto) _then) = _$HomeRequestDtoCopyWithImpl;
@useResult
$Res call({
 LocationType? locationType, int? cityId, int? areaId
});




}
/// @nodoc
class _$HomeRequestDtoCopyWithImpl<$Res>
    implements $HomeRequestDtoCopyWith<$Res> {
  _$HomeRequestDtoCopyWithImpl(this._self, this._then);

  final HomeRequestDto _self;
  final $Res Function(HomeRequestDto) _then;

/// Create a copy of HomeRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locationType = freezed,Object? cityId = freezed,Object? areaId = freezed,}) {
  return _then(_self.copyWith(
locationType: freezed == locationType ? _self.locationType : locationType // ignore: cast_nullable_to_non_nullable
as LocationType?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeRequestDto].
extension HomeRequestDtoPatterns on HomeRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LocationType? locationType,  int? cityId,  int? areaId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeRequestDto() when $default != null:
return $default(_that.locationType,_that.cityId,_that.areaId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LocationType? locationType,  int? cityId,  int? areaId)  $default,) {final _that = this;
switch (_that) {
case _HomeRequestDto():
return $default(_that.locationType,_that.cityId,_that.areaId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LocationType? locationType,  int? cityId,  int? areaId)?  $default,) {final _that = this;
switch (_that) {
case _HomeRequestDto() when $default != null:
return $default(_that.locationType,_that.cityId,_that.areaId);case _:
  return null;

}
}

}

/// @nodoc


class _HomeRequestDto implements HomeRequestDto {
  const _HomeRequestDto({this.locationType, this.cityId, this.areaId});
  

@override final  LocationType? locationType;
@override final  int? cityId;
@override final  int? areaId;

/// Create a copy of HomeRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeRequestDtoCopyWith<_HomeRequestDto> get copyWith => __$HomeRequestDtoCopyWithImpl<_HomeRequestDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeRequestDto&&(identical(other.locationType, locationType) || other.locationType == locationType)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.areaId, areaId) || other.areaId == areaId));
}


@override
int get hashCode => Object.hash(runtimeType,locationType,cityId,areaId);

@override
String toString() {
  return 'HomeRequestDto(locationType: $locationType, cityId: $cityId, areaId: $areaId)';
}


}

/// @nodoc
abstract mixin class _$HomeRequestDtoCopyWith<$Res> implements $HomeRequestDtoCopyWith<$Res> {
  factory _$HomeRequestDtoCopyWith(_HomeRequestDto value, $Res Function(_HomeRequestDto) _then) = __$HomeRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 LocationType? locationType, int? cityId, int? areaId
});




}
/// @nodoc
class __$HomeRequestDtoCopyWithImpl<$Res>
    implements _$HomeRequestDtoCopyWith<$Res> {
  __$HomeRequestDtoCopyWithImpl(this._self, this._then);

  final _HomeRequestDto _self;
  final $Res Function(_HomeRequestDto) _then;

/// Create a copy of HomeRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locationType = freezed,Object? cityId = freezed,Object? areaId = freezed,}) {
  return _then(_HomeRequestDto(
locationType: freezed == locationType ? _self.locationType : locationType // ignore: cast_nullable_to_non_nullable
as LocationType?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
