// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionDetailsState {

/// The listing entry the sheet was opened from — renders the header before
/// the details land.
 FacilitySessionEntity get session; AsyncState<FacilitySessionDetailsEntity> get detailsRequest; AsyncState<FacilitySessionDetailsEntity> get actionRequest;
/// Create a copy of SessionDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionDetailsStateCopyWith<SessionDetailsState> get copyWith => _$SessionDetailsStateCopyWithImpl<SessionDetailsState>(this as SessionDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDetailsState&&(identical(other.session, session) || other.session == session)&&(identical(other.detailsRequest, detailsRequest) || other.detailsRequest == detailsRequest)&&(identical(other.actionRequest, actionRequest) || other.actionRequest == actionRequest));
}


@override
int get hashCode => Object.hash(runtimeType,session,detailsRequest,actionRequest);

@override
String toString() {
  return 'SessionDetailsState(session: $session, detailsRequest: $detailsRequest, actionRequest: $actionRequest)';
}


}

/// @nodoc
abstract mixin class $SessionDetailsStateCopyWith<$Res>  {
  factory $SessionDetailsStateCopyWith(SessionDetailsState value, $Res Function(SessionDetailsState) _then) = _$SessionDetailsStateCopyWithImpl;
@useResult
$Res call({
 FacilitySessionEntity session, AsyncState<FacilitySessionDetailsEntity> detailsRequest, AsyncState<FacilitySessionDetailsEntity> actionRequest
});


$FacilitySessionEntityCopyWith<$Res> get session;$AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res> get detailsRequest;$AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res> get actionRequest;

}
/// @nodoc
class _$SessionDetailsStateCopyWithImpl<$Res>
    implements $SessionDetailsStateCopyWith<$Res> {
  _$SessionDetailsStateCopyWithImpl(this._self, this._then);

  final SessionDetailsState _self;
  final $Res Function(SessionDetailsState) _then;

/// Create a copy of SessionDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? detailsRequest = null,Object? actionRequest = null,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as FacilitySessionEntity,detailsRequest: null == detailsRequest ? _self.detailsRequest : detailsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilitySessionDetailsEntity>,actionRequest: null == actionRequest ? _self.actionRequest : actionRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilitySessionDetailsEntity>,
  ));
}
/// Create a copy of SessionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilitySessionEntityCopyWith<$Res> get session {
  
  return $FacilitySessionEntityCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of SessionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res> get detailsRequest {
  
  return $AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res>(_self.detailsRequest, (value) {
    return _then(_self.copyWith(detailsRequest: value));
  });
}/// Create a copy of SessionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res> get actionRequest {
  
  return $AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res>(_self.actionRequest, (value) {
    return _then(_self.copyWith(actionRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionDetailsState].
extension SessionDetailsStatePatterns on SessionDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _SessionDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _SessionDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FacilitySessionEntity session,  AsyncState<FacilitySessionDetailsEntity> detailsRequest,  AsyncState<FacilitySessionDetailsEntity> actionRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionDetailsState() when $default != null:
return $default(_that.session,_that.detailsRequest,_that.actionRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FacilitySessionEntity session,  AsyncState<FacilitySessionDetailsEntity> detailsRequest,  AsyncState<FacilitySessionDetailsEntity> actionRequest)  $default,) {final _that = this;
switch (_that) {
case _SessionDetailsState():
return $default(_that.session,_that.detailsRequest,_that.actionRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FacilitySessionEntity session,  AsyncState<FacilitySessionDetailsEntity> detailsRequest,  AsyncState<FacilitySessionDetailsEntity> actionRequest)?  $default,) {final _that = this;
switch (_that) {
case _SessionDetailsState() when $default != null:
return $default(_that.session,_that.detailsRequest,_that.actionRequest);case _:
  return null;

}
}

}

/// @nodoc


class _SessionDetailsState extends SessionDetailsState {
  const _SessionDetailsState({required this.session, this.detailsRequest = const AsyncState.idle(), this.actionRequest = const AsyncState.idle()}): super._();
  

/// The listing entry the sheet was opened from — renders the header before
/// the details land.
@override final  FacilitySessionEntity session;
@override@JsonKey() final  AsyncState<FacilitySessionDetailsEntity> detailsRequest;
@override@JsonKey() final  AsyncState<FacilitySessionDetailsEntity> actionRequest;

/// Create a copy of SessionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionDetailsStateCopyWith<_SessionDetailsState> get copyWith => __$SessionDetailsStateCopyWithImpl<_SessionDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionDetailsState&&(identical(other.session, session) || other.session == session)&&(identical(other.detailsRequest, detailsRequest) || other.detailsRequest == detailsRequest)&&(identical(other.actionRequest, actionRequest) || other.actionRequest == actionRequest));
}


@override
int get hashCode => Object.hash(runtimeType,session,detailsRequest,actionRequest);

@override
String toString() {
  return 'SessionDetailsState(session: $session, detailsRequest: $detailsRequest, actionRequest: $actionRequest)';
}


}

/// @nodoc
abstract mixin class _$SessionDetailsStateCopyWith<$Res> implements $SessionDetailsStateCopyWith<$Res> {
  factory _$SessionDetailsStateCopyWith(_SessionDetailsState value, $Res Function(_SessionDetailsState) _then) = __$SessionDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 FacilitySessionEntity session, AsyncState<FacilitySessionDetailsEntity> detailsRequest, AsyncState<FacilitySessionDetailsEntity> actionRequest
});


@override $FacilitySessionEntityCopyWith<$Res> get session;@override $AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res> get detailsRequest;@override $AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res> get actionRequest;

}
/// @nodoc
class __$SessionDetailsStateCopyWithImpl<$Res>
    implements _$SessionDetailsStateCopyWith<$Res> {
  __$SessionDetailsStateCopyWithImpl(this._self, this._then);

  final _SessionDetailsState _self;
  final $Res Function(_SessionDetailsState) _then;

/// Create a copy of SessionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? detailsRequest = null,Object? actionRequest = null,}) {
  return _then(_SessionDetailsState(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as FacilitySessionEntity,detailsRequest: null == detailsRequest ? _self.detailsRequest : detailsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilitySessionDetailsEntity>,actionRequest: null == actionRequest ? _self.actionRequest : actionRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilitySessionDetailsEntity>,
  ));
}

/// Create a copy of SessionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilitySessionEntityCopyWith<$Res> get session {
  
  return $FacilitySessionEntityCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of SessionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res> get detailsRequest {
  
  return $AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res>(_self.detailsRequest, (value) {
    return _then(_self.copyWith(detailsRequest: value));
  });
}/// Create a copy of SessionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res> get actionRequest {
  
  return $AsyncStateCopyWith<FacilitySessionDetailsEntity, $Res>(_self.actionRequest, (value) {
    return _then(_self.copyWith(actionRequest: value));
  });
}
}

// dart format on
