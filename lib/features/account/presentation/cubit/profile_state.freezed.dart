// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {

 AsyncState<ProfileEntity> get profileRequest; AsyncState<ProfileStatsEntity> get statisticsRequest; AsyncState<void> get logoutRequest;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.profileRequest, profileRequest) || other.profileRequest == profileRequest)&&(identical(other.statisticsRequest, statisticsRequest) || other.statisticsRequest == statisticsRequest)&&(identical(other.logoutRequest, logoutRequest) || other.logoutRequest == logoutRequest));
}


@override
int get hashCode => Object.hash(runtimeType,profileRequest,statisticsRequest,logoutRequest);

@override
String toString() {
  return 'ProfileState(profileRequest: $profileRequest, statisticsRequest: $statisticsRequest, logoutRequest: $logoutRequest)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<ProfileEntity> profileRequest, AsyncState<ProfileStatsEntity> statisticsRequest, AsyncState<void> logoutRequest
});


$AsyncStateCopyWith<ProfileEntity, $Res> get profileRequest;$AsyncStateCopyWith<ProfileStatsEntity, $Res> get statisticsRequest;$AsyncStateCopyWith<void, $Res> get logoutRequest;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileRequest = null,Object? statisticsRequest = null,Object? logoutRequest = null,}) {
  return _then(_self.copyWith(
profileRequest: null == profileRequest ? _self.profileRequest : profileRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ProfileEntity>,statisticsRequest: null == statisticsRequest ? _self.statisticsRequest : statisticsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ProfileStatsEntity>,logoutRequest: null == logoutRequest ? _self.logoutRequest : logoutRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ProfileEntity, $Res> get profileRequest {
  
  return $AsyncStateCopyWith<ProfileEntity, $Res>(_self.profileRequest, (value) {
    return _then(_self.copyWith(profileRequest: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ProfileStatsEntity, $Res> get statisticsRequest {
  
  return $AsyncStateCopyWith<ProfileStatsEntity, $Res>(_self.statisticsRequest, (value) {
    return _then(_self.copyWith(statisticsRequest: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get logoutRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.logoutRequest, (value) {
    return _then(_self.copyWith(logoutRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<ProfileEntity> profileRequest,  AsyncState<ProfileStatsEntity> statisticsRequest,  AsyncState<void> logoutRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.profileRequest,_that.statisticsRequest,_that.logoutRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<ProfileEntity> profileRequest,  AsyncState<ProfileStatsEntity> statisticsRequest,  AsyncState<void> logoutRequest)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.profileRequest,_that.statisticsRequest,_that.logoutRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<ProfileEntity> profileRequest,  AsyncState<ProfileStatsEntity> statisticsRequest,  AsyncState<void> logoutRequest)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.profileRequest,_that.statisticsRequest,_that.logoutRequest);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({this.profileRequest = const AsyncState.idle(), this.statisticsRequest = const AsyncState.idle(), this.logoutRequest = const AsyncState.idle()});
  

@override@JsonKey() final  AsyncState<ProfileEntity> profileRequest;
@override@JsonKey() final  AsyncState<ProfileStatsEntity> statisticsRequest;
@override@JsonKey() final  AsyncState<void> logoutRequest;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.profileRequest, profileRequest) || other.profileRequest == profileRequest)&&(identical(other.statisticsRequest, statisticsRequest) || other.statisticsRequest == statisticsRequest)&&(identical(other.logoutRequest, logoutRequest) || other.logoutRequest == logoutRequest));
}


@override
int get hashCode => Object.hash(runtimeType,profileRequest,statisticsRequest,logoutRequest);

@override
String toString() {
  return 'ProfileState(profileRequest: $profileRequest, statisticsRequest: $statisticsRequest, logoutRequest: $logoutRequest)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<ProfileEntity> profileRequest, AsyncState<ProfileStatsEntity> statisticsRequest, AsyncState<void> logoutRequest
});


@override $AsyncStateCopyWith<ProfileEntity, $Res> get profileRequest;@override $AsyncStateCopyWith<ProfileStatsEntity, $Res> get statisticsRequest;@override $AsyncStateCopyWith<void, $Res> get logoutRequest;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileRequest = null,Object? statisticsRequest = null,Object? logoutRequest = null,}) {
  return _then(_ProfileState(
profileRequest: null == profileRequest ? _self.profileRequest : profileRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ProfileEntity>,statisticsRequest: null == statisticsRequest ? _self.statisticsRequest : statisticsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ProfileStatsEntity>,logoutRequest: null == logoutRequest ? _self.logoutRequest : logoutRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ProfileEntity, $Res> get profileRequest {
  
  return $AsyncStateCopyWith<ProfileEntity, $Res>(_self.profileRequest, (value) {
    return _then(_self.copyWith(profileRequest: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ProfileStatsEntity, $Res> get statisticsRequest {
  
  return $AsyncStateCopyWith<ProfileStatsEntity, $Res>(_self.statisticsRequest, (value) {
    return _then(_self.copyWith(statisticsRequest: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get logoutRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.logoutRequest, (value) {
    return _then(_self.copyWith(logoutRequest: value));
  });
}
}

// dart format on
