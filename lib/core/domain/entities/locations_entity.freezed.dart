// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locations_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationsEntity {

 List<LocationCityEntity> get cities; int get remoteCount;
/// Create a copy of LocationsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationsEntityCopyWith<LocationsEntity> get copyWith => _$LocationsEntityCopyWithImpl<LocationsEntity>(this as LocationsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationsEntity&&const DeepCollectionEquality().equals(other.cities, cities)&&(identical(other.remoteCount, remoteCount) || other.remoteCount == remoteCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cities),remoteCount);

@override
String toString() {
  return 'LocationsEntity(cities: $cities, remoteCount: $remoteCount)';
}


}

/// @nodoc
abstract mixin class $LocationsEntityCopyWith<$Res>  {
  factory $LocationsEntityCopyWith(LocationsEntity value, $Res Function(LocationsEntity) _then) = _$LocationsEntityCopyWithImpl;
@useResult
$Res call({
 List<LocationCityEntity> cities, int remoteCount
});




}
/// @nodoc
class _$LocationsEntityCopyWithImpl<$Res>
    implements $LocationsEntityCopyWith<$Res> {
  _$LocationsEntityCopyWithImpl(this._self, this._then);

  final LocationsEntity _self;
  final $Res Function(LocationsEntity) _then;

/// Create a copy of LocationsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cities = null,Object? remoteCount = null,}) {
  return _then(_self.copyWith(
cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<LocationCityEntity>,remoteCount: null == remoteCount ? _self.remoteCount : remoteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationsEntity].
extension LocationsEntityPatterns on LocationsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationsEntity value)  $default,){
final _that = this;
switch (_that) {
case _LocationsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LocationsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LocationCityEntity> cities,  int remoteCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationsEntity() when $default != null:
return $default(_that.cities,_that.remoteCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LocationCityEntity> cities,  int remoteCount)  $default,) {final _that = this;
switch (_that) {
case _LocationsEntity():
return $default(_that.cities,_that.remoteCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LocationCityEntity> cities,  int remoteCount)?  $default,) {final _that = this;
switch (_that) {
case _LocationsEntity() when $default != null:
return $default(_that.cities,_that.remoteCount);case _:
  return null;

}
}

}

/// @nodoc


class _LocationsEntity implements LocationsEntity {
  const _LocationsEntity({required final  List<LocationCityEntity> cities, required this.remoteCount}): _cities = cities;
  

 final  List<LocationCityEntity> _cities;
@override List<LocationCityEntity> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

@override final  int remoteCount;

/// Create a copy of LocationsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationsEntityCopyWith<_LocationsEntity> get copyWith => __$LocationsEntityCopyWithImpl<_LocationsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationsEntity&&const DeepCollectionEquality().equals(other._cities, _cities)&&(identical(other.remoteCount, remoteCount) || other.remoteCount == remoteCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cities),remoteCount);

@override
String toString() {
  return 'LocationsEntity(cities: $cities, remoteCount: $remoteCount)';
}


}

/// @nodoc
abstract mixin class _$LocationsEntityCopyWith<$Res> implements $LocationsEntityCopyWith<$Res> {
  factory _$LocationsEntityCopyWith(_LocationsEntity value, $Res Function(_LocationsEntity) _then) = __$LocationsEntityCopyWithImpl;
@override @useResult
$Res call({
 List<LocationCityEntity> cities, int remoteCount
});




}
/// @nodoc
class __$LocationsEntityCopyWithImpl<$Res>
    implements _$LocationsEntityCopyWith<$Res> {
  __$LocationsEntityCopyWithImpl(this._self, this._then);

  final _LocationsEntity _self;
  final $Res Function(_LocationsEntity) _then;

/// Create a copy of LocationsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cities = null,Object? remoteCount = null,}) {
  return _then(_LocationsEntity(
cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<LocationCityEntity>,remoteCount: null == remoteCount ? _self.remoteCount : remoteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
