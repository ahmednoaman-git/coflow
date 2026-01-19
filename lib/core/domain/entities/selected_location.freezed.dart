// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectedLocation {

 int? get cityId; String? get cityName; int? get areaId; String? get areaName; bool get isRemote;
/// Create a copy of SelectedLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedLocationCopyWith<SelectedLocation> get copyWith => _$SelectedLocationCopyWithImpl<SelectedLocation>(this as SelectedLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedLocation&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.isRemote, isRemote) || other.isRemote == isRemote));
}


@override
int get hashCode => Object.hash(runtimeType,cityId,cityName,areaId,areaName,isRemote);

@override
String toString() {
  return 'SelectedLocation(cityId: $cityId, cityName: $cityName, areaId: $areaId, areaName: $areaName, isRemote: $isRemote)';
}


}

/// @nodoc
abstract mixin class $SelectedLocationCopyWith<$Res>  {
  factory $SelectedLocationCopyWith(SelectedLocation value, $Res Function(SelectedLocation) _then) = _$SelectedLocationCopyWithImpl;
@useResult
$Res call({
 int? cityId, String? cityName, int? areaId, String? areaName, bool isRemote
});




}
/// @nodoc
class _$SelectedLocationCopyWithImpl<$Res>
    implements $SelectedLocationCopyWith<$Res> {
  _$SelectedLocationCopyWithImpl(this._self, this._then);

  final SelectedLocation _self;
  final $Res Function(SelectedLocation) _then;

/// Create a copy of SelectedLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cityId = freezed,Object? cityName = freezed,Object? areaId = freezed,Object? areaName = freezed,Object? isRemote = null,}) {
  return _then(_self.copyWith(
cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as int?,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,isRemote: null == isRemote ? _self.isRemote : isRemote // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectedLocation].
extension SelectedLocationPatterns on SelectedLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectedLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectedLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectedLocation value)  $default,){
final _that = this;
switch (_that) {
case _SelectedLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectedLocation value)?  $default,){
final _that = this;
switch (_that) {
case _SelectedLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? cityId,  String? cityName,  int? areaId,  String? areaName,  bool isRemote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectedLocation() when $default != null:
return $default(_that.cityId,_that.cityName,_that.areaId,_that.areaName,_that.isRemote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? cityId,  String? cityName,  int? areaId,  String? areaName,  bool isRemote)  $default,) {final _that = this;
switch (_that) {
case _SelectedLocation():
return $default(_that.cityId,_that.cityName,_that.areaId,_that.areaName,_that.isRemote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? cityId,  String? cityName,  int? areaId,  String? areaName,  bool isRemote)?  $default,) {final _that = this;
switch (_that) {
case _SelectedLocation() when $default != null:
return $default(_that.cityId,_that.cityName,_that.areaId,_that.areaName,_that.isRemote);case _:
  return null;

}
}

}

/// @nodoc


class _SelectedLocation extends SelectedLocation {
  const _SelectedLocation({this.cityId, this.cityName, this.areaId, this.areaName, this.isRemote = false}): super._();
  

@override final  int? cityId;
@override final  String? cityName;
@override final  int? areaId;
@override final  String? areaName;
@override@JsonKey() final  bool isRemote;

/// Create a copy of SelectedLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedLocationCopyWith<_SelectedLocation> get copyWith => __$SelectedLocationCopyWithImpl<_SelectedLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedLocation&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.isRemote, isRemote) || other.isRemote == isRemote));
}


@override
int get hashCode => Object.hash(runtimeType,cityId,cityName,areaId,areaName,isRemote);

@override
String toString() {
  return 'SelectedLocation(cityId: $cityId, cityName: $cityName, areaId: $areaId, areaName: $areaName, isRemote: $isRemote)';
}


}

/// @nodoc
abstract mixin class _$SelectedLocationCopyWith<$Res> implements $SelectedLocationCopyWith<$Res> {
  factory _$SelectedLocationCopyWith(_SelectedLocation value, $Res Function(_SelectedLocation) _then) = __$SelectedLocationCopyWithImpl;
@override @useResult
$Res call({
 int? cityId, String? cityName, int? areaId, String? areaName, bool isRemote
});




}
/// @nodoc
class __$SelectedLocationCopyWithImpl<$Res>
    implements _$SelectedLocationCopyWith<$Res> {
  __$SelectedLocationCopyWithImpl(this._self, this._then);

  final _SelectedLocation _self;
  final $Res Function(_SelectedLocation) _then;

/// Create a copy of SelectedLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cityId = freezed,Object? cityName = freezed,Object? areaId = freezed,Object? areaName = freezed,Object? isRemote = null,}) {
  return _then(_SelectedLocation(
cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as int?,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,isRemote: null == isRemote ? _self.isRemote : isRemote // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
