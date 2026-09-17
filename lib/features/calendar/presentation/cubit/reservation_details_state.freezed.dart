// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReservationDetailsState {

/// The listing entry the sheet was opened from — what the details and
/// withdrawal requests are keyed on.
 ReservationEntity get reservation; AsyncState<ReservationDetailsEntity> get detailsRequest; AsyncState<ReservationDetailsEntity> get actionRequest;
/// Create a copy of ReservationDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationDetailsStateCopyWith<ReservationDetailsState> get copyWith => _$ReservationDetailsStateCopyWithImpl<ReservationDetailsState>(this as ReservationDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationDetailsState&&(identical(other.reservation, reservation) || other.reservation == reservation)&&(identical(other.detailsRequest, detailsRequest) || other.detailsRequest == detailsRequest)&&(identical(other.actionRequest, actionRequest) || other.actionRequest == actionRequest));
}


@override
int get hashCode => Object.hash(runtimeType,reservation,detailsRequest,actionRequest);

@override
String toString() {
  return 'ReservationDetailsState(reservation: $reservation, detailsRequest: $detailsRequest, actionRequest: $actionRequest)';
}


}

/// @nodoc
abstract mixin class $ReservationDetailsStateCopyWith<$Res>  {
  factory $ReservationDetailsStateCopyWith(ReservationDetailsState value, $Res Function(ReservationDetailsState) _then) = _$ReservationDetailsStateCopyWithImpl;
@useResult
$Res call({
 ReservationEntity reservation, AsyncState<ReservationDetailsEntity> detailsRequest, AsyncState<ReservationDetailsEntity> actionRequest
});


$ReservationEntityCopyWith<$Res> get reservation;$AsyncStateCopyWith<ReservationDetailsEntity, $Res> get detailsRequest;$AsyncStateCopyWith<ReservationDetailsEntity, $Res> get actionRequest;

}
/// @nodoc
class _$ReservationDetailsStateCopyWithImpl<$Res>
    implements $ReservationDetailsStateCopyWith<$Res> {
  _$ReservationDetailsStateCopyWithImpl(this._self, this._then);

  final ReservationDetailsState _self;
  final $Res Function(ReservationDetailsState) _then;

/// Create a copy of ReservationDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reservation = null,Object? detailsRequest = null,Object? actionRequest = null,}) {
  return _then(_self.copyWith(
reservation: null == reservation ? _self.reservation : reservation // ignore: cast_nullable_to_non_nullable
as ReservationEntity,detailsRequest: null == detailsRequest ? _self.detailsRequest : detailsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ReservationDetailsEntity>,actionRequest: null == actionRequest ? _self.actionRequest : actionRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ReservationDetailsEntity>,
  ));
}
/// Create a copy of ReservationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationEntityCopyWith<$Res> get reservation {
  
  return $ReservationEntityCopyWith<$Res>(_self.reservation, (value) {
    return _then(_self.copyWith(reservation: value));
  });
}/// Create a copy of ReservationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ReservationDetailsEntity, $Res> get detailsRequest {
  
  return $AsyncStateCopyWith<ReservationDetailsEntity, $Res>(_self.detailsRequest, (value) {
    return _then(_self.copyWith(detailsRequest: value));
  });
}/// Create a copy of ReservationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ReservationDetailsEntity, $Res> get actionRequest {
  
  return $AsyncStateCopyWith<ReservationDetailsEntity, $Res>(_self.actionRequest, (value) {
    return _then(_self.copyWith(actionRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReservationDetailsState].
extension ReservationDetailsStatePatterns on ReservationDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _ReservationDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReservationEntity reservation,  AsyncState<ReservationDetailsEntity> detailsRequest,  AsyncState<ReservationDetailsEntity> actionRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationDetailsState() when $default != null:
return $default(_that.reservation,_that.detailsRequest,_that.actionRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReservationEntity reservation,  AsyncState<ReservationDetailsEntity> detailsRequest,  AsyncState<ReservationDetailsEntity> actionRequest)  $default,) {final _that = this;
switch (_that) {
case _ReservationDetailsState():
return $default(_that.reservation,_that.detailsRequest,_that.actionRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReservationEntity reservation,  AsyncState<ReservationDetailsEntity> detailsRequest,  AsyncState<ReservationDetailsEntity> actionRequest)?  $default,) {final _that = this;
switch (_that) {
case _ReservationDetailsState() when $default != null:
return $default(_that.reservation,_that.detailsRequest,_that.actionRequest);case _:
  return null;

}
}

}

/// @nodoc


class _ReservationDetailsState extends ReservationDetailsState {
  const _ReservationDetailsState({required this.reservation, this.detailsRequest = const AsyncState.idle(), this.actionRequest = const AsyncState.idle()}): super._();
  

/// The listing entry the sheet was opened from — what the details and
/// withdrawal requests are keyed on.
@override final  ReservationEntity reservation;
@override@JsonKey() final  AsyncState<ReservationDetailsEntity> detailsRequest;
@override@JsonKey() final  AsyncState<ReservationDetailsEntity> actionRequest;

/// Create a copy of ReservationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationDetailsStateCopyWith<_ReservationDetailsState> get copyWith => __$ReservationDetailsStateCopyWithImpl<_ReservationDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationDetailsState&&(identical(other.reservation, reservation) || other.reservation == reservation)&&(identical(other.detailsRequest, detailsRequest) || other.detailsRequest == detailsRequest)&&(identical(other.actionRequest, actionRequest) || other.actionRequest == actionRequest));
}


@override
int get hashCode => Object.hash(runtimeType,reservation,detailsRequest,actionRequest);

@override
String toString() {
  return 'ReservationDetailsState(reservation: $reservation, detailsRequest: $detailsRequest, actionRequest: $actionRequest)';
}


}

/// @nodoc
abstract mixin class _$ReservationDetailsStateCopyWith<$Res> implements $ReservationDetailsStateCopyWith<$Res> {
  factory _$ReservationDetailsStateCopyWith(_ReservationDetailsState value, $Res Function(_ReservationDetailsState) _then) = __$ReservationDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 ReservationEntity reservation, AsyncState<ReservationDetailsEntity> detailsRequest, AsyncState<ReservationDetailsEntity> actionRequest
});


@override $ReservationEntityCopyWith<$Res> get reservation;@override $AsyncStateCopyWith<ReservationDetailsEntity, $Res> get detailsRequest;@override $AsyncStateCopyWith<ReservationDetailsEntity, $Res> get actionRequest;

}
/// @nodoc
class __$ReservationDetailsStateCopyWithImpl<$Res>
    implements _$ReservationDetailsStateCopyWith<$Res> {
  __$ReservationDetailsStateCopyWithImpl(this._self, this._then);

  final _ReservationDetailsState _self;
  final $Res Function(_ReservationDetailsState) _then;

/// Create a copy of ReservationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reservation = null,Object? detailsRequest = null,Object? actionRequest = null,}) {
  return _then(_ReservationDetailsState(
reservation: null == reservation ? _self.reservation : reservation // ignore: cast_nullable_to_non_nullable
as ReservationEntity,detailsRequest: null == detailsRequest ? _self.detailsRequest : detailsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ReservationDetailsEntity>,actionRequest: null == actionRequest ? _self.actionRequest : actionRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ReservationDetailsEntity>,
  ));
}

/// Create a copy of ReservationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationEntityCopyWith<$Res> get reservation {
  
  return $ReservationEntityCopyWith<$Res>(_self.reservation, (value) {
    return _then(_self.copyWith(reservation: value));
  });
}/// Create a copy of ReservationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ReservationDetailsEntity, $Res> get detailsRequest {
  
  return $AsyncStateCopyWith<ReservationDetailsEntity, $Res>(_self.detailsRequest, (value) {
    return _then(_self.copyWith(detailsRequest: value));
  });
}/// Create a copy of ReservationDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ReservationDetailsEntity, $Res> get actionRequest {
  
  return $AsyncStateCopyWith<ReservationDetailsEntity, $Res>(_self.actionRequest, (value) {
    return _then(_self.copyWith(actionRequest: value));
  });
}
}

// dart format on
