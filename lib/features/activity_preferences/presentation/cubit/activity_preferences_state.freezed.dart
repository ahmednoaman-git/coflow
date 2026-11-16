// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_preferences_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityPreferencesState implements DiagnosticableTreeMixin {

 AsyncState<ActivityPreferencesEntity> get preferencesRequest; AsyncState<void> get saveRequest;/// The picks being edited, or null while they still match the saved ones.
 Set<int>? get draft;
/// Create a copy of ActivityPreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityPreferencesStateCopyWith<ActivityPreferencesState> get copyWith => _$ActivityPreferencesStateCopyWithImpl<ActivityPreferencesState>(this as ActivityPreferencesState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ActivityPreferencesState'))
    ..add(DiagnosticsProperty('preferencesRequest', preferencesRequest))..add(DiagnosticsProperty('saveRequest', saveRequest))..add(DiagnosticsProperty('draft', draft));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityPreferencesState&&(identical(other.preferencesRequest, preferencesRequest) || other.preferencesRequest == preferencesRequest)&&(identical(other.saveRequest, saveRequest) || other.saveRequest == saveRequest)&&const DeepCollectionEquality().equals(other.draft, draft));
}


@override
int get hashCode => Object.hash(runtimeType,preferencesRequest,saveRequest,const DeepCollectionEquality().hash(draft));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ActivityPreferencesState(preferencesRequest: $preferencesRequest, saveRequest: $saveRequest, draft: $draft)';
}


}

/// @nodoc
abstract mixin class $ActivityPreferencesStateCopyWith<$Res>  {
  factory $ActivityPreferencesStateCopyWith(ActivityPreferencesState value, $Res Function(ActivityPreferencesState) _then) = _$ActivityPreferencesStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<ActivityPreferencesEntity> preferencesRequest, AsyncState<void> saveRequest, Set<int>? draft
});


$AsyncStateCopyWith<ActivityPreferencesEntity, $Res> get preferencesRequest;$AsyncStateCopyWith<void, $Res> get saveRequest;

}
/// @nodoc
class _$ActivityPreferencesStateCopyWithImpl<$Res>
    implements $ActivityPreferencesStateCopyWith<$Res> {
  _$ActivityPreferencesStateCopyWithImpl(this._self, this._then);

  final ActivityPreferencesState _self;
  final $Res Function(ActivityPreferencesState) _then;

/// Create a copy of ActivityPreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? preferencesRequest = null,Object? saveRequest = null,Object? draft = freezed,}) {
  return _then(_self.copyWith(
preferencesRequest: null == preferencesRequest ? _self.preferencesRequest : preferencesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ActivityPreferencesEntity>,saveRequest: null == saveRequest ? _self.saveRequest : saveRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,draft: freezed == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as Set<int>?,
  ));
}
/// Create a copy of ActivityPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ActivityPreferencesEntity, $Res> get preferencesRequest {
  
  return $AsyncStateCopyWith<ActivityPreferencesEntity, $Res>(_self.preferencesRequest, (value) {
    return _then(_self.copyWith(preferencesRequest: value));
  });
}/// Create a copy of ActivityPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get saveRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.saveRequest, (value) {
    return _then(_self.copyWith(saveRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActivityPreferencesState].
extension ActivityPreferencesStatePatterns on ActivityPreferencesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityPreferencesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityPreferencesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityPreferencesState value)  $default,){
final _that = this;
switch (_that) {
case _ActivityPreferencesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityPreferencesState value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityPreferencesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<ActivityPreferencesEntity> preferencesRequest,  AsyncState<void> saveRequest,  Set<int>? draft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityPreferencesState() when $default != null:
return $default(_that.preferencesRequest,_that.saveRequest,_that.draft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<ActivityPreferencesEntity> preferencesRequest,  AsyncState<void> saveRequest,  Set<int>? draft)  $default,) {final _that = this;
switch (_that) {
case _ActivityPreferencesState():
return $default(_that.preferencesRequest,_that.saveRequest,_that.draft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<ActivityPreferencesEntity> preferencesRequest,  AsyncState<void> saveRequest,  Set<int>? draft)?  $default,) {final _that = this;
switch (_that) {
case _ActivityPreferencesState() when $default != null:
return $default(_that.preferencesRequest,_that.saveRequest,_that.draft);case _:
  return null;

}
}

}

/// @nodoc


class _ActivityPreferencesState extends ActivityPreferencesState with DiagnosticableTreeMixin {
  const _ActivityPreferencesState({this.preferencesRequest = const AsyncState.idle(), this.saveRequest = const AsyncState.idle(), final  Set<int>? draft}): _draft = draft,super._();
  

@override@JsonKey() final  AsyncState<ActivityPreferencesEntity> preferencesRequest;
@override@JsonKey() final  AsyncState<void> saveRequest;
/// The picks being edited, or null while they still match the saved ones.
 final  Set<int>? _draft;
/// The picks being edited, or null while they still match the saved ones.
@override Set<int>? get draft {
  final value = _draft;
  if (value == null) return null;
  if (_draft is EqualUnmodifiableSetView) return _draft;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(value);
}


/// Create a copy of ActivityPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityPreferencesStateCopyWith<_ActivityPreferencesState> get copyWith => __$ActivityPreferencesStateCopyWithImpl<_ActivityPreferencesState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ActivityPreferencesState'))
    ..add(DiagnosticsProperty('preferencesRequest', preferencesRequest))..add(DiagnosticsProperty('saveRequest', saveRequest))..add(DiagnosticsProperty('draft', draft));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityPreferencesState&&(identical(other.preferencesRequest, preferencesRequest) || other.preferencesRequest == preferencesRequest)&&(identical(other.saveRequest, saveRequest) || other.saveRequest == saveRequest)&&const DeepCollectionEquality().equals(other._draft, _draft));
}


@override
int get hashCode => Object.hash(runtimeType,preferencesRequest,saveRequest,const DeepCollectionEquality().hash(_draft));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ActivityPreferencesState(preferencesRequest: $preferencesRequest, saveRequest: $saveRequest, draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$ActivityPreferencesStateCopyWith<$Res> implements $ActivityPreferencesStateCopyWith<$Res> {
  factory _$ActivityPreferencesStateCopyWith(_ActivityPreferencesState value, $Res Function(_ActivityPreferencesState) _then) = __$ActivityPreferencesStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<ActivityPreferencesEntity> preferencesRequest, AsyncState<void> saveRequest, Set<int>? draft
});


@override $AsyncStateCopyWith<ActivityPreferencesEntity, $Res> get preferencesRequest;@override $AsyncStateCopyWith<void, $Res> get saveRequest;

}
/// @nodoc
class __$ActivityPreferencesStateCopyWithImpl<$Res>
    implements _$ActivityPreferencesStateCopyWith<$Res> {
  __$ActivityPreferencesStateCopyWithImpl(this._self, this._then);

  final _ActivityPreferencesState _self;
  final $Res Function(_ActivityPreferencesState) _then;

/// Create a copy of ActivityPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? preferencesRequest = null,Object? saveRequest = null,Object? draft = freezed,}) {
  return _then(_ActivityPreferencesState(
preferencesRequest: null == preferencesRequest ? _self.preferencesRequest : preferencesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ActivityPreferencesEntity>,saveRequest: null == saveRequest ? _self.saveRequest : saveRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,draft: freezed == draft ? _self._draft : draft // ignore: cast_nullable_to_non_nullable
as Set<int>?,
  ));
}

/// Create a copy of ActivityPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ActivityPreferencesEntity, $Res> get preferencesRequest {
  
  return $AsyncStateCopyWith<ActivityPreferencesEntity, $Res>(_self.preferencesRequest, (value) {
    return _then(_self.copyWith(preferencesRequest: value));
  });
}/// Create a copy of ActivityPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get saveRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.saveRequest, (value) {
    return _then(_self.copyWith(saveRequest: value));
  });
}
}

// dart format on
