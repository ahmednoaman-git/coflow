// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CityEntity {

 int get id; String get name; int? get countryId;
/// Create a copy of CityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityEntityCopyWith<CityEntity> get copyWith => _$CityEntityCopyWithImpl<CityEntity>(this as CityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,countryId);

@override
String toString() {
  return 'CityEntity(id: $id, name: $name, countryId: $countryId)';
}


}

/// @nodoc
abstract mixin class $CityEntityCopyWith<$Res>  {
  factory $CityEntityCopyWith(CityEntity value, $Res Function(CityEntity) _then) = _$CityEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, int? countryId
});




}
/// @nodoc
class _$CityEntityCopyWithImpl<$Res>
    implements $CityEntityCopyWith<$Res> {
  _$CityEntityCopyWithImpl(this._self, this._then);

  final CityEntity _self;
  final $Res Function(CityEntity) _then;

/// Create a copy of CityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? countryId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CityEntity].
extension CityEntityPatterns on CityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityEntity value)  $default,){
final _that = this;
switch (_that) {
case _CityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int? countryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityEntity() when $default != null:
return $default(_that.id,_that.name,_that.countryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int? countryId)  $default,) {final _that = this;
switch (_that) {
case _CityEntity():
return $default(_that.id,_that.name,_that.countryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int? countryId)?  $default,) {final _that = this;
switch (_that) {
case _CityEntity() when $default != null:
return $default(_that.id,_that.name,_that.countryId);case _:
  return null;

}
}

}

/// @nodoc


class _CityEntity implements CityEntity {
  const _CityEntity({required this.id, required this.name, this.countryId});
  

@override final  int id;
@override final  String name;
@override final  int? countryId;

/// Create a copy of CityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityEntityCopyWith<_CityEntity> get copyWith => __$CityEntityCopyWithImpl<_CityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,countryId);

@override
String toString() {
  return 'CityEntity(id: $id, name: $name, countryId: $countryId)';
}


}

/// @nodoc
abstract mixin class _$CityEntityCopyWith<$Res> implements $CityEntityCopyWith<$Res> {
  factory _$CityEntityCopyWith(_CityEntity value, $Res Function(_CityEntity) _then) = __$CityEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int? countryId
});




}
/// @nodoc
class __$CityEntityCopyWithImpl<$Res>
    implements _$CityEntityCopyWith<$Res> {
  __$CityEntityCopyWithImpl(this._self, this._then);

  final _CityEntity _self;
  final $Res Function(_CityEntity) _then;

/// Create a copy of CityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? countryId = freezed,}) {
  return _then(_CityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
