// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_schedule_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityScheduleEntity {

 DateTime get windowStart; DateTime get windowEnd;/// Chronologically sorted across the whole window.
 List<FacilitySessionEntity> get sessions;
/// Create a copy of FacilityScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityScheduleEntityCopyWith<FacilityScheduleEntity> get copyWith => _$FacilityScheduleEntityCopyWithImpl<FacilityScheduleEntity>(this as FacilityScheduleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityScheduleEntity&&(identical(other.windowStart, windowStart) || other.windowStart == windowStart)&&(identical(other.windowEnd, windowEnd) || other.windowEnd == windowEnd)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}


@override
int get hashCode => Object.hash(runtimeType,windowStart,windowEnd,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'FacilityScheduleEntity(windowStart: $windowStart, windowEnd: $windowEnd, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $FacilityScheduleEntityCopyWith<$Res>  {
  factory $FacilityScheduleEntityCopyWith(FacilityScheduleEntity value, $Res Function(FacilityScheduleEntity) _then) = _$FacilityScheduleEntityCopyWithImpl;
@useResult
$Res call({
 DateTime windowStart, DateTime windowEnd, List<FacilitySessionEntity> sessions
});




}
/// @nodoc
class _$FacilityScheduleEntityCopyWithImpl<$Res>
    implements $FacilityScheduleEntityCopyWith<$Res> {
  _$FacilityScheduleEntityCopyWithImpl(this._self, this._then);

  final FacilityScheduleEntity _self;
  final $Res Function(FacilityScheduleEntity) _then;

/// Create a copy of FacilityScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? windowStart = null,Object? windowEnd = null,Object? sessions = null,}) {
  return _then(_self.copyWith(
windowStart: null == windowStart ? _self.windowStart : windowStart // ignore: cast_nullable_to_non_nullable
as DateTime,windowEnd: null == windowEnd ? _self.windowEnd : windowEnd // ignore: cast_nullable_to_non_nullable
as DateTime,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<FacilitySessionEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityScheduleEntity].
extension FacilityScheduleEntityPatterns on FacilityScheduleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityScheduleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityScheduleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityScheduleEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityScheduleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityScheduleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityScheduleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime windowStart,  DateTime windowEnd,  List<FacilitySessionEntity> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityScheduleEntity() when $default != null:
return $default(_that.windowStart,_that.windowEnd,_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime windowStart,  DateTime windowEnd,  List<FacilitySessionEntity> sessions)  $default,) {final _that = this;
switch (_that) {
case _FacilityScheduleEntity():
return $default(_that.windowStart,_that.windowEnd,_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime windowStart,  DateTime windowEnd,  List<FacilitySessionEntity> sessions)?  $default,) {final _that = this;
switch (_that) {
case _FacilityScheduleEntity() when $default != null:
return $default(_that.windowStart,_that.windowEnd,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityScheduleEntity extends FacilityScheduleEntity {
  const _FacilityScheduleEntity({required this.windowStart, required this.windowEnd, required final  List<FacilitySessionEntity> sessions}): _sessions = sessions,super._();
  

@override final  DateTime windowStart;
@override final  DateTime windowEnd;
/// Chronologically sorted across the whole window.
 final  List<FacilitySessionEntity> _sessions;
/// Chronologically sorted across the whole window.
@override List<FacilitySessionEntity> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of FacilityScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityScheduleEntityCopyWith<_FacilityScheduleEntity> get copyWith => __$FacilityScheduleEntityCopyWithImpl<_FacilityScheduleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityScheduleEntity&&(identical(other.windowStart, windowStart) || other.windowStart == windowStart)&&(identical(other.windowEnd, windowEnd) || other.windowEnd == windowEnd)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}


@override
int get hashCode => Object.hash(runtimeType,windowStart,windowEnd,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'FacilityScheduleEntity(windowStart: $windowStart, windowEnd: $windowEnd, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$FacilityScheduleEntityCopyWith<$Res> implements $FacilityScheduleEntityCopyWith<$Res> {
  factory _$FacilityScheduleEntityCopyWith(_FacilityScheduleEntity value, $Res Function(_FacilityScheduleEntity) _then) = __$FacilityScheduleEntityCopyWithImpl;
@override @useResult
$Res call({
 DateTime windowStart, DateTime windowEnd, List<FacilitySessionEntity> sessions
});




}
/// @nodoc
class __$FacilityScheduleEntityCopyWithImpl<$Res>
    implements _$FacilityScheduleEntityCopyWith<$Res> {
  __$FacilityScheduleEntityCopyWithImpl(this._self, this._then);

  final _FacilityScheduleEntity _self;
  final $Res Function(_FacilityScheduleEntity) _then;

/// Create a copy of FacilityScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? windowStart = null,Object? windowEnd = null,Object? sessions = null,}) {
  return _then(_FacilityScheduleEntity(
windowStart: null == windowStart ? _self.windowStart : windowStart // ignore: cast_nullable_to_non_nullable
as DateTime,windowEnd: null == windowEnd ? _self.windowEnd : windowEnd // ignore: cast_nullable_to_non_nullable
as DateTime,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<FacilitySessionEntity>,
  ));
}


}

// dart format on
