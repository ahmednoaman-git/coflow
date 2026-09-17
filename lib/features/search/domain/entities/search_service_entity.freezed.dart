// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_service_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchServiceEntity {

 CollapsedFacilityServiceEntity get service; CollapsedFacilityEntity get facility;/// Null when the payload reports a listing type the app does not model.
 FacilityServiceType? get type;
/// Create a copy of SearchServiceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchServiceEntityCopyWith<SearchServiceEntity> get copyWith => _$SearchServiceEntityCopyWithImpl<SearchServiceEntity>(this as SearchServiceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchServiceEntity&&(identical(other.service, service) || other.service == service)&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,service,facility,type);

@override
String toString() {
  return 'SearchServiceEntity(service: $service, facility: $facility, type: $type)';
}


}

/// @nodoc
abstract mixin class $SearchServiceEntityCopyWith<$Res>  {
  factory $SearchServiceEntityCopyWith(SearchServiceEntity value, $Res Function(SearchServiceEntity) _then) = _$SearchServiceEntityCopyWithImpl;
@useResult
$Res call({
 CollapsedFacilityServiceEntity service, CollapsedFacilityEntity facility, FacilityServiceType? type
});


$CollapsedFacilityServiceEntityCopyWith<$Res> get service;$CollapsedFacilityEntityCopyWith<$Res> get facility;

}
/// @nodoc
class _$SearchServiceEntityCopyWithImpl<$Res>
    implements $SearchServiceEntityCopyWith<$Res> {
  _$SearchServiceEntityCopyWithImpl(this._self, this._then);

  final SearchServiceEntity _self;
  final $Res Function(SearchServiceEntity) _then;

/// Create a copy of SearchServiceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? service = null,Object? facility = null,Object? type = freezed,}) {
  return _then(_self.copyWith(
service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityServiceEntity,facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FacilityServiceType?,
  ));
}
/// Create a copy of SearchServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityServiceEntityCopyWith<$Res> get service {
  
  return $CollapsedFacilityServiceEntityCopyWith<$Res>(_self.service, (value) {
    return _then(_self.copyWith(service: value));
  });
}/// Create a copy of SearchServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res> get facility {
  
  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchServiceEntity].
extension SearchServiceEntityPatterns on SearchServiceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchServiceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchServiceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchServiceEntity value)  $default,){
final _that = this;
switch (_that) {
case _SearchServiceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchServiceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SearchServiceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CollapsedFacilityServiceEntity service,  CollapsedFacilityEntity facility,  FacilityServiceType? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchServiceEntity() when $default != null:
return $default(_that.service,_that.facility,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CollapsedFacilityServiceEntity service,  CollapsedFacilityEntity facility,  FacilityServiceType? type)  $default,) {final _that = this;
switch (_that) {
case _SearchServiceEntity():
return $default(_that.service,_that.facility,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CollapsedFacilityServiceEntity service,  CollapsedFacilityEntity facility,  FacilityServiceType? type)?  $default,) {final _that = this;
switch (_that) {
case _SearchServiceEntity() when $default != null:
return $default(_that.service,_that.facility,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _SearchServiceEntity implements SearchServiceEntity {
  const _SearchServiceEntity({required this.service, required this.facility, this.type});
  

@override final  CollapsedFacilityServiceEntity service;
@override final  CollapsedFacilityEntity facility;
/// Null when the payload reports a listing type the app does not model.
@override final  FacilityServiceType? type;

/// Create a copy of SearchServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchServiceEntityCopyWith<_SearchServiceEntity> get copyWith => __$SearchServiceEntityCopyWithImpl<_SearchServiceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchServiceEntity&&(identical(other.service, service) || other.service == service)&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,service,facility,type);

@override
String toString() {
  return 'SearchServiceEntity(service: $service, facility: $facility, type: $type)';
}


}

/// @nodoc
abstract mixin class _$SearchServiceEntityCopyWith<$Res> implements $SearchServiceEntityCopyWith<$Res> {
  factory _$SearchServiceEntityCopyWith(_SearchServiceEntity value, $Res Function(_SearchServiceEntity) _then) = __$SearchServiceEntityCopyWithImpl;
@override @useResult
$Res call({
 CollapsedFacilityServiceEntity service, CollapsedFacilityEntity facility, FacilityServiceType? type
});


@override $CollapsedFacilityServiceEntityCopyWith<$Res> get service;@override $CollapsedFacilityEntityCopyWith<$Res> get facility;

}
/// @nodoc
class __$SearchServiceEntityCopyWithImpl<$Res>
    implements _$SearchServiceEntityCopyWith<$Res> {
  __$SearchServiceEntityCopyWithImpl(this._self, this._then);

  final _SearchServiceEntity _self;
  final $Res Function(_SearchServiceEntity) _then;

/// Create a copy of SearchServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? service = null,Object? facility = null,Object? type = freezed,}) {
  return _then(_SearchServiceEntity(
service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityServiceEntity,facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FacilityServiceType?,
  ));
}

/// Create a copy of SearchServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityServiceEntityCopyWith<$Res> get service {
  
  return $CollapsedFacilityServiceEntityCopyWith<$Res>(_self.service, (value) {
    return _then(_self.copyWith(service: value));
  });
}/// Create a copy of SearchServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res> get facility {
  
  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}
}

// dart format on
