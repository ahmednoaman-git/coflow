// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_area_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationAreaEntity {

 int get id; String get name; int? get countryId; int? get cityId; int? get facilityCount;
/// Create a copy of LocationAreaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationAreaEntityCopyWith<LocationAreaEntity> get copyWith => _$LocationAreaEntityCopyWithImpl<LocationAreaEntity>(this as LocationAreaEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationAreaEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.facilityCount, facilityCount) || other.facilityCount == facilityCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,countryId,cityId,facilityCount);

@override
String toString() {
  return 'LocationAreaEntity(id: $id, name: $name, countryId: $countryId, cityId: $cityId, facilityCount: $facilityCount)';
}


}

/// @nodoc
abstract mixin class $LocationAreaEntityCopyWith<$Res>  {
  factory $LocationAreaEntityCopyWith(LocationAreaEntity value, $Res Function(LocationAreaEntity) _then) = _$LocationAreaEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, int? countryId, int? cityId, int? facilityCount
});




}
/// @nodoc
class _$LocationAreaEntityCopyWithImpl<$Res>
    implements $LocationAreaEntityCopyWith<$Res> {
  _$LocationAreaEntityCopyWithImpl(this._self, this._then);

  final LocationAreaEntity _self;
  final $Res Function(LocationAreaEntity) _then;

/// Create a copy of LocationAreaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? countryId = freezed,Object? cityId = freezed,Object? facilityCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,facilityCount: freezed == facilityCount ? _self.facilityCount : facilityCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationAreaEntity].
extension LocationAreaEntityPatterns on LocationAreaEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationAreaEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationAreaEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationAreaEntity value)  $default,){
final _that = this;
switch (_that) {
case _LocationAreaEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationAreaEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LocationAreaEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int? countryId,  int? cityId,  int? facilityCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationAreaEntity() when $default != null:
return $default(_that.id,_that.name,_that.countryId,_that.cityId,_that.facilityCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int? countryId,  int? cityId,  int? facilityCount)  $default,) {final _that = this;
switch (_that) {
case _LocationAreaEntity():
return $default(_that.id,_that.name,_that.countryId,_that.cityId,_that.facilityCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int? countryId,  int? cityId,  int? facilityCount)?  $default,) {final _that = this;
switch (_that) {
case _LocationAreaEntity() when $default != null:
return $default(_that.id,_that.name,_that.countryId,_that.cityId,_that.facilityCount);case _:
  return null;

}
}

}

/// @nodoc


class _LocationAreaEntity implements LocationAreaEntity {
  const _LocationAreaEntity({required this.id, required this.name, this.countryId, this.cityId, this.facilityCount});
  

@override final  int id;
@override final  String name;
@override final  int? countryId;
@override final  int? cityId;
@override final  int? facilityCount;

/// Create a copy of LocationAreaEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationAreaEntityCopyWith<_LocationAreaEntity> get copyWith => __$LocationAreaEntityCopyWithImpl<_LocationAreaEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationAreaEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.facilityCount, facilityCount) || other.facilityCount == facilityCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,countryId,cityId,facilityCount);

@override
String toString() {
  return 'LocationAreaEntity(id: $id, name: $name, countryId: $countryId, cityId: $cityId, facilityCount: $facilityCount)';
}


}

/// @nodoc
abstract mixin class _$LocationAreaEntityCopyWith<$Res> implements $LocationAreaEntityCopyWith<$Res> {
  factory _$LocationAreaEntityCopyWith(_LocationAreaEntity value, $Res Function(_LocationAreaEntity) _then) = __$LocationAreaEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int? countryId, int? cityId, int? facilityCount
});




}
/// @nodoc
class __$LocationAreaEntityCopyWithImpl<$Res>
    implements _$LocationAreaEntityCopyWith<$Res> {
  __$LocationAreaEntityCopyWithImpl(this._self, this._then);

  final _LocationAreaEntity _self;
  final $Res Function(_LocationAreaEntity) _then;

/// Create a copy of LocationAreaEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? countryId = freezed,Object? cityId = freezed,Object? facilityCount = freezed,}) {
  return _then(_LocationAreaEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,facilityCount: freezed == facilityCount ? _self.facilityCount : facilityCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
