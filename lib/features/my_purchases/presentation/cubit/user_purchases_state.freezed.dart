// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_purchases_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPurchasesState {

 UserPurchasePeriod get period; AsyncState<List<UserPurchaseEntity>> get currentRequest; AsyncState<List<UserPurchaseEntity>> get historyRequest;
/// Create a copy of UserPurchasesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPurchasesStateCopyWith<UserPurchasesState> get copyWith => _$UserPurchasesStateCopyWithImpl<UserPurchasesState>(this as UserPurchasesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPurchasesState&&(identical(other.period, period) || other.period == period)&&(identical(other.currentRequest, currentRequest) || other.currentRequest == currentRequest)&&(identical(other.historyRequest, historyRequest) || other.historyRequest == historyRequest));
}


@override
int get hashCode => Object.hash(runtimeType,period,currentRequest,historyRequest);

@override
String toString() {
  return 'UserPurchasesState(period: $period, currentRequest: $currentRequest, historyRequest: $historyRequest)';
}


}

/// @nodoc
abstract mixin class $UserPurchasesStateCopyWith<$Res>  {
  factory $UserPurchasesStateCopyWith(UserPurchasesState value, $Res Function(UserPurchasesState) _then) = _$UserPurchasesStateCopyWithImpl;
@useResult
$Res call({
 UserPurchasePeriod period, AsyncState<List<UserPurchaseEntity>> currentRequest, AsyncState<List<UserPurchaseEntity>> historyRequest
});


$AsyncStateCopyWith<List<UserPurchaseEntity>, $Res> get currentRequest;$AsyncStateCopyWith<List<UserPurchaseEntity>, $Res> get historyRequest;

}
/// @nodoc
class _$UserPurchasesStateCopyWithImpl<$Res>
    implements $UserPurchasesStateCopyWith<$Res> {
  _$UserPurchasesStateCopyWithImpl(this._self, this._then);

  final UserPurchasesState _self;
  final $Res Function(UserPurchasesState) _then;

/// Create a copy of UserPurchasesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? currentRequest = null,Object? historyRequest = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as UserPurchasePeriod,currentRequest: null == currentRequest ? _self.currentRequest : currentRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<UserPurchaseEntity>>,historyRequest: null == historyRequest ? _self.historyRequest : historyRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<UserPurchaseEntity>>,
  ));
}
/// Create a copy of UserPurchasesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<UserPurchaseEntity>, $Res> get currentRequest {
  
  return $AsyncStateCopyWith<List<UserPurchaseEntity>, $Res>(_self.currentRequest, (value) {
    return _then(_self.copyWith(currentRequest: value));
  });
}/// Create a copy of UserPurchasesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<UserPurchaseEntity>, $Res> get historyRequest {
  
  return $AsyncStateCopyWith<List<UserPurchaseEntity>, $Res>(_self.historyRequest, (value) {
    return _then(_self.copyWith(historyRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserPurchasesState].
extension UserPurchasesStatePatterns on UserPurchasesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPurchasesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPurchasesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPurchasesState value)  $default,){
final _that = this;
switch (_that) {
case _UserPurchasesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPurchasesState value)?  $default,){
final _that = this;
switch (_that) {
case _UserPurchasesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserPurchasePeriod period,  AsyncState<List<UserPurchaseEntity>> currentRequest,  AsyncState<List<UserPurchaseEntity>> historyRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPurchasesState() when $default != null:
return $default(_that.period,_that.currentRequest,_that.historyRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserPurchasePeriod period,  AsyncState<List<UserPurchaseEntity>> currentRequest,  AsyncState<List<UserPurchaseEntity>> historyRequest)  $default,) {final _that = this;
switch (_that) {
case _UserPurchasesState():
return $default(_that.period,_that.currentRequest,_that.historyRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserPurchasePeriod period,  AsyncState<List<UserPurchaseEntity>> currentRequest,  AsyncState<List<UserPurchaseEntity>> historyRequest)?  $default,) {final _that = this;
switch (_that) {
case _UserPurchasesState() when $default != null:
return $default(_that.period,_that.currentRequest,_that.historyRequest);case _:
  return null;

}
}

}

/// @nodoc


class _UserPurchasesState implements UserPurchasesState {
  const _UserPurchasesState({this.period = UserPurchasePeriod.current, this.currentRequest = const AsyncState.idle(), this.historyRequest = const AsyncState.idle()});
  

@override@JsonKey() final  UserPurchasePeriod period;
@override@JsonKey() final  AsyncState<List<UserPurchaseEntity>> currentRequest;
@override@JsonKey() final  AsyncState<List<UserPurchaseEntity>> historyRequest;

/// Create a copy of UserPurchasesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPurchasesStateCopyWith<_UserPurchasesState> get copyWith => __$UserPurchasesStateCopyWithImpl<_UserPurchasesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPurchasesState&&(identical(other.period, period) || other.period == period)&&(identical(other.currentRequest, currentRequest) || other.currentRequest == currentRequest)&&(identical(other.historyRequest, historyRequest) || other.historyRequest == historyRequest));
}


@override
int get hashCode => Object.hash(runtimeType,period,currentRequest,historyRequest);

@override
String toString() {
  return 'UserPurchasesState(period: $period, currentRequest: $currentRequest, historyRequest: $historyRequest)';
}


}

/// @nodoc
abstract mixin class _$UserPurchasesStateCopyWith<$Res> implements $UserPurchasesStateCopyWith<$Res> {
  factory _$UserPurchasesStateCopyWith(_UserPurchasesState value, $Res Function(_UserPurchasesState) _then) = __$UserPurchasesStateCopyWithImpl;
@override @useResult
$Res call({
 UserPurchasePeriod period, AsyncState<List<UserPurchaseEntity>> currentRequest, AsyncState<List<UserPurchaseEntity>> historyRequest
});


@override $AsyncStateCopyWith<List<UserPurchaseEntity>, $Res> get currentRequest;@override $AsyncStateCopyWith<List<UserPurchaseEntity>, $Res> get historyRequest;

}
/// @nodoc
class __$UserPurchasesStateCopyWithImpl<$Res>
    implements _$UserPurchasesStateCopyWith<$Res> {
  __$UserPurchasesStateCopyWithImpl(this._self, this._then);

  final _UserPurchasesState _self;
  final $Res Function(_UserPurchasesState) _then;

/// Create a copy of UserPurchasesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? currentRequest = null,Object? historyRequest = null,}) {
  return _then(_UserPurchasesState(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as UserPurchasePeriod,currentRequest: null == currentRequest ? _self.currentRequest : currentRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<UserPurchaseEntity>>,historyRequest: null == historyRequest ? _self.historyRequest : historyRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<UserPurchaseEntity>>,
  ));
}

/// Create a copy of UserPurchasesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<UserPurchaseEntity>, $Res> get currentRequest {
  
  return $AsyncStateCopyWith<List<UserPurchaseEntity>, $Res>(_self.currentRequest, (value) {
    return _then(_self.copyWith(currentRequest: value));
  });
}/// Create a copy of UserPurchasesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<UserPurchaseEntity>, $Res> get historyRequest {
  
  return $AsyncStateCopyWith<List<UserPurchaseEntity>, $Res>(_self.historyRequest, (value) {
    return _then(_self.copyWith(historyRequest: value));
  });
}
}

// dart format on
