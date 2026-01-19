// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locations_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationsResponseModel {

 List<CityModel> get cities; int get remote;
/// Create a copy of LocationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationsResponseModelCopyWith<LocationsResponseModel> get copyWith => _$LocationsResponseModelCopyWithImpl<LocationsResponseModel>(this as LocationsResponseModel, _$identity);

  /// Serializes this LocationsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationsResponseModel&&const DeepCollectionEquality().equals(other.cities, cities)&&(identical(other.remote, remote) || other.remote == remote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cities),remote);

@override
String toString() {
  return 'LocationsResponseModel(cities: $cities, remote: $remote)';
}


}

/// @nodoc
abstract mixin class $LocationsResponseModelCopyWith<$Res>  {
  factory $LocationsResponseModelCopyWith(LocationsResponseModel value, $Res Function(LocationsResponseModel) _then) = _$LocationsResponseModelCopyWithImpl;
@useResult
$Res call({
 List<CityModel> cities, int remote
});




}
/// @nodoc
class _$LocationsResponseModelCopyWithImpl<$Res>
    implements $LocationsResponseModelCopyWith<$Res> {
  _$LocationsResponseModelCopyWithImpl(this._self, this._then);

  final LocationsResponseModel _self;
  final $Res Function(LocationsResponseModel) _then;

/// Create a copy of LocationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cities = null,Object? remote = null,}) {
  return _then(_self.copyWith(
cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,remote: null == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationsResponseModel].
extension LocationsResponseModelPatterns on LocationsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _LocationsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocationsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CityModel> cities,  int remote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationsResponseModel() when $default != null:
return $default(_that.cities,_that.remote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CityModel> cities,  int remote)  $default,) {final _that = this;
switch (_that) {
case _LocationsResponseModel():
return $default(_that.cities,_that.remote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CityModel> cities,  int remote)?  $default,) {final _that = this;
switch (_that) {
case _LocationsResponseModel() when $default != null:
return $default(_that.cities,_that.remote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationsResponseModel implements LocationsResponseModel {
  const _LocationsResponseModel({required final  List<CityModel> cities, required this.remote}): _cities = cities;
  factory _LocationsResponseModel.fromJson(Map<String, dynamic> json) => _$LocationsResponseModelFromJson(json);

 final  List<CityModel> _cities;
@override List<CityModel> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

@override final  int remote;

/// Create a copy of LocationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationsResponseModelCopyWith<_LocationsResponseModel> get copyWith => __$LocationsResponseModelCopyWithImpl<_LocationsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationsResponseModel&&const DeepCollectionEquality().equals(other._cities, _cities)&&(identical(other.remote, remote) || other.remote == remote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cities),remote);

@override
String toString() {
  return 'LocationsResponseModel(cities: $cities, remote: $remote)';
}


}

/// @nodoc
abstract mixin class _$LocationsResponseModelCopyWith<$Res> implements $LocationsResponseModelCopyWith<$Res> {
  factory _$LocationsResponseModelCopyWith(_LocationsResponseModel value, $Res Function(_LocationsResponseModel) _then) = __$LocationsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<CityModel> cities, int remote
});




}
/// @nodoc
class __$LocationsResponseModelCopyWithImpl<$Res>
    implements _$LocationsResponseModelCopyWith<$Res> {
  __$LocationsResponseModelCopyWithImpl(this._self, this._then);

  final _LocationsResponseModel _self;
  final $Res Function(_LocationsResponseModel) _then;

/// Create a copy of LocationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cities = null,Object? remote = null,}) {
  return _then(_LocationsResponseModel(
cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,remote: null == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CityModel {

 int get id; String get name;@JsonKey(name: 'country_id') int? get countryId; int? get count; List<AreaModel>? get areas;
/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityModelCopyWith<CityModel> get copyWith => _$CityModelCopyWithImpl<CityModel>(this as CityModel, _$identity);

  /// Serializes this CityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.areas, areas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,countryId,count,const DeepCollectionEquality().hash(areas));

@override
String toString() {
  return 'CityModel(id: $id, name: $name, countryId: $countryId, count: $count, areas: $areas)';
}


}

/// @nodoc
abstract mixin class $CityModelCopyWith<$Res>  {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) _then) = _$CityModelCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'country_id') int? countryId, int? count, List<AreaModel>? areas
});




}
/// @nodoc
class _$CityModelCopyWithImpl<$Res>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._self, this._then);

  final CityModel _self;
  final $Res Function(CityModel) _then;

/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? countryId = freezed,Object? count = freezed,Object? areas = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,areas: freezed == areas ? _self.areas : areas // ignore: cast_nullable_to_non_nullable
as List<AreaModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CityModel].
extension CityModelPatterns on CityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityModel value)  $default,){
final _that = this;
switch (_that) {
case _CityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityModel value)?  $default,){
final _that = this;
switch (_that) {
case _CityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'country_id')  int? countryId,  int? count,  List<AreaModel>? areas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityModel() when $default != null:
return $default(_that.id,_that.name,_that.countryId,_that.count,_that.areas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'country_id')  int? countryId,  int? count,  List<AreaModel>? areas)  $default,) {final _that = this;
switch (_that) {
case _CityModel():
return $default(_that.id,_that.name,_that.countryId,_that.count,_that.areas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'country_id')  int? countryId,  int? count,  List<AreaModel>? areas)?  $default,) {final _that = this;
switch (_that) {
case _CityModel() when $default != null:
return $default(_that.id,_that.name,_that.countryId,_that.count,_that.areas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CityModel implements CityModel {
  const _CityModel({required this.id, required this.name, @JsonKey(name: 'country_id') this.countryId, this.count, final  List<AreaModel>? areas}): _areas = areas;
  factory _CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'country_id') final  int? countryId;
@override final  int? count;
 final  List<AreaModel>? _areas;
@override List<AreaModel>? get areas {
  final value = _areas;
  if (value == null) return null;
  if (_areas is EqualUnmodifiableListView) return _areas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityModelCopyWith<_CityModel> get copyWith => __$CityModelCopyWithImpl<_CityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other._areas, _areas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,countryId,count,const DeepCollectionEquality().hash(_areas));

@override
String toString() {
  return 'CityModel(id: $id, name: $name, countryId: $countryId, count: $count, areas: $areas)';
}


}

/// @nodoc
abstract mixin class _$CityModelCopyWith<$Res> implements $CityModelCopyWith<$Res> {
  factory _$CityModelCopyWith(_CityModel value, $Res Function(_CityModel) _then) = __$CityModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'country_id') int? countryId, int? count, List<AreaModel>? areas
});




}
/// @nodoc
class __$CityModelCopyWithImpl<$Res>
    implements _$CityModelCopyWith<$Res> {
  __$CityModelCopyWithImpl(this._self, this._then);

  final _CityModel _self;
  final $Res Function(_CityModel) _then;

/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? countryId = freezed,Object? count = freezed,Object? areas = freezed,}) {
  return _then(_CityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,areas: freezed == areas ? _self._areas : areas // ignore: cast_nullable_to_non_nullable
as List<AreaModel>?,
  ));
}


}


/// @nodoc
mixin _$AreaModel {

 int get id; String get name;@JsonKey(name: 'country_id') int? get countryId;@JsonKey(name: 'city_id') int? get cityId; int? get count;
/// Create a copy of AreaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AreaModelCopyWith<AreaModel> get copyWith => _$AreaModelCopyWithImpl<AreaModel>(this as AreaModel, _$identity);

  /// Serializes this AreaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AreaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,countryId,cityId,count);

@override
String toString() {
  return 'AreaModel(id: $id, name: $name, countryId: $countryId, cityId: $cityId, count: $count)';
}


}

/// @nodoc
abstract mixin class $AreaModelCopyWith<$Res>  {
  factory $AreaModelCopyWith(AreaModel value, $Res Function(AreaModel) _then) = _$AreaModelCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'city_id') int? cityId, int? count
});




}
/// @nodoc
class _$AreaModelCopyWithImpl<$Res>
    implements $AreaModelCopyWith<$Res> {
  _$AreaModelCopyWithImpl(this._self, this._then);

  final AreaModel _self;
  final $Res Function(AreaModel) _then;

/// Create a copy of AreaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? countryId = freezed,Object? cityId = freezed,Object? count = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AreaModel].
extension AreaModelPatterns on AreaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AreaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AreaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AreaModel value)  $default,){
final _that = this;
switch (_that) {
case _AreaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AreaModel value)?  $default,){
final _that = this;
switch (_that) {
case _AreaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'city_id')  int? cityId,  int? count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AreaModel() when $default != null:
return $default(_that.id,_that.name,_that.countryId,_that.cityId,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'city_id')  int? cityId,  int? count)  $default,) {final _that = this;
switch (_that) {
case _AreaModel():
return $default(_that.id,_that.name,_that.countryId,_that.cityId,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'country_id')  int? countryId, @JsonKey(name: 'city_id')  int? cityId,  int? count)?  $default,) {final _that = this;
switch (_that) {
case _AreaModel() when $default != null:
return $default(_that.id,_that.name,_that.countryId,_that.cityId,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AreaModel implements AreaModel {
  const _AreaModel({required this.id, required this.name, @JsonKey(name: 'country_id') this.countryId, @JsonKey(name: 'city_id') this.cityId, this.count});
  factory _AreaModel.fromJson(Map<String, dynamic> json) => _$AreaModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'country_id') final  int? countryId;
@override@JsonKey(name: 'city_id') final  int? cityId;
@override final  int? count;

/// Create a copy of AreaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AreaModelCopyWith<_AreaModel> get copyWith => __$AreaModelCopyWithImpl<_AreaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AreaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AreaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,countryId,cityId,count);

@override
String toString() {
  return 'AreaModel(id: $id, name: $name, countryId: $countryId, cityId: $cityId, count: $count)';
}


}

/// @nodoc
abstract mixin class _$AreaModelCopyWith<$Res> implements $AreaModelCopyWith<$Res> {
  factory _$AreaModelCopyWith(_AreaModel value, $Res Function(_AreaModel) _then) = __$AreaModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'country_id') int? countryId,@JsonKey(name: 'city_id') int? cityId, int? count
});




}
/// @nodoc
class __$AreaModelCopyWithImpl<$Res>
    implements _$AreaModelCopyWith<$Res> {
  __$AreaModelCopyWithImpl(this._self, this._then);

  final _AreaModel _self;
  final $Res Function(_AreaModel) _then;

/// Create a copy of AreaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? countryId = freezed,Object? cityId = freezed,Object? count = freezed,}) {
  return _then(_AreaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
