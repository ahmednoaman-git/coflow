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
 AsyncState<ActivityLineFacilitiesEntity> get facilitiesRequest; AsyncState<void> get nextPageRequest;/// Complete API tag catalog, retained while a filter request is in flight.
 List<TagWithCountEntity> get availableTags;/// Unfiltered total for the current location, not the loaded page size.
 int? get allFacilitiesTotal;/// Async state for locations request.
 AsyncState<LocationsEntity> get locationsRequest;/// The endpoint accepts one tag ID at a time.
 int? get selectedTagId;/// Selected location for filtering.
 SelectedLocation get selectedLocation;/// Whether the user has confirmed their location selection.
 bool get hasLockedInSelection;
/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityLineFacilitiesStateCopyWith<ActivityLineFacilitiesState> get copyWith => _$ActivityLineFacilitiesStateCopyWithImpl<ActivityLineFacilitiesState>(this as ActivityLineFacilitiesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityLineFacilitiesState&&(identical(other.activityLine, activityLine) || other.activityLine == activityLine)&&(identical(other.facilitiesRequest, facilitiesRequest) || other.facilitiesRequest == facilitiesRequest)&&(identical(other.nextPageRequest, nextPageRequest) || other.nextPageRequest == nextPageRequest)&&const DeepCollectionEquality().equals(other.availableTags, availableTags)&&(identical(other.allFacilitiesTotal, allFacilitiesTotal) || other.allFacilitiesTotal == allFacilitiesTotal)&&(identical(other.locationsRequest, locationsRequest) || other.locationsRequest == locationsRequest)&&(identical(other.selectedTagId, selectedTagId) || other.selectedTagId == selectedTagId)&&(identical(other.selectedLocation, selectedLocation) || other.selectedLocation == selectedLocation)&&(identical(other.hasLockedInSelection, hasLockedInSelection) || other.hasLockedInSelection == hasLockedInSelection));
}


@override
int get hashCode => Object.hash(runtimeType,activityLine,facilitiesRequest,nextPageRequest,const DeepCollectionEquality().hash(availableTags),allFacilitiesTotal,locationsRequest,selectedTagId,selectedLocation,hasLockedInSelection);

@override
String toString() {
  return 'ActivityLineFacilitiesState(activityLine: $activityLine, facilitiesRequest: $facilitiesRequest, nextPageRequest: $nextPageRequest, availableTags: $availableTags, allFacilitiesTotal: $allFacilitiesTotal, locationsRequest: $locationsRequest, selectedTagId: $selectedTagId, selectedLocation: $selectedLocation, hasLockedInSelection: $hasLockedInSelection)';
}


}

/// @nodoc
abstract mixin class $ActivityLineFacilitiesStateCopyWith<$Res>  {
  factory $ActivityLineFacilitiesStateCopyWith(ActivityLineFacilitiesState value, $Res Function(ActivityLineFacilitiesState) _then) = _$ActivityLineFacilitiesStateCopyWithImpl;
@useResult
$Res call({
 ActivityLineEntity activityLine, AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest, AsyncState<void> nextPageRequest, List<TagWithCountEntity> availableTags, int? allFacilitiesTotal, AsyncState<LocationsEntity> locationsRequest, int? selectedTagId, SelectedLocation selectedLocation, bool hasLockedInSelection
});


$ActivityLineEntityCopyWith<$Res> get activityLine;$AsyncStateCopyWith<ActivityLineFacilitiesEntity, $Res> get facilitiesRequest;$AsyncStateCopyWith<void, $Res> get nextPageRequest;$AsyncStateCopyWith<LocationsEntity, $Res> get locationsRequest;$SelectedLocationCopyWith<$Res> get selectedLocation;

}
/// @nodoc
class _$ActivityLineFacilitiesStateCopyWithImpl<$Res>
    implements $ActivityLineFacilitiesStateCopyWith<$Res> {
  _$ActivityLineFacilitiesStateCopyWithImpl(this._self, this._then);

  final ActivityLineFacilitiesState _self;
  final $Res Function(ActivityLineFacilitiesState) _then;

/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activityLine = null,Object? facilitiesRequest = null,Object? nextPageRequest = null,Object? availableTags = null,Object? allFacilitiesTotal = freezed,Object? locationsRequest = null,Object? selectedTagId = freezed,Object? selectedLocation = null,Object? hasLockedInSelection = null,}) {
  return _then(_self.copyWith(
activityLine: null == activityLine ? _self.activityLine : activityLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity,facilitiesRequest: null == facilitiesRequest ? _self.facilitiesRequest : facilitiesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ActivityLineFacilitiesEntity>,nextPageRequest: null == nextPageRequest ? _self.nextPageRequest : nextPageRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,availableTags: null == availableTags ? _self.availableTags : availableTags // ignore: cast_nullable_to_non_nullable
as List<TagWithCountEntity>,allFacilitiesTotal: freezed == allFacilitiesTotal ? _self.allFacilitiesTotal : allFacilitiesTotal // ignore: cast_nullable_to_non_nullable
as int?,locationsRequest: null == locationsRequest ? _self.locationsRequest : locationsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<LocationsEntity>,selectedTagId: freezed == selectedTagId ? _self.selectedTagId : selectedTagId // ignore: cast_nullable_to_non_nullable
as int?,selectedLocation: null == selectedLocation ? _self.selectedLocation : selectedLocation // ignore: cast_nullable_to_non_nullable
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
$AsyncStateCopyWith<void, $Res> get nextPageRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.nextPageRequest, (value) {
    return _then(_self.copyWith(nextPageRequest: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActivityLineEntity activityLine,  AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest,  AsyncState<void> nextPageRequest,  List<TagWithCountEntity> availableTags,  int? allFacilitiesTotal,  AsyncState<LocationsEntity> locationsRequest,  int? selectedTagId,  SelectedLocation selectedLocation,  bool hasLockedInSelection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityLineFacilitiesState() when $default != null:
return $default(_that.activityLine,_that.facilitiesRequest,_that.nextPageRequest,_that.availableTags,_that.allFacilitiesTotal,_that.locationsRequest,_that.selectedTagId,_that.selectedLocation,_that.hasLockedInSelection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActivityLineEntity activityLine,  AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest,  AsyncState<void> nextPageRequest,  List<TagWithCountEntity> availableTags,  int? allFacilitiesTotal,  AsyncState<LocationsEntity> locationsRequest,  int? selectedTagId,  SelectedLocation selectedLocation,  bool hasLockedInSelection)  $default,) {final _that = this;
switch (_that) {
case _ActivityLineFacilitiesState():
return $default(_that.activityLine,_that.facilitiesRequest,_that.nextPageRequest,_that.availableTags,_that.allFacilitiesTotal,_that.locationsRequest,_that.selectedTagId,_that.selectedLocation,_that.hasLockedInSelection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActivityLineEntity activityLine,  AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest,  AsyncState<void> nextPageRequest,  List<TagWithCountEntity> availableTags,  int? allFacilitiesTotal,  AsyncState<LocationsEntity> locationsRequest,  int? selectedTagId,  SelectedLocation selectedLocation,  bool hasLockedInSelection)?  $default,) {final _that = this;
switch (_that) {
case _ActivityLineFacilitiesState() when $default != null:
return $default(_that.activityLine,_that.facilitiesRequest,_that.nextPageRequest,_that.availableTags,_that.allFacilitiesTotal,_that.locationsRequest,_that.selectedTagId,_that.selectedLocation,_that.hasLockedInSelection);case _:
  return null;

}
}

}

/// @nodoc


class _ActivityLineFacilitiesState extends ActivityLineFacilitiesState {
  const _ActivityLineFacilitiesState({required this.activityLine, this.facilitiesRequest = const AsyncState.idle(), this.nextPageRequest = const AsyncState.idle(), final  List<TagWithCountEntity> availableTags = const [], this.allFacilitiesTotal, this.locationsRequest = const AsyncState.idle(), this.selectedTagId, this.selectedLocation = const SelectedLocation(), this.hasLockedInSelection = false}): _availableTags = availableTags,super._();
  

/// The activity line being displayed.
@override final  ActivityLineEntity activityLine;
/// Async state for facilities request.
@override@JsonKey() final  AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest;
@override@JsonKey() final  AsyncState<void> nextPageRequest;
/// Complete API tag catalog, retained while a filter request is in flight.
 final  List<TagWithCountEntity> _availableTags;
/// Complete API tag catalog, retained while a filter request is in flight.
@override@JsonKey() List<TagWithCountEntity> get availableTags {
  if (_availableTags is EqualUnmodifiableListView) return _availableTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableTags);
}

/// Unfiltered total for the current location, not the loaded page size.
@override final  int? allFacilitiesTotal;
/// Async state for locations request.
@override@JsonKey() final  AsyncState<LocationsEntity> locationsRequest;
/// The endpoint accepts one tag ID at a time.
@override final  int? selectedTagId;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityLineFacilitiesState&&(identical(other.activityLine, activityLine) || other.activityLine == activityLine)&&(identical(other.facilitiesRequest, facilitiesRequest) || other.facilitiesRequest == facilitiesRequest)&&(identical(other.nextPageRequest, nextPageRequest) || other.nextPageRequest == nextPageRequest)&&const DeepCollectionEquality().equals(other._availableTags, _availableTags)&&(identical(other.allFacilitiesTotal, allFacilitiesTotal) || other.allFacilitiesTotal == allFacilitiesTotal)&&(identical(other.locationsRequest, locationsRequest) || other.locationsRequest == locationsRequest)&&(identical(other.selectedTagId, selectedTagId) || other.selectedTagId == selectedTagId)&&(identical(other.selectedLocation, selectedLocation) || other.selectedLocation == selectedLocation)&&(identical(other.hasLockedInSelection, hasLockedInSelection) || other.hasLockedInSelection == hasLockedInSelection));
}


@override
int get hashCode => Object.hash(runtimeType,activityLine,facilitiesRequest,nextPageRequest,const DeepCollectionEquality().hash(_availableTags),allFacilitiesTotal,locationsRequest,selectedTagId,selectedLocation,hasLockedInSelection);

@override
String toString() {
  return 'ActivityLineFacilitiesState(activityLine: $activityLine, facilitiesRequest: $facilitiesRequest, nextPageRequest: $nextPageRequest, availableTags: $availableTags, allFacilitiesTotal: $allFacilitiesTotal, locationsRequest: $locationsRequest, selectedTagId: $selectedTagId, selectedLocation: $selectedLocation, hasLockedInSelection: $hasLockedInSelection)';
}


}

/// @nodoc
abstract mixin class _$ActivityLineFacilitiesStateCopyWith<$Res> implements $ActivityLineFacilitiesStateCopyWith<$Res> {
  factory _$ActivityLineFacilitiesStateCopyWith(_ActivityLineFacilitiesState value, $Res Function(_ActivityLineFacilitiesState) _then) = __$ActivityLineFacilitiesStateCopyWithImpl;
@override @useResult
$Res call({
 ActivityLineEntity activityLine, AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest, AsyncState<void> nextPageRequest, List<TagWithCountEntity> availableTags, int? allFacilitiesTotal, AsyncState<LocationsEntity> locationsRequest, int? selectedTagId, SelectedLocation selectedLocation, bool hasLockedInSelection
});


@override $ActivityLineEntityCopyWith<$Res> get activityLine;@override $AsyncStateCopyWith<ActivityLineFacilitiesEntity, $Res> get facilitiesRequest;@override $AsyncStateCopyWith<void, $Res> get nextPageRequest;@override $AsyncStateCopyWith<LocationsEntity, $Res> get locationsRequest;@override $SelectedLocationCopyWith<$Res> get selectedLocation;

}
/// @nodoc
class __$ActivityLineFacilitiesStateCopyWithImpl<$Res>
    implements _$ActivityLineFacilitiesStateCopyWith<$Res> {
  __$ActivityLineFacilitiesStateCopyWithImpl(this._self, this._then);

  final _ActivityLineFacilitiesState _self;
  final $Res Function(_ActivityLineFacilitiesState) _then;

/// Create a copy of ActivityLineFacilitiesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activityLine = null,Object? facilitiesRequest = null,Object? nextPageRequest = null,Object? availableTags = null,Object? allFacilitiesTotal = freezed,Object? locationsRequest = null,Object? selectedTagId = freezed,Object? selectedLocation = null,Object? hasLockedInSelection = null,}) {
  return _then(_ActivityLineFacilitiesState(
activityLine: null == activityLine ? _self.activityLine : activityLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity,facilitiesRequest: null == facilitiesRequest ? _self.facilitiesRequest : facilitiesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ActivityLineFacilitiesEntity>,nextPageRequest: null == nextPageRequest ? _self.nextPageRequest : nextPageRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,availableTags: null == availableTags ? _self._availableTags : availableTags // ignore: cast_nullable_to_non_nullable
as List<TagWithCountEntity>,allFacilitiesTotal: freezed == allFacilitiesTotal ? _self.allFacilitiesTotal : allFacilitiesTotal // ignore: cast_nullable_to_non_nullable
as int?,locationsRequest: null == locationsRequest ? _self.locationsRequest : locationsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<LocationsEntity>,selectedTagId: freezed == selectedTagId ? _self.selectedTagId : selectedTagId // ignore: cast_nullable_to_non_nullable
as int?,selectedLocation: null == selectedLocation ? _self.selectedLocation : selectedLocation // ignore: cast_nullable_to_non_nullable
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
$AsyncStateCopyWith<void, $Res> get nextPageRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.nextPageRequest, (value) {
    return _then(_self.copyWith(nextPageRequest: value));
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
