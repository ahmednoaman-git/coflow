// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarState {

/// First day of the loaded window, inclusive — always today, since past
/// reservations are not browsable.
 DateTime get windowStart;/// Last day of the loaded window, inclusive.
 DateTime get windowEnd;/// The day the user picked, or null before they pick one — the screen then
/// opens on the first day carrying a reservation, see [focusedDay].
 DateTime? get selectedDay; AsyncState<ReservationCalendarEntity> get calendarRequest;
/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarStateCopyWith<CalendarState> get copyWith => _$CalendarStateCopyWithImpl<CalendarState>(this as CalendarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarState&&(identical(other.windowStart, windowStart) || other.windowStart == windowStart)&&(identical(other.windowEnd, windowEnd) || other.windowEnd == windowEnd)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.calendarRequest, calendarRequest) || other.calendarRequest == calendarRequest));
}


@override
int get hashCode => Object.hash(runtimeType,windowStart,windowEnd,selectedDay,calendarRequest);

@override
String toString() {
  return 'CalendarState(windowStart: $windowStart, windowEnd: $windowEnd, selectedDay: $selectedDay, calendarRequest: $calendarRequest)';
}


}

/// @nodoc
abstract mixin class $CalendarStateCopyWith<$Res>  {
  factory $CalendarStateCopyWith(CalendarState value, $Res Function(CalendarState) _then) = _$CalendarStateCopyWithImpl;
@useResult
$Res call({
 DateTime windowStart, DateTime windowEnd, DateTime? selectedDay, AsyncState<ReservationCalendarEntity> calendarRequest
});


$AsyncStateCopyWith<ReservationCalendarEntity, $Res> get calendarRequest;

}
/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._self, this._then);

  final CalendarState _self;
  final $Res Function(CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? windowStart = null,Object? windowEnd = null,Object? selectedDay = freezed,Object? calendarRequest = null,}) {
  return _then(_self.copyWith(
windowStart: null == windowStart ? _self.windowStart : windowStart // ignore: cast_nullable_to_non_nullable
as DateTime,windowEnd: null == windowEnd ? _self.windowEnd : windowEnd // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: freezed == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime?,calendarRequest: null == calendarRequest ? _self.calendarRequest : calendarRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ReservationCalendarEntity>,
  ));
}
/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ReservationCalendarEntity, $Res> get calendarRequest {
  
  return $AsyncStateCopyWith<ReservationCalendarEntity, $Res>(_self.calendarRequest, (value) {
    return _then(_self.copyWith(calendarRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [CalendarState].
extension CalendarStatePatterns on CalendarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarState value)  $default,){
final _that = this;
switch (_that) {
case _CalendarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarState value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime windowStart,  DateTime windowEnd,  DateTime? selectedDay,  AsyncState<ReservationCalendarEntity> calendarRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.windowStart,_that.windowEnd,_that.selectedDay,_that.calendarRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime windowStart,  DateTime windowEnd,  DateTime? selectedDay,  AsyncState<ReservationCalendarEntity> calendarRequest)  $default,) {final _that = this;
switch (_that) {
case _CalendarState():
return $default(_that.windowStart,_that.windowEnd,_that.selectedDay,_that.calendarRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime windowStart,  DateTime windowEnd,  DateTime? selectedDay,  AsyncState<ReservationCalendarEntity> calendarRequest)?  $default,) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.windowStart,_that.windowEnd,_that.selectedDay,_that.calendarRequest);case _:
  return null;

}
}

}

/// @nodoc


class _CalendarState extends CalendarState {
  const _CalendarState({required this.windowStart, required this.windowEnd, this.selectedDay, this.calendarRequest = const AsyncState.idle()}): super._();
  

/// First day of the loaded window, inclusive — always today, since past
/// reservations are not browsable.
@override final  DateTime windowStart;
/// Last day of the loaded window, inclusive.
@override final  DateTime windowEnd;
/// The day the user picked, or null before they pick one — the screen then
/// opens on the first day carrying a reservation, see [focusedDay].
@override final  DateTime? selectedDay;
@override@JsonKey() final  AsyncState<ReservationCalendarEntity> calendarRequest;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarStateCopyWith<_CalendarState> get copyWith => __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarState&&(identical(other.windowStart, windowStart) || other.windowStart == windowStart)&&(identical(other.windowEnd, windowEnd) || other.windowEnd == windowEnd)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.calendarRequest, calendarRequest) || other.calendarRequest == calendarRequest));
}


@override
int get hashCode => Object.hash(runtimeType,windowStart,windowEnd,selectedDay,calendarRequest);

@override
String toString() {
  return 'CalendarState(windowStart: $windowStart, windowEnd: $windowEnd, selectedDay: $selectedDay, calendarRequest: $calendarRequest)';
}


}

/// @nodoc
abstract mixin class _$CalendarStateCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(_CalendarState value, $Res Function(_CalendarState) _then) = __$CalendarStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime windowStart, DateTime windowEnd, DateTime? selectedDay, AsyncState<ReservationCalendarEntity> calendarRequest
});


@override $AsyncStateCopyWith<ReservationCalendarEntity, $Res> get calendarRequest;

}
/// @nodoc
class __$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(this._self, this._then);

  final _CalendarState _self;
  final $Res Function(_CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? windowStart = null,Object? windowEnd = null,Object? selectedDay = freezed,Object? calendarRequest = null,}) {
  return _then(_CalendarState(
windowStart: null == windowStart ? _self.windowStart : windowStart // ignore: cast_nullable_to_non_nullable
as DateTime,windowEnd: null == windowEnd ? _self.windowEnd : windowEnd // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: freezed == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime?,calendarRequest: null == calendarRequest ? _self.calendarRequest : calendarRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ReservationCalendarEntity>,
  ));
}

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ReservationCalendarEntity, $Res> get calendarRequest {
  
  return $AsyncStateCopyWith<ReservationCalendarEntity, $Res>(_self.calendarRequest, (value) {
    return _then(_self.copyWith(calendarRequest: value));
  });
}
}

// dart format on
