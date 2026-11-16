// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snackbar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SnackbarState {

/// The snackbar on screen, if any.
 SnackbarItem? get current;/// Snackbars waiting their turn, oldest first.
 List<SnackbarItem> get queue;
/// Create a copy of SnackbarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnackbarStateCopyWith<SnackbarState> get copyWith => _$SnackbarStateCopyWithImpl<SnackbarState>(this as SnackbarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnackbarState&&(identical(other.current, current) || other.current == current)&&const DeepCollectionEquality().equals(other.queue, queue));
}


@override
int get hashCode => Object.hash(runtimeType,current,const DeepCollectionEquality().hash(queue));

@override
String toString() {
  return 'SnackbarState(current: $current, queue: $queue)';
}


}

/// @nodoc
abstract mixin class $SnackbarStateCopyWith<$Res>  {
  factory $SnackbarStateCopyWith(SnackbarState value, $Res Function(SnackbarState) _then) = _$SnackbarStateCopyWithImpl;
@useResult
$Res call({
 SnackbarItem? current, List<SnackbarItem> queue
});


$SnackbarItemCopyWith<$Res>? get current;

}
/// @nodoc
class _$SnackbarStateCopyWithImpl<$Res>
    implements $SnackbarStateCopyWith<$Res> {
  _$SnackbarStateCopyWithImpl(this._self, this._then);

  final SnackbarState _self;
  final $Res Function(SnackbarState) _then;

/// Create a copy of SnackbarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = freezed,Object? queue = null,}) {
  return _then(_self.copyWith(
current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as SnackbarItem?,queue: null == queue ? _self.queue : queue // ignore: cast_nullable_to_non_nullable
as List<SnackbarItem>,
  ));
}
/// Create a copy of SnackbarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnackbarItemCopyWith<$Res>? get current {
    if (_self.current == null) {
    return null;
  }

  return $SnackbarItemCopyWith<$Res>(_self.current!, (value) {
    return _then(_self.copyWith(current: value));
  });
}
}


/// Adds pattern-matching-related methods to [SnackbarState].
extension SnackbarStatePatterns on SnackbarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnackbarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnackbarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnackbarState value)  $default,){
final _that = this;
switch (_that) {
case _SnackbarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnackbarState value)?  $default,){
final _that = this;
switch (_that) {
case _SnackbarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SnackbarItem? current,  List<SnackbarItem> queue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnackbarState() when $default != null:
return $default(_that.current,_that.queue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SnackbarItem? current,  List<SnackbarItem> queue)  $default,) {final _that = this;
switch (_that) {
case _SnackbarState():
return $default(_that.current,_that.queue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SnackbarItem? current,  List<SnackbarItem> queue)?  $default,) {final _that = this;
switch (_that) {
case _SnackbarState() when $default != null:
return $default(_that.current,_that.queue);case _:
  return null;

}
}

}

/// @nodoc


class _SnackbarState implements SnackbarState {
  const _SnackbarState({this.current, final  List<SnackbarItem> queue = const <SnackbarItem>[]}): _queue = queue;
  

/// The snackbar on screen, if any.
@override final  SnackbarItem? current;
/// Snackbars waiting their turn, oldest first.
 final  List<SnackbarItem> _queue;
/// Snackbars waiting their turn, oldest first.
@override@JsonKey() List<SnackbarItem> get queue {
  if (_queue is EqualUnmodifiableListView) return _queue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queue);
}


/// Create a copy of SnackbarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnackbarStateCopyWith<_SnackbarState> get copyWith => __$SnackbarStateCopyWithImpl<_SnackbarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnackbarState&&(identical(other.current, current) || other.current == current)&&const DeepCollectionEquality().equals(other._queue, _queue));
}


@override
int get hashCode => Object.hash(runtimeType,current,const DeepCollectionEquality().hash(_queue));

@override
String toString() {
  return 'SnackbarState(current: $current, queue: $queue)';
}


}

/// @nodoc
abstract mixin class _$SnackbarStateCopyWith<$Res> implements $SnackbarStateCopyWith<$Res> {
  factory _$SnackbarStateCopyWith(_SnackbarState value, $Res Function(_SnackbarState) _then) = __$SnackbarStateCopyWithImpl;
@override @useResult
$Res call({
 SnackbarItem? current, List<SnackbarItem> queue
});


@override $SnackbarItemCopyWith<$Res>? get current;

}
/// @nodoc
class __$SnackbarStateCopyWithImpl<$Res>
    implements _$SnackbarStateCopyWith<$Res> {
  __$SnackbarStateCopyWithImpl(this._self, this._then);

  final _SnackbarState _self;
  final $Res Function(_SnackbarState) _then;

/// Create a copy of SnackbarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = freezed,Object? queue = null,}) {
  return _then(_SnackbarState(
current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as SnackbarItem?,queue: null == queue ? _self._queue : queue // ignore: cast_nullable_to_non_nullable
as List<SnackbarItem>,
  ));
}

/// Create a copy of SnackbarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnackbarItemCopyWith<$Res>? get current {
    if (_self.current == null) {
    return null;
  }

  return $SnackbarItemCopyWith<$Res>(_self.current!, (value) {
    return _then(_self.copyWith(current: value));
  });
}
}

// dart format on
