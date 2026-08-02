// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceDetailsState {

 int get serviceId; FacilityServiceType get type; AsyncState<FacilityServiceDetailsEntity> get detailsRequest;
/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDetailsStateCopyWith<ServiceDetailsState> get copyWith => _$ServiceDetailsStateCopyWithImpl<ServiceDetailsState>(this as ServiceDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsState&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.type, type) || other.type == type)&&(identical(other.detailsRequest, detailsRequest) || other.detailsRequest == detailsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId,type,detailsRequest);

@override
String toString() {
  return 'ServiceDetailsState(serviceId: $serviceId, type: $type, detailsRequest: $detailsRequest)';
}


}

/// @nodoc
abstract mixin class $ServiceDetailsStateCopyWith<$Res>  {
  factory $ServiceDetailsStateCopyWith(ServiceDetailsState value, $Res Function(ServiceDetailsState) _then) = _$ServiceDetailsStateCopyWithImpl;
@useResult
$Res call({
 int serviceId, FacilityServiceType type, AsyncState<FacilityServiceDetailsEntity> detailsRequest
});


$AsyncStateCopyWith<FacilityServiceDetailsEntity, $Res> get detailsRequest;

}
/// @nodoc
class _$ServiceDetailsStateCopyWithImpl<$Res>
    implements $ServiceDetailsStateCopyWith<$Res> {
  _$ServiceDetailsStateCopyWithImpl(this._self, this._then);

  final ServiceDetailsState _self;
  final $Res Function(ServiceDetailsState) _then;

/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceId = null,Object? type = null,Object? detailsRequest = null,}) {
  return _then(_self.copyWith(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FacilityServiceType,detailsRequest: null == detailsRequest ? _self.detailsRequest : detailsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilityServiceDetailsEntity>,
  ));
}
/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilityServiceDetailsEntity, $Res> get detailsRequest {
  
  return $AsyncStateCopyWith<FacilityServiceDetailsEntity, $Res>(_self.detailsRequest, (value) {
    return _then(_self.copyWith(detailsRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServiceDetailsState].
extension ServiceDetailsStatePatterns on ServiceDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _ServiceDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int serviceId,  FacilityServiceType type,  AsyncState<FacilityServiceDetailsEntity> detailsRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceDetailsState() when $default != null:
return $default(_that.serviceId,_that.type,_that.detailsRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int serviceId,  FacilityServiceType type,  AsyncState<FacilityServiceDetailsEntity> detailsRequest)  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailsState():
return $default(_that.serviceId,_that.type,_that.detailsRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int serviceId,  FacilityServiceType type,  AsyncState<FacilityServiceDetailsEntity> detailsRequest)?  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailsState() when $default != null:
return $default(_that.serviceId,_that.type,_that.detailsRequest);case _:
  return null;

}
}

}

/// @nodoc


class _ServiceDetailsState implements ServiceDetailsState {
  const _ServiceDetailsState({required this.serviceId, required this.type, this.detailsRequest = const AsyncState.idle()});
  

@override final  int serviceId;
@override final  FacilityServiceType type;
@override@JsonKey() final  AsyncState<FacilityServiceDetailsEntity> detailsRequest;

/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceDetailsStateCopyWith<_ServiceDetailsState> get copyWith => __$ServiceDetailsStateCopyWithImpl<_ServiceDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceDetailsState&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.type, type) || other.type == type)&&(identical(other.detailsRequest, detailsRequest) || other.detailsRequest == detailsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId,type,detailsRequest);

@override
String toString() {
  return 'ServiceDetailsState(serviceId: $serviceId, type: $type, detailsRequest: $detailsRequest)';
}


}

/// @nodoc
abstract mixin class _$ServiceDetailsStateCopyWith<$Res> implements $ServiceDetailsStateCopyWith<$Res> {
  factory _$ServiceDetailsStateCopyWith(_ServiceDetailsState value, $Res Function(_ServiceDetailsState) _then) = __$ServiceDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 int serviceId, FacilityServiceType type, AsyncState<FacilityServiceDetailsEntity> detailsRequest
});


@override $AsyncStateCopyWith<FacilityServiceDetailsEntity, $Res> get detailsRequest;

}
/// @nodoc
class __$ServiceDetailsStateCopyWithImpl<$Res>
    implements _$ServiceDetailsStateCopyWith<$Res> {
  __$ServiceDetailsStateCopyWithImpl(this._self, this._then);

  final _ServiceDetailsState _self;
  final $Res Function(_ServiceDetailsState) _then;

/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceId = null,Object? type = null,Object? detailsRequest = null,}) {
  return _then(_ServiceDetailsState(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FacilityServiceType,detailsRequest: null == detailsRequest ? _self.detailsRequest : detailsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilityServiceDetailsEntity>,
  ));
}

/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilityServiceDetailsEntity, $Res> get detailsRequest {
  
  return $AsyncStateCopyWith<FacilityServiceDetailsEntity, $Res>(_self.detailsRequest, (value) {
    return _then(_self.copyWith(detailsRequest: value));
  });
}
}

// dart format on
