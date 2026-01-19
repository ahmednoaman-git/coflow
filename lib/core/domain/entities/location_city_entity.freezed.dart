// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_city_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationCityEntity {

 int get id; String get name; int? get countryId; int? get facilityCount; List<LocationAreaEntity>? get areas;
/// Create a copy of LocationCityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationCityEntityCopyWith<LocationCityEntity> get copyWith => _$LocationCityEntityCopyWithImpl<LocationCityEntity>(this as LocationCityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationCityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.facilityCount, facilityCount) || other.facilityCount == facilityCount)&&const DeepCollectionEquality().equals(other.areas, areas));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,countryId,facilityCount,const DeepCollectionEquality().hash(areas));

@override
String toString() {
  return 'LocationCityEntity(id: $id, name: $name, countryId: $countryId, facilityCount: $facilityCount, areas: $areas)';
}


}

/// @nodoc
abstract mixin class $LocationCityEntityCopyWith<$Res>  {
  factory $LocationCityEntityCopyWith(LocationCityEntity value, $Res Function(LocationCityEntity) _then) = _$LocationCityEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, int? countryId, int? facilityCount, List<LocationAreaEntity>? areas
});




}
/// @nodoc
class _$LocationCityEntityCopyWithImpl<$Res>
    implements $LocationCityEntityCopyWith<$Res> {
  _$LocationCityEntityCopyWithImpl(this._self, this._then);

  final LocationCityEntity _self;
  final $Res Function(LocationCityEntity) _then;

/// Create a copy of LocationCityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? countryId = freezed,Object? facilityCount = freezed,Object? areas = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,facilityCount: freezed == facilityCount ? _self.facilityCount : facilityCount // ignore: cast_nullable_to_non_nullable
as int?,areas: freezed == areas ? _self.areas : areas // ignore: cast_nullable_to_non_nullable
as List<LocationAreaEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationCityEntity].
extension LocationCityEntityPatterns on LocationCityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationCityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationCityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationCityEntity value)  $default,){
final _that = this;
switch (_that) {
case _LocationCityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationCityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LocationCityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int? countryId,  int? facilityCount,  List<LocationAreaEntity>? areas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationCityEntity() when $default != null:
return $default(_that.id,_that.name,_that.countryId,_that.facilityCount,_that.areas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int? countryId,  int? facilityCount,  List<LocationAreaEntity>? areas)  $default,) {final _that = this;
switch (_that) {
case _LocationCityEntity():
return $default(_that.id,_that.name,_that.countryId,_that.facilityCount,_that.areas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int? countryId,  int? facilityCount,  List<LocationAreaEntity>? areas)?  $default,) {final _that = this;
switch (_that) {
case _LocationCityEntity() when $default != null:
return $default(_that.id,_that.name,_that.countryId,_that.facilityCount,_that.areas);case _:
  return null;

}
}

}

/// @nodoc


class _LocationCityEntity implements LocationCityEntity {
  const _LocationCityEntity({required this.id, required this.name, this.countryId, this.facilityCount, final  List<LocationAreaEntity>? areas}): _areas = areas;
  

@override final  int id;
@override final  String name;
@override final  int? countryId;
@override final  int? facilityCount;
 final  List<LocationAreaEntity>? _areas;
@override List<LocationAreaEntity>? get areas {
  final value = _areas;
  if (value == null) return null;
  if (_areas is EqualUnmodifiableListView) return _areas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LocationCityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCityEntityCopyWith<_LocationCityEntity> get copyWith => __$LocationCityEntityCopyWithImpl<_LocationCityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationCityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.facilityCount, facilityCount) || other.facilityCount == facilityCount)&&const DeepCollectionEquality().equals(other._areas, _areas));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,countryId,facilityCount,const DeepCollectionEquality().hash(_areas));

@override
String toString() {
  return 'LocationCityEntity(id: $id, name: $name, countryId: $countryId, facilityCount: $facilityCount, areas: $areas)';
}


}

/// @nodoc
abstract mixin class _$LocationCityEntityCopyWith<$Res> implements $LocationCityEntityCopyWith<$Res> {
  factory _$LocationCityEntityCopyWith(_LocationCityEntity value, $Res Function(_LocationCityEntity) _then) = __$LocationCityEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int? countryId, int? facilityCount, List<LocationAreaEntity>? areas
});




}
/// @nodoc
class __$LocationCityEntityCopyWithImpl<$Res>
    implements _$LocationCityEntityCopyWith<$Res> {
  __$LocationCityEntityCopyWithImpl(this._self, this._then);

  final _LocationCityEntity _self;
  final $Res Function(_LocationCityEntity) _then;

/// Create a copy of LocationCityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? countryId = freezed,Object? facilityCount = freezed,Object? areas = freezed,}) {
  return _then(_LocationCityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,facilityCount: freezed == facilityCount ? _self.facilityCount : facilityCount // ignore: cast_nullable_to_non_nullable
as int?,areas: freezed == areas ? _self._areas : areas // ignore: cast_nullable_to_non_nullable
as List<LocationAreaEntity>?,
  ));
}


}

// dart format on
