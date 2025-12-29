// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 AsyncState<HomeEntity> get homeRequest; int? get selectedActivityLineId;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.homeRequest, homeRequest) || other.homeRequest == homeRequest)&&(identical(other.selectedActivityLineId, selectedActivityLineId) || other.selectedActivityLineId == selectedActivityLineId));
}


@override
int get hashCode => Object.hash(runtimeType,homeRequest,selectedActivityLineId);

@override
String toString() {
  return 'HomeState(homeRequest: $homeRequest, selectedActivityLineId: $selectedActivityLineId)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<HomeEntity> homeRequest, int? selectedActivityLineId
});


$AsyncStateCopyWith<HomeEntity, $Res> get homeRequest;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homeRequest = null,Object? selectedActivityLineId = freezed,}) {
  return _then(_self.copyWith(
homeRequest: null == homeRequest ? _self.homeRequest : homeRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<HomeEntity>,selectedActivityLineId: freezed == selectedActivityLineId ? _self.selectedActivityLineId : selectedActivityLineId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<HomeEntity, $Res> get homeRequest {
  
  return $AsyncStateCopyWith<HomeEntity, $Res>(_self.homeRequest, (value) {
    return _then(_self.copyWith(homeRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<HomeEntity> homeRequest,  int? selectedActivityLineId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.homeRequest,_that.selectedActivityLineId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<HomeEntity> homeRequest,  int? selectedActivityLineId)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.homeRequest,_that.selectedActivityLineId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<HomeEntity> homeRequest,  int? selectedActivityLineId)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.homeRequest,_that.selectedActivityLineId);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.homeRequest = const AsyncState.idle(), this.selectedActivityLineId});
  

@override@JsonKey() final  AsyncState<HomeEntity> homeRequest;
@override final  int? selectedActivityLineId;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.homeRequest, homeRequest) || other.homeRequest == homeRequest)&&(identical(other.selectedActivityLineId, selectedActivityLineId) || other.selectedActivityLineId == selectedActivityLineId));
}


@override
int get hashCode => Object.hash(runtimeType,homeRequest,selectedActivityLineId);

@override
String toString() {
  return 'HomeState(homeRequest: $homeRequest, selectedActivityLineId: $selectedActivityLineId)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<HomeEntity> homeRequest, int? selectedActivityLineId
});


@override $AsyncStateCopyWith<HomeEntity, $Res> get homeRequest;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homeRequest = null,Object? selectedActivityLineId = freezed,}) {
  return _then(_HomeState(
homeRequest: null == homeRequest ? _self.homeRequest : homeRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<HomeEntity>,selectedActivityLineId: freezed == selectedActivityLineId ? _self.selectedActivityLineId : selectedActivityLineId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<HomeEntity, $Res> get homeRequest {
  
  return $AsyncStateCopyWith<HomeEntity, $Res>(_self.homeRequest, (value) {
    return _then(_self.copyWith(homeRequest: value));
  });
}
}

// dart format on
