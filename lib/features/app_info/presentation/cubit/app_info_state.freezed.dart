// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppInfoState {

 AsyncState<AppInfoEntity> get infoRequest;
/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInfoStateCopyWith<AppInfoState> get copyWith => _$AppInfoStateCopyWithImpl<AppInfoState>(this as AppInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfoState&&(identical(other.infoRequest, infoRequest) || other.infoRequest == infoRequest));
}


@override
int get hashCode => Object.hash(runtimeType,infoRequest);

@override
String toString() {
  return 'AppInfoState(infoRequest: $infoRequest)';
}


}

/// @nodoc
abstract mixin class $AppInfoStateCopyWith<$Res>  {
  factory $AppInfoStateCopyWith(AppInfoState value, $Res Function(AppInfoState) _then) = _$AppInfoStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<AppInfoEntity> infoRequest
});


$AsyncStateCopyWith<AppInfoEntity, $Res> get infoRequest;

}
/// @nodoc
class _$AppInfoStateCopyWithImpl<$Res>
    implements $AppInfoStateCopyWith<$Res> {
  _$AppInfoStateCopyWithImpl(this._self, this._then);

  final AppInfoState _self;
  final $Res Function(AppInfoState) _then;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? infoRequest = null,}) {
  return _then(_self.copyWith(
infoRequest: null == infoRequest ? _self.infoRequest : infoRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<AppInfoEntity>,
  ));
}
/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<AppInfoEntity, $Res> get infoRequest {
  
  return $AsyncStateCopyWith<AppInfoEntity, $Res>(_self.infoRequest, (value) {
    return _then(_self.copyWith(infoRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppInfoState].
extension AppInfoStatePatterns on AppInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppInfoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppInfoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppInfoState value)  $default,){
final _that = this;
switch (_that) {
case _AppInfoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppInfoState value)?  $default,){
final _that = this;
switch (_that) {
case _AppInfoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<AppInfoEntity> infoRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppInfoState() when $default != null:
return $default(_that.infoRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<AppInfoEntity> infoRequest)  $default,) {final _that = this;
switch (_that) {
case _AppInfoState():
return $default(_that.infoRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<AppInfoEntity> infoRequest)?  $default,) {final _that = this;
switch (_that) {
case _AppInfoState() when $default != null:
return $default(_that.infoRequest);case _:
  return null;

}
}

}

/// @nodoc


class _AppInfoState implements AppInfoState {
  const _AppInfoState({this.infoRequest = const AsyncState.idle()});
  

@override@JsonKey() final  AsyncState<AppInfoEntity> infoRequest;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppInfoStateCopyWith<_AppInfoState> get copyWith => __$AppInfoStateCopyWithImpl<_AppInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppInfoState&&(identical(other.infoRequest, infoRequest) || other.infoRequest == infoRequest));
}


@override
int get hashCode => Object.hash(runtimeType,infoRequest);

@override
String toString() {
  return 'AppInfoState(infoRequest: $infoRequest)';
}


}

/// @nodoc
abstract mixin class _$AppInfoStateCopyWith<$Res> implements $AppInfoStateCopyWith<$Res> {
  factory _$AppInfoStateCopyWith(_AppInfoState value, $Res Function(_AppInfoState) _then) = __$AppInfoStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<AppInfoEntity> infoRequest
});


@override $AsyncStateCopyWith<AppInfoEntity, $Res> get infoRequest;

}
/// @nodoc
class __$AppInfoStateCopyWithImpl<$Res>
    implements _$AppInfoStateCopyWith<$Res> {
  __$AppInfoStateCopyWithImpl(this._self, this._then);

  final _AppInfoState _self;
  final $Res Function(_AppInfoState) _then;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? infoRequest = null,}) {
  return _then(_AppInfoState(
infoRequest: null == infoRequest ? _self.infoRequest : infoRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<AppInfoEntity>,
  ));
}

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<AppInfoEntity, $Res> get infoRequest {
  
  return $AsyncStateCopyWith<AppInfoEntity, $Res>(_self.infoRequest, (value) {
    return _then(_self.copyWith(infoRequest: value));
  });
}
}

// dart format on
