// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TicketDetailsState {

 int get ticketId; AsyncState<FacilityTicketDetailsEntity> get detailsRequest;
/// Create a copy of TicketDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketDetailsStateCopyWith<TicketDetailsState> get copyWith => _$TicketDetailsStateCopyWithImpl<TicketDetailsState>(this as TicketDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketDetailsState&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.detailsRequest, detailsRequest) || other.detailsRequest == detailsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,ticketId,detailsRequest);

@override
String toString() {
  return 'TicketDetailsState(ticketId: $ticketId, detailsRequest: $detailsRequest)';
}


}

/// @nodoc
abstract mixin class $TicketDetailsStateCopyWith<$Res>  {
  factory $TicketDetailsStateCopyWith(TicketDetailsState value, $Res Function(TicketDetailsState) _then) = _$TicketDetailsStateCopyWithImpl;
@useResult
$Res call({
 int ticketId, AsyncState<FacilityTicketDetailsEntity> detailsRequest
});


$AsyncStateCopyWith<FacilityTicketDetailsEntity, $Res> get detailsRequest;

}
/// @nodoc
class _$TicketDetailsStateCopyWithImpl<$Res>
    implements $TicketDetailsStateCopyWith<$Res> {
  _$TicketDetailsStateCopyWithImpl(this._self, this._then);

  final TicketDetailsState _self;
  final $Res Function(TicketDetailsState) _then;

/// Create a copy of TicketDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticketId = null,Object? detailsRequest = null,}) {
  return _then(_self.copyWith(
ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as int,detailsRequest: null == detailsRequest ? _self.detailsRequest : detailsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilityTicketDetailsEntity>,
  ));
}
/// Create a copy of TicketDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilityTicketDetailsEntity, $Res> get detailsRequest {
  
  return $AsyncStateCopyWith<FacilityTicketDetailsEntity, $Res>(_self.detailsRequest, (value) {
    return _then(_self.copyWith(detailsRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketDetailsState].
extension TicketDetailsStatePatterns on TicketDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _TicketDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _TicketDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int ticketId,  AsyncState<FacilityTicketDetailsEntity> detailsRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketDetailsState() when $default != null:
return $default(_that.ticketId,_that.detailsRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int ticketId,  AsyncState<FacilityTicketDetailsEntity> detailsRequest)  $default,) {final _that = this;
switch (_that) {
case _TicketDetailsState():
return $default(_that.ticketId,_that.detailsRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int ticketId,  AsyncState<FacilityTicketDetailsEntity> detailsRequest)?  $default,) {final _that = this;
switch (_that) {
case _TicketDetailsState() when $default != null:
return $default(_that.ticketId,_that.detailsRequest);case _:
  return null;

}
}

}

/// @nodoc


class _TicketDetailsState implements TicketDetailsState {
  const _TicketDetailsState({required this.ticketId, this.detailsRequest = const AsyncState.idle()});
  

@override final  int ticketId;
@override@JsonKey() final  AsyncState<FacilityTicketDetailsEntity> detailsRequest;

/// Create a copy of TicketDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketDetailsStateCopyWith<_TicketDetailsState> get copyWith => __$TicketDetailsStateCopyWithImpl<_TicketDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketDetailsState&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.detailsRequest, detailsRequest) || other.detailsRequest == detailsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,ticketId,detailsRequest);

@override
String toString() {
  return 'TicketDetailsState(ticketId: $ticketId, detailsRequest: $detailsRequest)';
}


}

/// @nodoc
abstract mixin class _$TicketDetailsStateCopyWith<$Res> implements $TicketDetailsStateCopyWith<$Res> {
  factory _$TicketDetailsStateCopyWith(_TicketDetailsState value, $Res Function(_TicketDetailsState) _then) = __$TicketDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 int ticketId, AsyncState<FacilityTicketDetailsEntity> detailsRequest
});


@override $AsyncStateCopyWith<FacilityTicketDetailsEntity, $Res> get detailsRequest;

}
/// @nodoc
class __$TicketDetailsStateCopyWithImpl<$Res>
    implements _$TicketDetailsStateCopyWith<$Res> {
  __$TicketDetailsStateCopyWithImpl(this._self, this._then);

  final _TicketDetailsState _self;
  final $Res Function(_TicketDetailsState) _then;

/// Create a copy of TicketDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticketId = null,Object? detailsRequest = null,}) {
  return _then(_TicketDetailsState(
ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as int,detailsRequest: null == detailsRequest ? _self.detailsRequest : detailsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilityTicketDetailsEntity>,
  ));
}

/// Create a copy of TicketDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilityTicketDetailsEntity, $Res> get detailsRequest {
  
  return $AsyncStateCopyWith<FacilityTicketDetailsEntity, $Res>(_self.detailsRequest, (value) {
    return _then(_self.copyWith(detailsRequest: value));
  });
}
}

// dart format on
