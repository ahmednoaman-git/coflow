// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_requests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupportRequestsState {

 AsyncState<PaginatedEntity<SupportRequestEntity>> get requestsRequest; AsyncState<void> get nextPageRequest; AsyncState<void> get createRequest;
/// Create a copy of SupportRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportRequestsStateCopyWith<SupportRequestsState> get copyWith => _$SupportRequestsStateCopyWithImpl<SupportRequestsState>(this as SupportRequestsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportRequestsState&&(identical(other.requestsRequest, requestsRequest) || other.requestsRequest == requestsRequest)&&(identical(other.nextPageRequest, nextPageRequest) || other.nextPageRequest == nextPageRequest)&&(identical(other.createRequest, createRequest) || other.createRequest == createRequest));
}


@override
int get hashCode => Object.hash(runtimeType,requestsRequest,nextPageRequest,createRequest);

@override
String toString() {
  return 'SupportRequestsState(requestsRequest: $requestsRequest, nextPageRequest: $nextPageRequest, createRequest: $createRequest)';
}


}

/// @nodoc
abstract mixin class $SupportRequestsStateCopyWith<$Res>  {
  factory $SupportRequestsStateCopyWith(SupportRequestsState value, $Res Function(SupportRequestsState) _then) = _$SupportRequestsStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<PaginatedEntity<SupportRequestEntity>> requestsRequest, AsyncState<void> nextPageRequest, AsyncState<void> createRequest
});


$AsyncStateCopyWith<PaginatedEntity<SupportRequestEntity>, $Res> get requestsRequest;$AsyncStateCopyWith<void, $Res> get nextPageRequest;$AsyncStateCopyWith<void, $Res> get createRequest;

}
/// @nodoc
class _$SupportRequestsStateCopyWithImpl<$Res>
    implements $SupportRequestsStateCopyWith<$Res> {
  _$SupportRequestsStateCopyWithImpl(this._self, this._then);

  final SupportRequestsState _self;
  final $Res Function(SupportRequestsState) _then;

/// Create a copy of SupportRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestsRequest = null,Object? nextPageRequest = null,Object? createRequest = null,}) {
  return _then(_self.copyWith(
requestsRequest: null == requestsRequest ? _self.requestsRequest : requestsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<PaginatedEntity<SupportRequestEntity>>,nextPageRequest: null == nextPageRequest ? _self.nextPageRequest : nextPageRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,createRequest: null == createRequest ? _self.createRequest : createRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}
/// Create a copy of SupportRequestsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<PaginatedEntity<SupportRequestEntity>, $Res> get requestsRequest {
  
  return $AsyncStateCopyWith<PaginatedEntity<SupportRequestEntity>, $Res>(_self.requestsRequest, (value) {
    return _then(_self.copyWith(requestsRequest: value));
  });
}/// Create a copy of SupportRequestsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get nextPageRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.nextPageRequest, (value) {
    return _then(_self.copyWith(nextPageRequest: value));
  });
}/// Create a copy of SupportRequestsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get createRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.createRequest, (value) {
    return _then(_self.copyWith(createRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [SupportRequestsState].
extension SupportRequestsStatePatterns on SupportRequestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportRequestsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportRequestsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportRequestsState value)  $default,){
final _that = this;
switch (_that) {
case _SupportRequestsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportRequestsState value)?  $default,){
final _that = this;
switch (_that) {
case _SupportRequestsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<PaginatedEntity<SupportRequestEntity>> requestsRequest,  AsyncState<void> nextPageRequest,  AsyncState<void> createRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportRequestsState() when $default != null:
return $default(_that.requestsRequest,_that.nextPageRequest,_that.createRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<PaginatedEntity<SupportRequestEntity>> requestsRequest,  AsyncState<void> nextPageRequest,  AsyncState<void> createRequest)  $default,) {final _that = this;
switch (_that) {
case _SupportRequestsState():
return $default(_that.requestsRequest,_that.nextPageRequest,_that.createRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<PaginatedEntity<SupportRequestEntity>> requestsRequest,  AsyncState<void> nextPageRequest,  AsyncState<void> createRequest)?  $default,) {final _that = this;
switch (_that) {
case _SupportRequestsState() when $default != null:
return $default(_that.requestsRequest,_that.nextPageRequest,_that.createRequest);case _:
  return null;

}
}

}

/// @nodoc


class _SupportRequestsState implements SupportRequestsState {
  const _SupportRequestsState({this.requestsRequest = const AsyncState.idle(), this.nextPageRequest = const AsyncState.idle(), this.createRequest = const AsyncState.idle()});
  

@override@JsonKey() final  AsyncState<PaginatedEntity<SupportRequestEntity>> requestsRequest;
@override@JsonKey() final  AsyncState<void> nextPageRequest;
@override@JsonKey() final  AsyncState<void> createRequest;

/// Create a copy of SupportRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportRequestsStateCopyWith<_SupportRequestsState> get copyWith => __$SupportRequestsStateCopyWithImpl<_SupportRequestsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportRequestsState&&(identical(other.requestsRequest, requestsRequest) || other.requestsRequest == requestsRequest)&&(identical(other.nextPageRequest, nextPageRequest) || other.nextPageRequest == nextPageRequest)&&(identical(other.createRequest, createRequest) || other.createRequest == createRequest));
}


@override
int get hashCode => Object.hash(runtimeType,requestsRequest,nextPageRequest,createRequest);

@override
String toString() {
  return 'SupportRequestsState(requestsRequest: $requestsRequest, nextPageRequest: $nextPageRequest, createRequest: $createRequest)';
}


}

/// @nodoc
abstract mixin class _$SupportRequestsStateCopyWith<$Res> implements $SupportRequestsStateCopyWith<$Res> {
  factory _$SupportRequestsStateCopyWith(_SupportRequestsState value, $Res Function(_SupportRequestsState) _then) = __$SupportRequestsStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<PaginatedEntity<SupportRequestEntity>> requestsRequest, AsyncState<void> nextPageRequest, AsyncState<void> createRequest
});


@override $AsyncStateCopyWith<PaginatedEntity<SupportRequestEntity>, $Res> get requestsRequest;@override $AsyncStateCopyWith<void, $Res> get nextPageRequest;@override $AsyncStateCopyWith<void, $Res> get createRequest;

}
/// @nodoc
class __$SupportRequestsStateCopyWithImpl<$Res>
    implements _$SupportRequestsStateCopyWith<$Res> {
  __$SupportRequestsStateCopyWithImpl(this._self, this._then);

  final _SupportRequestsState _self;
  final $Res Function(_SupportRequestsState) _then;

/// Create a copy of SupportRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestsRequest = null,Object? nextPageRequest = null,Object? createRequest = null,}) {
  return _then(_SupportRequestsState(
requestsRequest: null == requestsRequest ? _self.requestsRequest : requestsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<PaginatedEntity<SupportRequestEntity>>,nextPageRequest: null == nextPageRequest ? _self.nextPageRequest : nextPageRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,createRequest: null == createRequest ? _self.createRequest : createRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of SupportRequestsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<PaginatedEntity<SupportRequestEntity>, $Res> get requestsRequest {
  
  return $AsyncStateCopyWith<PaginatedEntity<SupportRequestEntity>, $Res>(_self.requestsRequest, (value) {
    return _then(_self.copyWith(requestsRequest: value));
  });
}/// Create a copy of SupportRequestsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get nextPageRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.nextPageRequest, (value) {
    return _then(_self.copyWith(nextPageRequest: value));
  });
}/// Create a copy of SupportRequestsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get createRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.createRequest, (value) {
    return _then(_self.copyWith(createRequest: value));
  });
}
}

// dart format on
