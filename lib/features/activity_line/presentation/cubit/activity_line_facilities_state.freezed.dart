// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_line_facilities_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityLineFacilitiesState {

/// The activity line being displayed.
 ActivityLineEntity get activityLine;/// Async state for facilities request.
 AsyncState<ActivityLineFacilitiesEntity> get facilitiesRequest;/// Async state for locations request.
 AsyncState<LocationsEntity> get locationsRequest;/// Currently selected tag IDs for filtering.
 List<int> get selectedTagIds;/// Selected location for filtering.
 SelectedLocation get selectedLocation;/// Whether the user has confirmed their location selection.
 bool get hasLockedInSelection;
/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityLineFacilitiesStateCopyWith<ActivityLineFacilitiesState> get copyWith => _$ActivityLineFacilitiesStateCopyWithImpl<ActivityLineFacilitiesState>(this as ActivityLineFacilitiesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityLineFacilitiesState&&(identical(other.activityLine, activityLine) || other.activityLine == activityLine)&&(identical(other.facilitiesRequest, facilitiesRequest) || other.facilitiesRequest == facilitiesRequest)&&(identical(other.locationsRequest, locationsRequest) || other.locationsRequest == locationsRequest)&&const DeepCollectionEquality().equals(other.selectedTagIds, selectedTagIds)&&(identical(other.selectedLocation, selectedLocation) || other.selectedLocation == selectedLocation)&&(identical(other.hasLockedInSelection, hasLockedInSelection) || other.hasLockedInSelection == hasLockedInSelection));
}


@override
int get hashCode => Object.hash(runtimeType,activityLine,facilitiesRequest,locationsRequest,const DeepCollectionEquality().hash(selectedTagIds),selectedLocation,hasLockedInSelection);

@override
String toString() {
  return 'ActivityLineFacilitiesState(activityLine: $activityLine, facilitiesRequest: $facilitiesRequest, locationsRequest: $locationsRequest, selectedTagIds: $selectedTagIds, selectedLocation: $selectedLocation, hasLockedInSelection: $hasLockedInSelection)';
}


}

/// @nodoc
abstract mixin class $ActivityLineFacilitiesStateCopyWith<$Res>  {
  factory $ActivityLineFacilitiesStateCopyWith(ActivityLineFacilitiesState value, $Res Function(ActivityLineFacilitiesState) _then) = _$ActivityLineFacilitiesStateCopyWithImpl;
@useResult
$Res call({
 ActivityLineEntity activityLine, AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest, AsyncState<LocationsEntity> locationsRequest, List<int> selectedTagIds, SelectedLocation selectedLocation, bool hasLockedInSelection
});


$ActivityLineEntityCopyWith<$Res> get activityLine;$AsyncStateCopyWith<ActivityLineFacilitiesEntity, $Res> get facilitiesRequest;$AsyncStateCopyWith<LocationsEntity, $Res> get locationsRequest;$SelectedLocationCopyWith<$Res> get selectedLocation;

}
/// @nodoc
class _$ActivityLineFacilitiesStateCopyWithImpl<$Res>
    implements $ActivityLineFacilitiesStateCopyWith<$Res> {
  _$ActivityLineFacilitiesStateCopyWithImpl(this._self, this._then);

  final ActivityLineFacilitiesState _self;
  final $Res Function(ActivityLineFacilitiesState) _then;

/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activityLine = null,Object? facilitiesRequest = null,Object? locationsRequest = null,Object? selectedTagIds = null,Object? selectedLocation = null,Object? hasLockedInSelection = null,}) {
  return _then(_self.copyWith(
activityLine: null == activityLine ? _self.activityLine : activityLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity,facilitiesRequest: null == facilitiesRequest ? _self.facilitiesRequest : facilitiesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ActivityLineFacilitiesEntity>,locationsRequest: null == locationsRequest ? _self.locationsRequest : locationsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<LocationsEntity>,selectedTagIds: null == selectedTagIds ? _self.selectedTagIds : selectedTagIds // ignore: cast_nullable_to_non_nullable
as List<int>,selectedLocation: null == selectedLocation ? _self.selectedLocation : selectedLocation // ignore: cast_nullable_to_non_nullable
as SelectedLocation,hasLockedInSelection: null == hasLockedInSelection ? _self.hasLockedInSelection : hasLockedInSelection // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLineEntityCopyWith<$Res> get activityLine {
  
  return $ActivityLineEntityCopyWith<$Res>(_self.activityLine, (value) {
    return _then(_self.copyWith(activityLine: value));
  });
}/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ActivityLineFacilitiesEntity, $Res> get facilitiesRequest {
  
  return $AsyncStateCopyWith<ActivityLineFacilitiesEntity, $Res>(_self.facilitiesRequest, (value) {
    return _then(_self.copyWith(facilitiesRequest: value));
  });
}/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<LocationsEntity, $Res> get locationsRequest {
  
  return $AsyncStateCopyWith<LocationsEntity, $Res>(_self.locationsRequest, (value) {
    return _then(_self.copyWith(locationsRequest: value));
  });
}/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectedLocationCopyWith<$Res> get selectedLocation {
  
  return $SelectedLocationCopyWith<$Res>(_self.selectedLocation, (value) {
    return _then(_self.copyWith(selectedLocation: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActivityLineFacilitiesState].
extension ActivityLineFacilitiesStatePatterns on ActivityLineFacilitiesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityLineFacilitiesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityLineFacilitiesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityLineFacilitiesState value)  $default,){
final _that = this;
switch (_that) {
case _ActivityLineFacilitiesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityLineFacilitiesState value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityLineFacilitiesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActivityLineEntity activityLine,  AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest,  AsyncState<LocationsEntity> locationsRequest,  List<int> selectedTagIds,  SelectedLocation selectedLocation,  bool hasLockedInSelection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityLineFacilitiesState() when $default != null:
return $default(_that.activityLine,_that.facilitiesRequest,_that.locationsRequest,_that.selectedTagIds,_that.selectedLocation,_that.hasLockedInSelection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActivityLineEntity activityLine,  AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest,  AsyncState<LocationsEntity> locationsRequest,  List<int> selectedTagIds,  SelectedLocation selectedLocation,  bool hasLockedInSelection)  $default,) {final _that = this;
switch (_that) {
case _ActivityLineFacilitiesState():
return $default(_that.activityLine,_that.facilitiesRequest,_that.locationsRequest,_that.selectedTagIds,_that.selectedLocation,_that.hasLockedInSelection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActivityLineEntity activityLine,  AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest,  AsyncState<LocationsEntity> locationsRequest,  List<int> selectedTagIds,  SelectedLocation selectedLocation,  bool hasLockedInSelection)?  $default,) {final _that = this;
switch (_that) {
case _ActivityLineFacilitiesState() when $default != null:
return $default(_that.activityLine,_that.facilitiesRequest,_that.locationsRequest,_that.selectedTagIds,_that.selectedLocation,_that.hasLockedInSelection);case _:
  return null;

}
}

}

/// @nodoc


class _ActivityLineFacilitiesState extends ActivityLineFacilitiesState {
  const _ActivityLineFacilitiesState({required this.activityLine, this.facilitiesRequest = const AsyncState.idle(), this.locationsRequest = const AsyncState.idle(), final  List<int> selectedTagIds = const [], this.selectedLocation = const SelectedLocation(), this.hasLockedInSelection = false}): _selectedTagIds = selectedTagIds,super._();
  

/// The activity line being displayed.
@override final  ActivityLineEntity activityLine;
/// Async state for facilities request.
@override@JsonKey() final  AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest;
/// Async state for locations request.
@override@JsonKey() final  AsyncState<LocationsEntity> locationsRequest;
/// Currently selected tag IDs for filtering.
 final  List<int> _selectedTagIds;
/// Currently selected tag IDs for filtering.
@override@JsonKey() List<int> get selectedTagIds {
  if (_selectedTagIds is EqualUnmodifiableListView) return _selectedTagIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedTagIds);
}

/// Selected location for filtering.
@override@JsonKey() final  SelectedLocation selectedLocation;
/// Whether the user has confirmed their location selection.
@override@JsonKey() final  bool hasLockedInSelection;

/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityLineFacilitiesStateCopyWith<_ActivityLineFacilitiesState> get copyWith => __$ActivityLineFacilitiesStateCopyWithImpl<_ActivityLineFacilitiesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityLineFacilitiesState&&(identical(other.activityLine, activityLine) || other.activityLine == activityLine)&&(identical(other.facilitiesRequest, facilitiesRequest) || other.facilitiesRequest == facilitiesRequest)&&(identical(other.locationsRequest, locationsRequest) || other.locationsRequest == locationsRequest)&&const DeepCollectionEquality().equals(other._selectedTagIds, _selectedTagIds)&&(identical(other.selectedLocation, selectedLocation) || other.selectedLocation == selectedLocation)&&(identical(other.hasLockedInSelection, hasLockedInSelection) || other.hasLockedInSelection == hasLockedInSelection));
}


@override
int get hashCode => Object.hash(runtimeType,activityLine,facilitiesRequest,locationsRequest,const DeepCollectionEquality().hash(_selectedTagIds),selectedLocation,hasLockedInSelection);

@override
String toString() {
  return 'ActivityLineFacilitiesState(activityLine: $activityLine, facilitiesRequest: $facilitiesRequest, locationsRequest: $locationsRequest, selectedTagIds: $selectedTagIds, selectedLocation: $selectedLocation, hasLockedInSelection: $hasLockedInSelection)';
}


}

/// @nodoc
abstract mixin class _$ActivityLineFacilitiesStateCopyWith<$Res> implements $ActivityLineFacilitiesStateCopyWith<$Res> {
  factory _$ActivityLineFacilitiesStateCopyWith(_ActivityLineFacilitiesState value, $Res Function(_ActivityLineFacilitiesState) _then) = __$ActivityLineFacilitiesStateCopyWithImpl;
@override @useResult
$Res call({
 ActivityLineEntity activityLine, AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest, AsyncState<LocationsEntity> locationsRequest, List<int> selectedTagIds, SelectedLocation selectedLocation, bool hasLockedInSelection
});


@override $ActivityLineEntityCopyWith<$Res> get activityLine;@override $AsyncStateCopyWith<ActivityLineFacilitiesEntity, $Res> get facilitiesRequest;@override $AsyncStateCopyWith<LocationsEntity, $Res> get locationsRequest;@override $SelectedLocationCopyWith<$Res> get selectedLocation;

}
/// @nodoc
class __$ActivityLineFacilitiesStateCopyWithImpl<$Res>
    implements _$ActivityLineFacilitiesStateCopyWith<$Res> {
  __$ActivityLineFacilitiesStateCopyWithImpl(this._self, this._then);

  final _ActivityLineFacilitiesState _self;
  final $Res Function(_ActivityLineFacilitiesState) _then;

/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activityLine = null,Object? facilitiesRequest = null,Object? locationsRequest = null,Object? selectedTagIds = null,Object? selectedLocation = null,Object? hasLockedInSelection = null,}) {
  return _then(_ActivityLineFacilitiesState(
activityLine: null == activityLine ? _self.activityLine : activityLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity,facilitiesRequest: null == facilitiesRequest ? _self.facilitiesRequest : facilitiesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ActivityLineFacilitiesEntity>,locationsRequest: null == locationsRequest ? _self.locationsRequest : locationsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<LocationsEntity>,selectedTagIds: null == selectedTagIds ? _self._selectedTagIds : selectedTagIds // ignore: cast_nullable_to_non_nullable
as List<int>,selectedLocation: null == selectedLocation ? _self.selectedLocation : selectedLocation // ignore: cast_nullable_to_non_nullable
as SelectedLocation,hasLockedInSelection: null == hasLockedInSelection ? _self.hasLockedInSelection : hasLockedInSelection // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLineEntityCopyWith<$Res> get activityLine {
  
  return $ActivityLineEntityCopyWith<$Res>(_self.activityLine, (value) {
    return _then(_self.copyWith(activityLine: value));
  });
}/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ActivityLineFacilitiesEntity, $Res> get facilitiesRequest {
  
  return $AsyncStateCopyWith<ActivityLineFacilitiesEntity, $Res>(_self.facilitiesRequest, (value) {
    return _then(_self.copyWith(facilitiesRequest: value));
  });
}/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<LocationsEntity, $Res> get locationsRequest {
  
  return $AsyncStateCopyWith<LocationsEntity, $Res>(_self.locationsRequest, (value) {
    return _then(_self.copyWith(locationsRequest: value));
  });
}/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelectedLocationCopyWith<$Res> get selectedLocation {
  
  return $SelectedLocationCopyWith<$Res>(_self.selectedLocation, (value) {
    return _then(_self.copyWith(selectedLocation: value));
  });
}
}

// dart format on
