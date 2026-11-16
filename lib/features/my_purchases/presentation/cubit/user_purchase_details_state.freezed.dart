// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_purchase_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPurchaseDetailsState {

/// Starts out holding the list's row, so the sheet opens filled in.
 AsyncState<UserPurchaseEntity> get purchaseRequest; AsyncState<void> get cancelRequest;
/// Create a copy of UserPurchaseDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPurchaseDetailsStateCopyWith<UserPurchaseDetailsState> get copyWith => _$UserPurchaseDetailsStateCopyWithImpl<UserPurchaseDetailsState>(this as UserPurchaseDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPurchaseDetailsState&&(identical(other.purchaseRequest, purchaseRequest) || other.purchaseRequest == purchaseRequest)&&(identical(other.cancelRequest, cancelRequest) || other.cancelRequest == cancelRequest));
}


@override
int get hashCode => Object.hash(runtimeType,purchaseRequest,cancelRequest);

@override
String toString() {
  return 'UserPurchaseDetailsState(purchaseRequest: $purchaseRequest, cancelRequest: $cancelRequest)';
}


}

/// @nodoc
abstract mixin class $UserPurchaseDetailsStateCopyWith<$Res>  {
  factory $UserPurchaseDetailsStateCopyWith(UserPurchaseDetailsState value, $Res Function(UserPurchaseDetailsState) _then) = _$UserPurchaseDetailsStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<UserPurchaseEntity> purchaseRequest, AsyncState<void> cancelRequest
});


$AsyncStateCopyWith<UserPurchaseEntity, $Res> get purchaseRequest;$AsyncStateCopyWith<void, $Res> get cancelRequest;

}
/// @nodoc
class _$UserPurchaseDetailsStateCopyWithImpl<$Res>
    implements $UserPurchaseDetailsStateCopyWith<$Res> {
  _$UserPurchaseDetailsStateCopyWithImpl(this._self, this._then);

  final UserPurchaseDetailsState _self;
  final $Res Function(UserPurchaseDetailsState) _then;

/// Create a copy of UserPurchaseDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? purchaseRequest = null,Object? cancelRequest = null,}) {
  return _then(_self.copyWith(
purchaseRequest: null == purchaseRequest ? _self.purchaseRequest : purchaseRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<UserPurchaseEntity>,cancelRequest: null == cancelRequest ? _self.cancelRequest : cancelRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}
/// Create a copy of UserPurchaseDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<UserPurchaseEntity, $Res> get purchaseRequest {
  
  return $AsyncStateCopyWith<UserPurchaseEntity, $Res>(_self.purchaseRequest, (value) {
    return _then(_self.copyWith(purchaseRequest: value));
  });
}/// Create a copy of UserPurchaseDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get cancelRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.cancelRequest, (value) {
    return _then(_self.copyWith(cancelRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserPurchaseDetailsState].
extension UserPurchaseDetailsStatePatterns on UserPurchaseDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPurchaseDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPurchaseDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPurchaseDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _UserPurchaseDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPurchaseDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _UserPurchaseDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<UserPurchaseEntity> purchaseRequest,  AsyncState<void> cancelRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPurchaseDetailsState() when $default != null:
return $default(_that.purchaseRequest,_that.cancelRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<UserPurchaseEntity> purchaseRequest,  AsyncState<void> cancelRequest)  $default,) {final _that = this;
switch (_that) {
case _UserPurchaseDetailsState():
return $default(_that.purchaseRequest,_that.cancelRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<UserPurchaseEntity> purchaseRequest,  AsyncState<void> cancelRequest)?  $default,) {final _that = this;
switch (_that) {
case _UserPurchaseDetailsState() when $default != null:
return $default(_that.purchaseRequest,_that.cancelRequest);case _:
  return null;

}
}

}

/// @nodoc


class _UserPurchaseDetailsState implements UserPurchaseDetailsState {
  const _UserPurchaseDetailsState({required this.purchaseRequest, this.cancelRequest = const AsyncState.idle()});
  

/// Starts out holding the list's row, so the sheet opens filled in.
@override final  AsyncState<UserPurchaseEntity> purchaseRequest;
@override@JsonKey() final  AsyncState<void> cancelRequest;

/// Create a copy of UserPurchaseDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPurchaseDetailsStateCopyWith<_UserPurchaseDetailsState> get copyWith => __$UserPurchaseDetailsStateCopyWithImpl<_UserPurchaseDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPurchaseDetailsState&&(identical(other.purchaseRequest, purchaseRequest) || other.purchaseRequest == purchaseRequest)&&(identical(other.cancelRequest, cancelRequest) || other.cancelRequest == cancelRequest));
}


@override
int get hashCode => Object.hash(runtimeType,purchaseRequest,cancelRequest);

@override
String toString() {
  return 'UserPurchaseDetailsState(purchaseRequest: $purchaseRequest, cancelRequest: $cancelRequest)';
}


}

/// @nodoc
abstract mixin class _$UserPurchaseDetailsStateCopyWith<$Res> implements $UserPurchaseDetailsStateCopyWith<$Res> {
  factory _$UserPurchaseDetailsStateCopyWith(_UserPurchaseDetailsState value, $Res Function(_UserPurchaseDetailsState) _then) = __$UserPurchaseDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<UserPurchaseEntity> purchaseRequest, AsyncState<void> cancelRequest
});


@override $AsyncStateCopyWith<UserPurchaseEntity, $Res> get purchaseRequest;@override $AsyncStateCopyWith<void, $Res> get cancelRequest;

}
/// @nodoc
class __$UserPurchaseDetailsStateCopyWithImpl<$Res>
    implements _$UserPurchaseDetailsStateCopyWith<$Res> {
  __$UserPurchaseDetailsStateCopyWithImpl(this._self, this._then);

  final _UserPurchaseDetailsState _self;
  final $Res Function(_UserPurchaseDetailsState) _then;

/// Create a copy of UserPurchaseDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? purchaseRequest = null,Object? cancelRequest = null,}) {
  return _then(_UserPurchaseDetailsState(
purchaseRequest: null == purchaseRequest ? _self.purchaseRequest : purchaseRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<UserPurchaseEntity>,cancelRequest: null == cancelRequest ? _self.cancelRequest : cancelRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of UserPurchaseDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<UserPurchaseEntity, $Res> get purchaseRequest {
  
  return $AsyncStateCopyWith<UserPurchaseEntity, $Res>(_self.purchaseRequest, (value) {
    return _then(_self.copyWith(purchaseRequest: value));
  });
}/// Create a copy of UserPurchaseDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get cancelRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.cancelRequest, (value) {
    return _then(_self.copyWith(cancelRequest: value));
  });
}
}

// dart format on
