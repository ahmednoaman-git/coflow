// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_profiles_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedProfilesState {

 AsyncState<List<SavedProfileEntity>> get profilesRequest; AsyncState<void> get unsaveRequest; AsyncState<void> get trackingRequest;/// The activity line being filtered on, or null for "All" — the default.
 ActivityLineEntity? get selectedLine;
/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedProfilesStateCopyWith<SavedProfilesState> get copyWith => _$SavedProfilesStateCopyWithImpl<SavedProfilesState>(this as SavedProfilesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedProfilesState&&(identical(other.profilesRequest, profilesRequest) || other.profilesRequest == profilesRequest)&&(identical(other.unsaveRequest, unsaveRequest) || other.unsaveRequest == unsaveRequest)&&(identical(other.trackingRequest, trackingRequest) || other.trackingRequest == trackingRequest)&&(identical(other.selectedLine, selectedLine) || other.selectedLine == selectedLine));
}


@override
int get hashCode => Object.hash(runtimeType,profilesRequest,unsaveRequest,trackingRequest,selectedLine);

@override
String toString() {
  return 'SavedProfilesState(profilesRequest: $profilesRequest, unsaveRequest: $unsaveRequest, trackingRequest: $trackingRequest, selectedLine: $selectedLine)';
}


}

/// @nodoc
abstract mixin class $SavedProfilesStateCopyWith<$Res>  {
  factory $SavedProfilesStateCopyWith(SavedProfilesState value, $Res Function(SavedProfilesState) _then) = _$SavedProfilesStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<List<SavedProfileEntity>> profilesRequest, AsyncState<void> unsaveRequest, AsyncState<void> trackingRequest, ActivityLineEntity? selectedLine
});


$AsyncStateCopyWith<List<SavedProfileEntity>, $Res> get profilesRequest;$AsyncStateCopyWith<void, $Res> get unsaveRequest;$AsyncStateCopyWith<void, $Res> get trackingRequest;$ActivityLineEntityCopyWith<$Res>? get selectedLine;

}
/// @nodoc
class _$SavedProfilesStateCopyWithImpl<$Res>
    implements $SavedProfilesStateCopyWith<$Res> {
  _$SavedProfilesStateCopyWithImpl(this._self, this._then);

  final SavedProfilesState _self;
  final $Res Function(SavedProfilesState) _then;

/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profilesRequest = null,Object? unsaveRequest = null,Object? trackingRequest = null,Object? selectedLine = freezed,}) {
  return _then(_self.copyWith(
profilesRequest: null == profilesRequest ? _self.profilesRequest : profilesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<SavedProfileEntity>>,unsaveRequest: null == unsaveRequest ? _self.unsaveRequest : unsaveRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,trackingRequest: null == trackingRequest ? _self.trackingRequest : trackingRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,selectedLine: freezed == selectedLine ? _self.selectedLine : selectedLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity?,
  ));
}
/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<SavedProfileEntity>, $Res> get profilesRequest {
  
  return $AsyncStateCopyWith<List<SavedProfileEntity>, $Res>(_self.profilesRequest, (value) {
    return _then(_self.copyWith(profilesRequest: value));
  });
}/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get unsaveRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.unsaveRequest, (value) {
    return _then(_self.copyWith(unsaveRequest: value));
  });
}/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get trackingRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.trackingRequest, (value) {
    return _then(_self.copyWith(trackingRequest: value));
  });
}/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLineEntityCopyWith<$Res>? get selectedLine {
    if (_self.selectedLine == null) {
    return null;
  }

  return $ActivityLineEntityCopyWith<$Res>(_self.selectedLine!, (value) {
    return _then(_self.copyWith(selectedLine: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedProfilesState].
extension SavedProfilesStatePatterns on SavedProfilesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedProfilesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedProfilesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedProfilesState value)  $default,){
final _that = this;
switch (_that) {
case _SavedProfilesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedProfilesState value)?  $default,){
final _that = this;
switch (_that) {
case _SavedProfilesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<List<SavedProfileEntity>> profilesRequest,  AsyncState<void> unsaveRequest,  AsyncState<void> trackingRequest,  ActivityLineEntity? selectedLine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedProfilesState() when $default != null:
return $default(_that.profilesRequest,_that.unsaveRequest,_that.trackingRequest,_that.selectedLine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<List<SavedProfileEntity>> profilesRequest,  AsyncState<void> unsaveRequest,  AsyncState<void> trackingRequest,  ActivityLineEntity? selectedLine)  $default,) {final _that = this;
switch (_that) {
case _SavedProfilesState():
return $default(_that.profilesRequest,_that.unsaveRequest,_that.trackingRequest,_that.selectedLine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<List<SavedProfileEntity>> profilesRequest,  AsyncState<void> unsaveRequest,  AsyncState<void> trackingRequest,  ActivityLineEntity? selectedLine)?  $default,) {final _that = this;
switch (_that) {
case _SavedProfilesState() when $default != null:
return $default(_that.profilesRequest,_that.unsaveRequest,_that.trackingRequest,_that.selectedLine);case _:
  return null;

}
}

}

/// @nodoc


class _SavedProfilesState extends SavedProfilesState {
  const _SavedProfilesState({this.profilesRequest = const AsyncState.idle(), this.unsaveRequest = const AsyncState.idle(), this.trackingRequest = const AsyncState.idle(), this.selectedLine}): super._();
  

@override@JsonKey() final  AsyncState<List<SavedProfileEntity>> profilesRequest;
@override@JsonKey() final  AsyncState<void> unsaveRequest;
@override@JsonKey() final  AsyncState<void> trackingRequest;
/// The activity line being filtered on, or null for "All" — the default.
@override final  ActivityLineEntity? selectedLine;

/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedProfilesStateCopyWith<_SavedProfilesState> get copyWith => __$SavedProfilesStateCopyWithImpl<_SavedProfilesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedProfilesState&&(identical(other.profilesRequest, profilesRequest) || other.profilesRequest == profilesRequest)&&(identical(other.unsaveRequest, unsaveRequest) || other.unsaveRequest == unsaveRequest)&&(identical(other.trackingRequest, trackingRequest) || other.trackingRequest == trackingRequest)&&(identical(other.selectedLine, selectedLine) || other.selectedLine == selectedLine));
}


@override
int get hashCode => Object.hash(runtimeType,profilesRequest,unsaveRequest,trackingRequest,selectedLine);

@override
String toString() {
  return 'SavedProfilesState(profilesRequest: $profilesRequest, unsaveRequest: $unsaveRequest, trackingRequest: $trackingRequest, selectedLine: $selectedLine)';
}


}

/// @nodoc
abstract mixin class _$SavedProfilesStateCopyWith<$Res> implements $SavedProfilesStateCopyWith<$Res> {
  factory _$SavedProfilesStateCopyWith(_SavedProfilesState value, $Res Function(_SavedProfilesState) _then) = __$SavedProfilesStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<List<SavedProfileEntity>> profilesRequest, AsyncState<void> unsaveRequest, AsyncState<void> trackingRequest, ActivityLineEntity? selectedLine
});


@override $AsyncStateCopyWith<List<SavedProfileEntity>, $Res> get profilesRequest;@override $AsyncStateCopyWith<void, $Res> get unsaveRequest;@override $AsyncStateCopyWith<void, $Res> get trackingRequest;@override $ActivityLineEntityCopyWith<$Res>? get selectedLine;

}
/// @nodoc
class __$SavedProfilesStateCopyWithImpl<$Res>
    implements _$SavedProfilesStateCopyWith<$Res> {
  __$SavedProfilesStateCopyWithImpl(this._self, this._then);

  final _SavedProfilesState _self;
  final $Res Function(_SavedProfilesState) _then;

/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profilesRequest = null,Object? unsaveRequest = null,Object? trackingRequest = null,Object? selectedLine = freezed,}) {
  return _then(_SavedProfilesState(
profilesRequest: null == profilesRequest ? _self.profilesRequest : profilesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<SavedProfileEntity>>,unsaveRequest: null == unsaveRequest ? _self.unsaveRequest : unsaveRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,trackingRequest: null == trackingRequest ? _self.trackingRequest : trackingRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,selectedLine: freezed == selectedLine ? _self.selectedLine : selectedLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity?,
  ));
}

/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<SavedProfileEntity>, $Res> get profilesRequest {
  
  return $AsyncStateCopyWith<List<SavedProfileEntity>, $Res>(_self.profilesRequest, (value) {
    return _then(_self.copyWith(profilesRequest: value));
  });
}/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get unsaveRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.unsaveRequest, (value) {
    return _then(_self.copyWith(unsaveRequest: value));
  });
}/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get trackingRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.trackingRequest, (value) {
    return _then(_self.copyWith(trackingRequest: value));
  });
}/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLineEntityCopyWith<$Res>? get selectedLine {
    if (_self.selectedLine == null) {
    return null;
  }

  return $ActivityLineEntityCopyWith<$Res>(_self.selectedLine!, (value) {
    return _then(_self.copyWith(selectedLine: value));
  });
}
}

// dart format on
