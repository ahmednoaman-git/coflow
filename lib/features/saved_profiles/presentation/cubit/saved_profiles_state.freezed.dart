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

 AsyncState<List<SavedProfileEntity>> get profilesRequest;/// The activity line being filtered on, or null for "All" — the default.
 ActivityLineEntity? get selectedLine;
/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedProfilesStateCopyWith<SavedProfilesState> get copyWith => _$SavedProfilesStateCopyWithImpl<SavedProfilesState>(this as SavedProfilesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedProfilesState&&(identical(other.profilesRequest, profilesRequest) || other.profilesRequest == profilesRequest)&&(identical(other.selectedLine, selectedLine) || other.selectedLine == selectedLine));
}


@override
int get hashCode => Object.hash(runtimeType,profilesRequest,selectedLine);

@override
String toString() {
  return 'SavedProfilesState(profilesRequest: $profilesRequest, selectedLine: $selectedLine)';
}


}

/// @nodoc
abstract mixin class $SavedProfilesStateCopyWith<$Res>  {
  factory $SavedProfilesStateCopyWith(SavedProfilesState value, $Res Function(SavedProfilesState) _then) = _$SavedProfilesStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<List<SavedProfileEntity>> profilesRequest, ActivityLineEntity? selectedLine
});


$AsyncStateCopyWith<List<SavedProfileEntity>, $Res> get profilesRequest;$ActivityLineEntityCopyWith<$Res>? get selectedLine;

}
/// @nodoc
class _$SavedProfilesStateCopyWithImpl<$Res>
    implements $SavedProfilesStateCopyWith<$Res> {
  _$SavedProfilesStateCopyWithImpl(this._self, this._then);

  final SavedProfilesState _self;
  final $Res Function(SavedProfilesState) _then;

/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profilesRequest = null,Object? selectedLine = freezed,}) {
  return _then(_self.copyWith(
profilesRequest: null == profilesRequest ? _self.profilesRequest : profilesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<SavedProfileEntity>>,selectedLine: freezed == selectedLine ? _self.selectedLine : selectedLine // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<List<SavedProfileEntity>> profilesRequest,  ActivityLineEntity? selectedLine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedProfilesState() when $default != null:
return $default(_that.profilesRequest,_that.selectedLine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<List<SavedProfileEntity>> profilesRequest,  ActivityLineEntity? selectedLine)  $default,) {final _that = this;
switch (_that) {
case _SavedProfilesState():
return $default(_that.profilesRequest,_that.selectedLine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<List<SavedProfileEntity>> profilesRequest,  ActivityLineEntity? selectedLine)?  $default,) {final _that = this;
switch (_that) {
case _SavedProfilesState() when $default != null:
return $default(_that.profilesRequest,_that.selectedLine);case _:
  return null;

}
}

}

/// @nodoc


class _SavedProfilesState extends SavedProfilesState {
  const _SavedProfilesState({this.profilesRequest = const AsyncState.idle(), this.selectedLine}): super._();
  

@override@JsonKey() final  AsyncState<List<SavedProfileEntity>> profilesRequest;
/// The activity line being filtered on, or null for "All" — the default.
@override final  ActivityLineEntity? selectedLine;

/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedProfilesStateCopyWith<_SavedProfilesState> get copyWith => __$SavedProfilesStateCopyWithImpl<_SavedProfilesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedProfilesState&&(identical(other.profilesRequest, profilesRequest) || other.profilesRequest == profilesRequest)&&(identical(other.selectedLine, selectedLine) || other.selectedLine == selectedLine));
}


@override
int get hashCode => Object.hash(runtimeType,profilesRequest,selectedLine);

@override
String toString() {
  return 'SavedProfilesState(profilesRequest: $profilesRequest, selectedLine: $selectedLine)';
}


}

/// @nodoc
abstract mixin class _$SavedProfilesStateCopyWith<$Res> implements $SavedProfilesStateCopyWith<$Res> {
  factory _$SavedProfilesStateCopyWith(_SavedProfilesState value, $Res Function(_SavedProfilesState) _then) = __$SavedProfilesStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<List<SavedProfileEntity>> profilesRequest, ActivityLineEntity? selectedLine
});


@override $AsyncStateCopyWith<List<SavedProfileEntity>, $Res> get profilesRequest;@override $ActivityLineEntityCopyWith<$Res>? get selectedLine;

}
/// @nodoc
class __$SavedProfilesStateCopyWithImpl<$Res>
    implements _$SavedProfilesStateCopyWith<$Res> {
  __$SavedProfilesStateCopyWithImpl(this._self, this._then);

  final _SavedProfilesState _self;
  final $Res Function(_SavedProfilesState) _then;

/// Create a copy of SavedProfilesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profilesRequest = null,Object? selectedLine = freezed,}) {
  return _then(_SavedProfilesState(
profilesRequest: null == profilesRequest ? _self.profilesRequest : profilesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<SavedProfileEntity>>,selectedLine: freezed == selectedLine ? _self.selectedLine : selectedLine // ignore: cast_nullable_to_non_nullable
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
