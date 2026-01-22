// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityDetailsState {

 CollapsedFacilityEntity get facility; FacilityDetailsTab get selectedTab; FacilityPricingTab get selectedPricingTab; AsyncState<FacilityProfileEntity> get profileRequest; AsyncState<List<FacilityTicketEntity>> get ticketsRequest;
/// Create a copy of FacilityDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityDetailsStateCopyWith<FacilityDetailsState> get copyWith => _$FacilityDetailsStateCopyWithImpl<FacilityDetailsState>(this as FacilityDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityDetailsState&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.selectedPricingTab, selectedPricingTab) || other.selectedPricingTab == selectedPricingTab)&&(identical(other.profileRequest, profileRequest) || other.profileRequest == profileRequest)&&(identical(other.ticketsRequest, ticketsRequest) || other.ticketsRequest == ticketsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,facility,selectedTab,selectedPricingTab,profileRequest,ticketsRequest);

@override
String toString() {
  return 'FacilityDetailsState(facility: $facility, selectedTab: $selectedTab, selectedPricingTab: $selectedPricingTab, profileRequest: $profileRequest, ticketsRequest: $ticketsRequest)';
}


}

/// @nodoc
abstract mixin class $FacilityDetailsStateCopyWith<$Res>  {
  factory $FacilityDetailsStateCopyWith(FacilityDetailsState value, $Res Function(FacilityDetailsState) _then) = _$FacilityDetailsStateCopyWithImpl;
@useResult
$Res call({
 CollapsedFacilityEntity facility, FacilityDetailsTab selectedTab, FacilityPricingTab selectedPricingTab, AsyncState<FacilityProfileEntity> profileRequest, AsyncState<List<FacilityTicketEntity>> ticketsRequest
});


$CollapsedFacilityEntityCopyWith<$Res> get facility;$AsyncStateCopyWith<FacilityProfileEntity, $Res> get profileRequest;$AsyncStateCopyWith<List<FacilityTicketEntity>, $Res> get ticketsRequest;

}
/// @nodoc
class _$FacilityDetailsStateCopyWithImpl<$Res>
    implements $FacilityDetailsStateCopyWith<$Res> {
  _$FacilityDetailsStateCopyWithImpl(this._self, this._then);

  final FacilityDetailsState _self;
  final $Res Function(FacilityDetailsState) _then;

/// Create a copy of FacilityDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? facility = null,Object? selectedTab = null,Object? selectedPricingTab = null,Object? profileRequest = null,Object? ticketsRequest = null,}) {
  return _then(_self.copyWith(
facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity,selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as FacilityDetailsTab,selectedPricingTab: null == selectedPricingTab ? _self.selectedPricingTab : selectedPricingTab // ignore: cast_nullable_to_non_nullable
as FacilityPricingTab,profileRequest: null == profileRequest ? _self.profileRequest : profileRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilityProfileEntity>,ticketsRequest: null == ticketsRequest ? _self.ticketsRequest : ticketsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<FacilityTicketEntity>>,
  ));
}
/// Create a copy of FacilityDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res> get facility {
  
  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}/// Create a copy of FacilityDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilityProfileEntity, $Res> get profileRequest {
  
  return $AsyncStateCopyWith<FacilityProfileEntity, $Res>(_self.profileRequest, (value) {
    return _then(_self.copyWith(profileRequest: value));
  });
}/// Create a copy of FacilityDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<FacilityTicketEntity>, $Res> get ticketsRequest {
  
  return $AsyncStateCopyWith<List<FacilityTicketEntity>, $Res>(_self.ticketsRequest, (value) {
    return _then(_self.copyWith(ticketsRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [FacilityDetailsState].
extension FacilityDetailsStatePatterns on FacilityDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _FacilityDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CollapsedFacilityEntity facility,  FacilityDetailsTab selectedTab,  FacilityPricingTab selectedPricingTab,  AsyncState<FacilityProfileEntity> profileRequest,  AsyncState<List<FacilityTicketEntity>> ticketsRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityDetailsState() when $default != null:
return $default(_that.facility,_that.selectedTab,_that.selectedPricingTab,_that.profileRequest,_that.ticketsRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CollapsedFacilityEntity facility,  FacilityDetailsTab selectedTab,  FacilityPricingTab selectedPricingTab,  AsyncState<FacilityProfileEntity> profileRequest,  AsyncState<List<FacilityTicketEntity>> ticketsRequest)  $default,) {final _that = this;
switch (_that) {
case _FacilityDetailsState():
return $default(_that.facility,_that.selectedTab,_that.selectedPricingTab,_that.profileRequest,_that.ticketsRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CollapsedFacilityEntity facility,  FacilityDetailsTab selectedTab,  FacilityPricingTab selectedPricingTab,  AsyncState<FacilityProfileEntity> profileRequest,  AsyncState<List<FacilityTicketEntity>> ticketsRequest)?  $default,) {final _that = this;
switch (_that) {
case _FacilityDetailsState() when $default != null:
return $default(_that.facility,_that.selectedTab,_that.selectedPricingTab,_that.profileRequest,_that.ticketsRequest);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityDetailsState implements FacilityDetailsState {
  const _FacilityDetailsState({required this.facility, this.selectedTab = FacilityDetailsTab.profile, this.selectedPricingTab = FacilityPricingTab.tickets, this.profileRequest = const AsyncState.idle(), this.ticketsRequest = const AsyncState.idle()});
  

@override final  CollapsedFacilityEntity facility;
@override@JsonKey() final  FacilityDetailsTab selectedTab;
@override@JsonKey() final  FacilityPricingTab selectedPricingTab;
@override@JsonKey() final  AsyncState<FacilityProfileEntity> profileRequest;
@override@JsonKey() final  AsyncState<List<FacilityTicketEntity>> ticketsRequest;

/// Create a copy of FacilityDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityDetailsStateCopyWith<_FacilityDetailsState> get copyWith => __$FacilityDetailsStateCopyWithImpl<_FacilityDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityDetailsState&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.selectedPricingTab, selectedPricingTab) || other.selectedPricingTab == selectedPricingTab)&&(identical(other.profileRequest, profileRequest) || other.profileRequest == profileRequest)&&(identical(other.ticketsRequest, ticketsRequest) || other.ticketsRequest == ticketsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,facility,selectedTab,selectedPricingTab,profileRequest,ticketsRequest);

@override
String toString() {
  return 'FacilityDetailsState(facility: $facility, selectedTab: $selectedTab, selectedPricingTab: $selectedPricingTab, profileRequest: $profileRequest, ticketsRequest: $ticketsRequest)';
}


}

/// @nodoc
abstract mixin class _$FacilityDetailsStateCopyWith<$Res> implements $FacilityDetailsStateCopyWith<$Res> {
  factory _$FacilityDetailsStateCopyWith(_FacilityDetailsState value, $Res Function(_FacilityDetailsState) _then) = __$FacilityDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 CollapsedFacilityEntity facility, FacilityDetailsTab selectedTab, FacilityPricingTab selectedPricingTab, AsyncState<FacilityProfileEntity> profileRequest, AsyncState<List<FacilityTicketEntity>> ticketsRequest
});


@override $CollapsedFacilityEntityCopyWith<$Res> get facility;@override $AsyncStateCopyWith<FacilityProfileEntity, $Res> get profileRequest;@override $AsyncStateCopyWith<List<FacilityTicketEntity>, $Res> get ticketsRequest;

}
/// @nodoc
class __$FacilityDetailsStateCopyWithImpl<$Res>
    implements _$FacilityDetailsStateCopyWith<$Res> {
  __$FacilityDetailsStateCopyWithImpl(this._self, this._then);

  final _FacilityDetailsState _self;
  final $Res Function(_FacilityDetailsState) _then;

/// Create a copy of FacilityDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? facility = null,Object? selectedTab = null,Object? selectedPricingTab = null,Object? profileRequest = null,Object? ticketsRequest = null,}) {
  return _then(_FacilityDetailsState(
facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as CollapsedFacilityEntity,selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as FacilityDetailsTab,selectedPricingTab: null == selectedPricingTab ? _self.selectedPricingTab : selectedPricingTab // ignore: cast_nullable_to_non_nullable
as FacilityPricingTab,profileRequest: null == profileRequest ? _self.profileRequest : profileRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilityProfileEntity>,ticketsRequest: null == ticketsRequest ? _self.ticketsRequest : ticketsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<FacilityTicketEntity>>,
  ));
}

/// Create a copy of FacilityDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<$Res> get facility {
  
  return $CollapsedFacilityEntityCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}/// Create a copy of FacilityDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilityProfileEntity, $Res> get profileRequest {
  
  return $AsyncStateCopyWith<FacilityProfileEntity, $Res>(_self.profileRequest, (value) {
    return _then(_self.copyWith(profileRequest: value));
  });
}/// Create a copy of FacilityDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<FacilityTicketEntity>, $Res> get ticketsRequest {
  
  return $AsyncStateCopyWith<List<FacilityTicketEntity>, $Res>(_self.ticketsRequest, (value) {
    return _then(_self.copyWith(ticketsRequest: value));
  });
}
}

// dart format on
