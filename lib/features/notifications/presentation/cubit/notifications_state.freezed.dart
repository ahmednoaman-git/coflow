// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsState {

 AsyncState<List<AppNotificationEntity>> get notificationsRequest;
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsStateCopyWith<NotificationsState> get copyWith => _$NotificationsStateCopyWithImpl<NotificationsState>(this as NotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState&&(identical(other.notificationsRequest, notificationsRequest) || other.notificationsRequest == notificationsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,notificationsRequest);

@override
String toString() {
  return 'NotificationsState(notificationsRequest: $notificationsRequest)';
}


}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res>  {
  factory $NotificationsStateCopyWith(NotificationsState value, $Res Function(NotificationsState) _then) = _$NotificationsStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<List<AppNotificationEntity>> notificationsRequest
});


$AsyncStateCopyWith<List<AppNotificationEntity>, $Res> get notificationsRequest;

}
/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notificationsRequest = null,}) {
  return _then(_self.copyWith(
notificationsRequest: null == notificationsRequest ? _self.notificationsRequest : notificationsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<AppNotificationEntity>>,
  ));
}
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<AppNotificationEntity>, $Res> get notificationsRequest {
  
  return $AsyncStateCopyWith<List<AppNotificationEntity>, $Res>(_self.notificationsRequest, (value) {
    return _then(_self.copyWith(notificationsRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<List<AppNotificationEntity>> notificationsRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.notificationsRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<List<AppNotificationEntity>> notificationsRequest)  $default,) {final _that = this;
switch (_that) {
case _NotificationsState():
return $default(_that.notificationsRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<List<AppNotificationEntity>> notificationsRequest)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.notificationsRequest);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsState implements NotificationsState {
  const _NotificationsState({this.notificationsRequest = const AsyncState.idle()});
  

@override@JsonKey() final  AsyncState<List<AppNotificationEntity>> notificationsRequest;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsStateCopyWith<_NotificationsState> get copyWith => __$NotificationsStateCopyWithImpl<_NotificationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsState&&(identical(other.notificationsRequest, notificationsRequest) || other.notificationsRequest == notificationsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,notificationsRequest);

@override
String toString() {
  return 'NotificationsState(notificationsRequest: $notificationsRequest)';
}


}

/// @nodoc
abstract mixin class _$NotificationsStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsStateCopyWith(_NotificationsState value, $Res Function(_NotificationsState) _then) = __$NotificationsStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<List<AppNotificationEntity>> notificationsRequest
});


@override $AsyncStateCopyWith<List<AppNotificationEntity>, $Res> get notificationsRequest;

}
/// @nodoc
class __$NotificationsStateCopyWithImpl<$Res>
    implements _$NotificationsStateCopyWith<$Res> {
  __$NotificationsStateCopyWithImpl(this._self, this._then);

  final _NotificationsState _self;
  final $Res Function(_NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notificationsRequest = null,}) {
  return _then(_NotificationsState(
notificationsRequest: null == notificationsRequest ? _self.notificationsRequest : notificationsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<AppNotificationEntity>>,
  ));
}

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<AppNotificationEntity>, $Res> get notificationsRequest {
  
  return $AsyncStateCopyWith<List<AppNotificationEntity>, $Res>(_self.notificationsRequest, (value) {
    return _then(_self.copyWith(notificationsRequest: value));
  });
}
}

/// @nodoc
mixin _$NotificationsBadgeState {

 AsyncState<bool> get unseenRequest;
/// Create a copy of NotificationsBadgeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsBadgeStateCopyWith<NotificationsBadgeState> get copyWith => _$NotificationsBadgeStateCopyWithImpl<NotificationsBadgeState>(this as NotificationsBadgeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsBadgeState&&(identical(other.unseenRequest, unseenRequest) || other.unseenRequest == unseenRequest));
}


@override
int get hashCode => Object.hash(runtimeType,unseenRequest);

@override
String toString() {
  return 'NotificationsBadgeState(unseenRequest: $unseenRequest)';
}


}

/// @nodoc
abstract mixin class $NotificationsBadgeStateCopyWith<$Res>  {
  factory $NotificationsBadgeStateCopyWith(NotificationsBadgeState value, $Res Function(NotificationsBadgeState) _then) = _$NotificationsBadgeStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<bool> unseenRequest
});


$AsyncStateCopyWith<bool, $Res> get unseenRequest;

}
/// @nodoc
class _$NotificationsBadgeStateCopyWithImpl<$Res>
    implements $NotificationsBadgeStateCopyWith<$Res> {
  _$NotificationsBadgeStateCopyWithImpl(this._self, this._then);

  final NotificationsBadgeState _self;
  final $Res Function(NotificationsBadgeState) _then;

/// Create a copy of NotificationsBadgeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unseenRequest = null,}) {
  return _then(_self.copyWith(
unseenRequest: null == unseenRequest ? _self.unseenRequest : unseenRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<bool>,
  ));
}
/// Create a copy of NotificationsBadgeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<bool, $Res> get unseenRequest {
  
  return $AsyncStateCopyWith<bool, $Res>(_self.unseenRequest, (value) {
    return _then(_self.copyWith(unseenRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationsBadgeState].
extension NotificationsBadgeStatePatterns on NotificationsBadgeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsBadgeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsBadgeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsBadgeState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsBadgeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsBadgeState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsBadgeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<bool> unseenRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsBadgeState() when $default != null:
return $default(_that.unseenRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<bool> unseenRequest)  $default,) {final _that = this;
switch (_that) {
case _NotificationsBadgeState():
return $default(_that.unseenRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<bool> unseenRequest)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsBadgeState() when $default != null:
return $default(_that.unseenRequest);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsBadgeState implements NotificationsBadgeState {
  const _NotificationsBadgeState({this.unseenRequest = const AsyncState.idle()});
  

@override@JsonKey() final  AsyncState<bool> unseenRequest;

/// Create a copy of NotificationsBadgeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsBadgeStateCopyWith<_NotificationsBadgeState> get copyWith => __$NotificationsBadgeStateCopyWithImpl<_NotificationsBadgeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsBadgeState&&(identical(other.unseenRequest, unseenRequest) || other.unseenRequest == unseenRequest));
}


@override
int get hashCode => Object.hash(runtimeType,unseenRequest);

@override
String toString() {
  return 'NotificationsBadgeState(unseenRequest: $unseenRequest)';
}


}

/// @nodoc
abstract mixin class _$NotificationsBadgeStateCopyWith<$Res> implements $NotificationsBadgeStateCopyWith<$Res> {
  factory _$NotificationsBadgeStateCopyWith(_NotificationsBadgeState value, $Res Function(_NotificationsBadgeState) _then) = __$NotificationsBadgeStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<bool> unseenRequest
});


@override $AsyncStateCopyWith<bool, $Res> get unseenRequest;

}
/// @nodoc
class __$NotificationsBadgeStateCopyWithImpl<$Res>
    implements _$NotificationsBadgeStateCopyWith<$Res> {
  __$NotificationsBadgeStateCopyWithImpl(this._self, this._then);

  final _NotificationsBadgeState _self;
  final $Res Function(_NotificationsBadgeState) _then;

/// Create a copy of NotificationsBadgeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unseenRequest = null,}) {
  return _then(_NotificationsBadgeState(
unseenRequest: null == unseenRequest ? _self.unseenRequest : unseenRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<bool>,
  ));
}

/// Create a copy of NotificationsBadgeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<bool, $Res> get unseenRequest {
  
  return $AsyncStateCopyWith<bool, $Res>(_self.unseenRequest, (value) {
    return _then(_self.copyWith(unseenRequest: value));
  });
}
}

// dart format on
