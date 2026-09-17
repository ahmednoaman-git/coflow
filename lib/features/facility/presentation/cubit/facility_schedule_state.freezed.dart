// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityScheduleState {

/// The day whose sessions the timeline is showing.
 DateTime get selectedDay;/// First day of the loaded window, inclusive — also the first day chip.
 DateTime get windowStart;/// Last day of the loaded window, inclusive.
 DateTime get windowEnd; FacilityServiceType get selectedType; AsyncState<FacilityScheduleEntity> get scheduleRequest;
/// Create a copy of FacilityScheduleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityScheduleStateCopyWith<FacilityScheduleState> get copyWith => _$FacilityScheduleStateCopyWithImpl<FacilityScheduleState>(this as FacilityScheduleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityScheduleState&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.windowStart, windowStart) || other.windowStart == windowStart)&&(identical(other.windowEnd, windowEnd) || other.windowEnd == windowEnd)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.scheduleRequest, scheduleRequest) || other.scheduleRequest == scheduleRequest));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDay,windowStart,windowEnd,selectedType,scheduleRequest);

@override
String toString() {
  return 'FacilityScheduleState(selectedDay: $selectedDay, windowStart: $windowStart, windowEnd: $windowEnd, selectedType: $selectedType, scheduleRequest: $scheduleRequest)';
}


}

/// @nodoc
abstract mixin class $FacilityScheduleStateCopyWith<$Res>  {
  factory $FacilityScheduleStateCopyWith(FacilityScheduleState value, $Res Function(FacilityScheduleState) _then) = _$FacilityScheduleStateCopyWithImpl;
@useResult
$Res call({
 DateTime selectedDay, DateTime windowStart, DateTime windowEnd, FacilityServiceType selectedType, AsyncState<FacilityScheduleEntity> scheduleRequest
});


$AsyncStateCopyWith<FacilityScheduleEntity, $Res> get scheduleRequest;

}
/// @nodoc
class _$FacilityScheduleStateCopyWithImpl<$Res>
    implements $FacilityScheduleStateCopyWith<$Res> {
  _$FacilityScheduleStateCopyWithImpl(this._self, this._then);

  final FacilityScheduleState _self;
  final $Res Function(FacilityScheduleState) _then;

/// Create a copy of FacilityScheduleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDay = null,Object? windowStart = null,Object? windowEnd = null,Object? selectedType = null,Object? scheduleRequest = null,}) {
  return _then(_self.copyWith(
selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,windowStart: null == windowStart ? _self.windowStart : windowStart // ignore: cast_nullable_to_non_nullable
as DateTime,windowEnd: null == windowEnd ? _self.windowEnd : windowEnd // ignore: cast_nullable_to_non_nullable
as DateTime,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as FacilityServiceType,scheduleRequest: null == scheduleRequest ? _self.scheduleRequest : scheduleRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilityScheduleEntity>,
  ));
}
/// Create a copy of FacilityScheduleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilityScheduleEntity, $Res> get scheduleRequest {
  
  return $AsyncStateCopyWith<FacilityScheduleEntity, $Res>(_self.scheduleRequest, (value) {
    return _then(_self.copyWith(scheduleRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [FacilityScheduleState].
extension FacilityScheduleStatePatterns on FacilityScheduleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityScheduleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityScheduleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityScheduleState value)  $default,){
final _that = this;
switch (_that) {
case _FacilityScheduleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityScheduleState value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityScheduleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime selectedDay,  DateTime windowStart,  DateTime windowEnd,  FacilityServiceType selectedType,  AsyncState<FacilityScheduleEntity> scheduleRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityScheduleState() when $default != null:
return $default(_that.selectedDay,_that.windowStart,_that.windowEnd,_that.selectedType,_that.scheduleRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime selectedDay,  DateTime windowStart,  DateTime windowEnd,  FacilityServiceType selectedType,  AsyncState<FacilityScheduleEntity> scheduleRequest)  $default,) {final _that = this;
switch (_that) {
case _FacilityScheduleState():
return $default(_that.selectedDay,_that.windowStart,_that.windowEnd,_that.selectedType,_that.scheduleRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime selectedDay,  DateTime windowStart,  DateTime windowEnd,  FacilityServiceType selectedType,  AsyncState<FacilityScheduleEntity> scheduleRequest)?  $default,) {final _that = this;
switch (_that) {
case _FacilityScheduleState() when $default != null:
return $default(_that.selectedDay,_that.windowStart,_that.windowEnd,_that.selectedType,_that.scheduleRequest);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityScheduleState extends FacilityScheduleState {
  const _FacilityScheduleState({required this.selectedDay, required this.windowStart, required this.windowEnd, required this.selectedType, this.scheduleRequest = const AsyncState.idle()}): super._();
  

/// The day whose sessions the timeline is showing.
@override final  DateTime selectedDay;
/// First day of the loaded window, inclusive — also the first day chip.
@override final  DateTime windowStart;
/// Last day of the loaded window, inclusive.
@override final  DateTime windowEnd;
@override final  FacilityServiceType selectedType;
@override@JsonKey() final  AsyncState<FacilityScheduleEntity> scheduleRequest;

/// Create a copy of FacilityScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityScheduleStateCopyWith<_FacilityScheduleState> get copyWith => __$FacilityScheduleStateCopyWithImpl<_FacilityScheduleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityScheduleState&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.windowStart, windowStart) || other.windowStart == windowStart)&&(identical(other.windowEnd, windowEnd) || other.windowEnd == windowEnd)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.scheduleRequest, scheduleRequest) || other.scheduleRequest == scheduleRequest));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDay,windowStart,windowEnd,selectedType,scheduleRequest);

@override
String toString() {
  return 'FacilityScheduleState(selectedDay: $selectedDay, windowStart: $windowStart, windowEnd: $windowEnd, selectedType: $selectedType, scheduleRequest: $scheduleRequest)';
}


}

/// @nodoc
abstract mixin class _$FacilityScheduleStateCopyWith<$Res> implements $FacilityScheduleStateCopyWith<$Res> {
  factory _$FacilityScheduleStateCopyWith(_FacilityScheduleState value, $Res Function(_FacilityScheduleState) _then) = __$FacilityScheduleStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime selectedDay, DateTime windowStart, DateTime windowEnd, FacilityServiceType selectedType, AsyncState<FacilityScheduleEntity> scheduleRequest
});


@override $AsyncStateCopyWith<FacilityScheduleEntity, $Res> get scheduleRequest;

}
/// @nodoc
class __$FacilityScheduleStateCopyWithImpl<$Res>
    implements _$FacilityScheduleStateCopyWith<$Res> {
  __$FacilityScheduleStateCopyWithImpl(this._self, this._then);

  final _FacilityScheduleState _self;
  final $Res Function(_FacilityScheduleState) _then;

/// Create a copy of FacilityScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDay = null,Object? windowStart = null,Object? windowEnd = null,Object? selectedType = null,Object? scheduleRequest = null,}) {
  return _then(_FacilityScheduleState(
selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,windowStart: null == windowStart ? _self.windowStart : windowStart // ignore: cast_nullable_to_non_nullable
as DateTime,windowEnd: null == windowEnd ? _self.windowEnd : windowEnd // ignore: cast_nullable_to_non_nullable
as DateTime,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as FacilityServiceType,scheduleRequest: null == scheduleRequest ? _self.scheduleRequest : scheduleRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilityScheduleEntity>,
  ));
}

/// Create a copy of FacilityScheduleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilityScheduleEntity, $Res> get scheduleRequest {
  
  return $AsyncStateCopyWith<FacilityScheduleEntity, $Res>(_self.scheduleRequest, (value) {
    return _then(_self.copyWith(scheduleRequest: value));
  });
}
}

// dart format on
