// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_location_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityPhoneEntity {

 String get number;/// `Mobile`, `Landline`, ... — absent when the backend did not label it.
 String? get label;
/// Create a copy of FacilityPhoneEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityPhoneEntityCopyWith<FacilityPhoneEntity> get copyWith => _$FacilityPhoneEntityCopyWithImpl<FacilityPhoneEntity>(this as FacilityPhoneEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityPhoneEntity&&(identical(other.number, number) || other.number == number)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,number,label);

@override
String toString() {
  return 'FacilityPhoneEntity(number: $number, label: $label)';
}


}

/// @nodoc
abstract mixin class $FacilityPhoneEntityCopyWith<$Res>  {
  factory $FacilityPhoneEntityCopyWith(FacilityPhoneEntity value, $Res Function(FacilityPhoneEntity) _then) = _$FacilityPhoneEntityCopyWithImpl;
@useResult
$Res call({
 String number, String? label
});




}
/// @nodoc
class _$FacilityPhoneEntityCopyWithImpl<$Res>
    implements $FacilityPhoneEntityCopyWith<$Res> {
  _$FacilityPhoneEntityCopyWithImpl(this._self, this._then);

  final FacilityPhoneEntity _self;
  final $Res Function(FacilityPhoneEntity) _then;

/// Create a copy of FacilityPhoneEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? label = freezed,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityPhoneEntity].
extension FacilityPhoneEntityPatterns on FacilityPhoneEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityPhoneEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityPhoneEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityPhoneEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityPhoneEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityPhoneEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityPhoneEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  String? label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityPhoneEntity() when $default != null:
return $default(_that.number,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  String? label)  $default,) {final _that = this;
switch (_that) {
case _FacilityPhoneEntity():
return $default(_that.number,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  String? label)?  $default,) {final _that = this;
switch (_that) {
case _FacilityPhoneEntity() when $default != null:
return $default(_that.number,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityPhoneEntity implements FacilityPhoneEntity {
  const _FacilityPhoneEntity({required this.number, this.label});
  

@override final  String number;
/// `Mobile`, `Landline`, ... — absent when the backend did not label it.
@override final  String? label;

/// Create a copy of FacilityPhoneEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityPhoneEntityCopyWith<_FacilityPhoneEntity> get copyWith => __$FacilityPhoneEntityCopyWithImpl<_FacilityPhoneEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityPhoneEntity&&(identical(other.number, number) || other.number == number)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,number,label);

@override
String toString() {
  return 'FacilityPhoneEntity(number: $number, label: $label)';
}


}

/// @nodoc
abstract mixin class _$FacilityPhoneEntityCopyWith<$Res> implements $FacilityPhoneEntityCopyWith<$Res> {
  factory _$FacilityPhoneEntityCopyWith(_FacilityPhoneEntity value, $Res Function(_FacilityPhoneEntity) _then) = __$FacilityPhoneEntityCopyWithImpl;
@override @useResult
$Res call({
 String number, String? label
});




}
/// @nodoc
class __$FacilityPhoneEntityCopyWithImpl<$Res>
    implements _$FacilityPhoneEntityCopyWith<$Res> {
  __$FacilityPhoneEntityCopyWithImpl(this._self, this._then);

  final _FacilityPhoneEntity _self;
  final $Res Function(_FacilityPhoneEntity) _then;

/// Create a copy of FacilityPhoneEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? label = freezed,}) {
  return _then(_FacilityPhoneEntity(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$FacilityCoverageEntity {

/// The city the areas belong to, or the country when the facility covers
/// a whole country.
 String get label;/// Named areas inside [label]. Empty when [coversAll] is true.
 List<String> get areas;/// The facility serves all of [label] rather than specific areas.
 bool get coversAll;
/// Create a copy of FacilityCoverageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityCoverageEntityCopyWith<FacilityCoverageEntity> get copyWith => _$FacilityCoverageEntityCopyWithImpl<FacilityCoverageEntity>(this as FacilityCoverageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityCoverageEntity&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.areas, areas)&&(identical(other.coversAll, coversAll) || other.coversAll == coversAll));
}


@override
int get hashCode => Object.hash(runtimeType,label,const DeepCollectionEquality().hash(areas),coversAll);

@override
String toString() {
  return 'FacilityCoverageEntity(label: $label, areas: $areas, coversAll: $coversAll)';
}


}

/// @nodoc
abstract mixin class $FacilityCoverageEntityCopyWith<$Res>  {
  factory $FacilityCoverageEntityCopyWith(FacilityCoverageEntity value, $Res Function(FacilityCoverageEntity) _then) = _$FacilityCoverageEntityCopyWithImpl;
@useResult
$Res call({
 String label, List<String> areas, bool coversAll
});




}
/// @nodoc
class _$FacilityCoverageEntityCopyWithImpl<$Res>
    implements $FacilityCoverageEntityCopyWith<$Res> {
  _$FacilityCoverageEntityCopyWithImpl(this._self, this._then);

  final FacilityCoverageEntity _self;
  final $Res Function(FacilityCoverageEntity) _then;

/// Create a copy of FacilityCoverageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? areas = null,Object? coversAll = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,areas: null == areas ? _self.areas : areas // ignore: cast_nullable_to_non_nullable
as List<String>,coversAll: null == coversAll ? _self.coversAll : coversAll // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityCoverageEntity].
extension FacilityCoverageEntityPatterns on FacilityCoverageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityCoverageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityCoverageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityCoverageEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityCoverageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityCoverageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityCoverageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  List<String> areas,  bool coversAll)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityCoverageEntity() when $default != null:
return $default(_that.label,_that.areas,_that.coversAll);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  List<String> areas,  bool coversAll)  $default,) {final _that = this;
switch (_that) {
case _FacilityCoverageEntity():
return $default(_that.label,_that.areas,_that.coversAll);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  List<String> areas,  bool coversAll)?  $default,) {final _that = this;
switch (_that) {
case _FacilityCoverageEntity() when $default != null:
return $default(_that.label,_that.areas,_that.coversAll);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityCoverageEntity implements FacilityCoverageEntity {
  const _FacilityCoverageEntity({required this.label, final  List<String> areas = const <String>[], this.coversAll = false}): _areas = areas;
  

/// The city the areas belong to, or the country when the facility covers
/// a whole country.
@override final  String label;
/// Named areas inside [label]. Empty when [coversAll] is true.
 final  List<String> _areas;
/// Named areas inside [label]. Empty when [coversAll] is true.
@override@JsonKey() List<String> get areas {
  if (_areas is EqualUnmodifiableListView) return _areas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_areas);
}

/// The facility serves all of [label] rather than specific areas.
@override@JsonKey() final  bool coversAll;

/// Create a copy of FacilityCoverageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityCoverageEntityCopyWith<_FacilityCoverageEntity> get copyWith => __$FacilityCoverageEntityCopyWithImpl<_FacilityCoverageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityCoverageEntity&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other._areas, _areas)&&(identical(other.coversAll, coversAll) || other.coversAll == coversAll));
}


@override
int get hashCode => Object.hash(runtimeType,label,const DeepCollectionEquality().hash(_areas),coversAll);

@override
String toString() {
  return 'FacilityCoverageEntity(label: $label, areas: $areas, coversAll: $coversAll)';
}


}

/// @nodoc
abstract mixin class _$FacilityCoverageEntityCopyWith<$Res> implements $FacilityCoverageEntityCopyWith<$Res> {
  factory _$FacilityCoverageEntityCopyWith(_FacilityCoverageEntity value, $Res Function(_FacilityCoverageEntity) _then) = __$FacilityCoverageEntityCopyWithImpl;
@override @useResult
$Res call({
 String label, List<String> areas, bool coversAll
});




}
/// @nodoc
class __$FacilityCoverageEntityCopyWithImpl<$Res>
    implements _$FacilityCoverageEntityCopyWith<$Res> {
  __$FacilityCoverageEntityCopyWithImpl(this._self, this._then);

  final _FacilityCoverageEntity _self;
  final $Res Function(_FacilityCoverageEntity) _then;

/// Create a copy of FacilityCoverageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? areas = null,Object? coversAll = null,}) {
  return _then(_FacilityCoverageEntity(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,areas: null == areas ? _self._areas : areas // ignore: cast_nullable_to_non_nullable
as List<String>,coversAll: null == coversAll ? _self.coversAll : coversAll // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$FacilityLocationEntity {

/// The externally shareable maps link the facility saved.
 String? get mapUrl;
/// Create a copy of FacilityLocationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityLocationEntityCopyWith<FacilityLocationEntity> get copyWith => _$FacilityLocationEntityCopyWithImpl<FacilityLocationEntity>(this as FacilityLocationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityLocationEntity&&(identical(other.mapUrl, mapUrl) || other.mapUrl == mapUrl));
}


@override
int get hashCode => Object.hash(runtimeType,mapUrl);

@override
String toString() {
  return 'FacilityLocationEntity(mapUrl: $mapUrl)';
}


}

/// @nodoc
abstract mixin class $FacilityLocationEntityCopyWith<$Res>  {
  factory $FacilityLocationEntityCopyWith(FacilityLocationEntity value, $Res Function(FacilityLocationEntity) _then) = _$FacilityLocationEntityCopyWithImpl;
@useResult
$Res call({
 String? mapUrl
});




}
/// @nodoc
class _$FacilityLocationEntityCopyWithImpl<$Res>
    implements $FacilityLocationEntityCopyWith<$Res> {
  _$FacilityLocationEntityCopyWithImpl(this._self, this._then);

  final FacilityLocationEntity _self;
  final $Res Function(FacilityLocationEntity) _then;

/// Create a copy of FacilityLocationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mapUrl = freezed,}) {
  return _then(_self.copyWith(
mapUrl: freezed == mapUrl ? _self.mapUrl : mapUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityLocationEntity].
extension FacilityLocationEntityPatterns on FacilityLocationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FacilityAddressLocation value)?  address,TResult Function( FacilityRemoteLocation value)?  remote,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FacilityAddressLocation() when address != null:
return address(_that);case FacilityRemoteLocation() when remote != null:
return remote(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FacilityAddressLocation value)  address,required TResult Function( FacilityRemoteLocation value)  remote,}){
final _that = this;
switch (_that) {
case FacilityAddressLocation():
return address(_that);case FacilityRemoteLocation():
return remote(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FacilityAddressLocation value)?  address,TResult? Function( FacilityRemoteLocation value)?  remote,}){
final _that = this;
switch (_that) {
case FacilityAddressLocation() when address != null:
return address(_that);case FacilityRemoteLocation() when remote != null:
return remote(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? addressLine,  String? areaName,  String? cityName,  String? countryName,  double? latitude,  double? longitude,  String? mapUrl,  List<FacilityPhoneEntity> phones)?  address,TResult Function( List<FacilityCoverageEntity> coverage,  String? mapUrl)?  remote,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FacilityAddressLocation() when address != null:
return address(_that.addressLine,_that.areaName,_that.cityName,_that.countryName,_that.latitude,_that.longitude,_that.mapUrl,_that.phones);case FacilityRemoteLocation() when remote != null:
return remote(_that.coverage,_that.mapUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? addressLine,  String? areaName,  String? cityName,  String? countryName,  double? latitude,  double? longitude,  String? mapUrl,  List<FacilityPhoneEntity> phones)  address,required TResult Function( List<FacilityCoverageEntity> coverage,  String? mapUrl)  remote,}) {final _that = this;
switch (_that) {
case FacilityAddressLocation():
return address(_that.addressLine,_that.areaName,_that.cityName,_that.countryName,_that.latitude,_that.longitude,_that.mapUrl,_that.phones);case FacilityRemoteLocation():
return remote(_that.coverage,_that.mapUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? addressLine,  String? areaName,  String? cityName,  String? countryName,  double? latitude,  double? longitude,  String? mapUrl,  List<FacilityPhoneEntity> phones)?  address,TResult? Function( List<FacilityCoverageEntity> coverage,  String? mapUrl)?  remote,}) {final _that = this;
switch (_that) {
case FacilityAddressLocation() when address != null:
return address(_that.addressLine,_that.areaName,_that.cityName,_that.countryName,_that.latitude,_that.longitude,_that.mapUrl,_that.phones);case FacilityRemoteLocation() when remote != null:
return remote(_that.coverage,_that.mapUrl);case _:
  return null;

}
}

}

/// @nodoc


class FacilityAddressLocation extends FacilityLocationEntity {
  const FacilityAddressLocation({this.addressLine, this.areaName, this.cityName, this.countryName, this.latitude, this.longitude, this.mapUrl, final  List<FacilityPhoneEntity> phones = const <FacilityPhoneEntity>[]}): _phones = phones,super._();
  

 final  String? addressLine;
 final  String? areaName;
 final  String? cityName;
 final  String? countryName;
 final  double? latitude;
 final  double? longitude;
/// The externally shareable maps link the facility saved.
@override final  String? mapUrl;
 final  List<FacilityPhoneEntity> _phones;
@JsonKey() List<FacilityPhoneEntity> get phones {
  if (_phones is EqualUnmodifiableListView) return _phones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phones);
}


/// Create a copy of FacilityLocationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityAddressLocationCopyWith<FacilityAddressLocation> get copyWith => _$FacilityAddressLocationCopyWithImpl<FacilityAddressLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityAddressLocation&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.mapUrl, mapUrl) || other.mapUrl == mapUrl)&&const DeepCollectionEquality().equals(other._phones, _phones));
}


@override
int get hashCode => Object.hash(runtimeType,addressLine,areaName,cityName,countryName,latitude,longitude,mapUrl,const DeepCollectionEquality().hash(_phones));

@override
String toString() {
  return 'FacilityLocationEntity.address(addressLine: $addressLine, areaName: $areaName, cityName: $cityName, countryName: $countryName, latitude: $latitude, longitude: $longitude, mapUrl: $mapUrl, phones: $phones)';
}


}

/// @nodoc
abstract mixin class $FacilityAddressLocationCopyWith<$Res> implements $FacilityLocationEntityCopyWith<$Res> {
  factory $FacilityAddressLocationCopyWith(FacilityAddressLocation value, $Res Function(FacilityAddressLocation) _then) = _$FacilityAddressLocationCopyWithImpl;
@override @useResult
$Res call({
 String? addressLine, String? areaName, String? cityName, String? countryName, double? latitude, double? longitude, String? mapUrl, List<FacilityPhoneEntity> phones
});




}
/// @nodoc
class _$FacilityAddressLocationCopyWithImpl<$Res>
    implements $FacilityAddressLocationCopyWith<$Res> {
  _$FacilityAddressLocationCopyWithImpl(this._self, this._then);

  final FacilityAddressLocation _self;
  final $Res Function(FacilityAddressLocation) _then;

/// Create a copy of FacilityLocationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addressLine = freezed,Object? areaName = freezed,Object? cityName = freezed,Object? countryName = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? mapUrl = freezed,Object? phones = null,}) {
  return _then(FacilityAddressLocation(
addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,countryName: freezed == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,mapUrl: freezed == mapUrl ? _self.mapUrl : mapUrl // ignore: cast_nullable_to_non_nullable
as String?,phones: null == phones ? _self._phones : phones // ignore: cast_nullable_to_non_nullable
as List<FacilityPhoneEntity>,
  ));
}


}

/// @nodoc


class FacilityRemoteLocation extends FacilityLocationEntity {
  const FacilityRemoteLocation({final  List<FacilityCoverageEntity> coverage = const <FacilityCoverageEntity>[], this.mapUrl}): _coverage = coverage,super._();
  

 final  List<FacilityCoverageEntity> _coverage;
@JsonKey() List<FacilityCoverageEntity> get coverage {
  if (_coverage is EqualUnmodifiableListView) return _coverage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coverage);
}

/// Some remote facilities still publish a link (a booking page, a pinned
/// meeting point); shown as the same "Link" affordance.
@override final  String? mapUrl;

/// Create a copy of FacilityLocationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityRemoteLocationCopyWith<FacilityRemoteLocation> get copyWith => _$FacilityRemoteLocationCopyWithImpl<FacilityRemoteLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityRemoteLocation&&const DeepCollectionEquality().equals(other._coverage, _coverage)&&(identical(other.mapUrl, mapUrl) || other.mapUrl == mapUrl));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_coverage),mapUrl);

@override
String toString() {
  return 'FacilityLocationEntity.remote(coverage: $coverage, mapUrl: $mapUrl)';
}


}

/// @nodoc
abstract mixin class $FacilityRemoteLocationCopyWith<$Res> implements $FacilityLocationEntityCopyWith<$Res> {
  factory $FacilityRemoteLocationCopyWith(FacilityRemoteLocation value, $Res Function(FacilityRemoteLocation) _then) = _$FacilityRemoteLocationCopyWithImpl;
@override @useResult
$Res call({
 List<FacilityCoverageEntity> coverage, String? mapUrl
});




}
/// @nodoc
class _$FacilityRemoteLocationCopyWithImpl<$Res>
    implements $FacilityRemoteLocationCopyWith<$Res> {
  _$FacilityRemoteLocationCopyWithImpl(this._self, this._then);

  final FacilityRemoteLocation _self;
  final $Res Function(FacilityRemoteLocation) _then;

/// Create a copy of FacilityLocationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coverage = null,Object? mapUrl = freezed,}) {
  return _then(FacilityRemoteLocation(
coverage: null == coverage ? _self._coverage : coverage // ignore: cast_nullable_to_non_nullable
as List<FacilityCoverageEntity>,mapUrl: freezed == mapUrl ? _self.mapUrl : mapUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
