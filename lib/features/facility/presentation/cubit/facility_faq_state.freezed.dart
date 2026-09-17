// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_faq_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityFaqState {

 AsyncState<List<FacilityFaqEntity>> get faqsRequest;/// Ids of the entries the user has expanded. Kept in state so the list can
/// stay stateless and rebuild from the top.
 Set<int> get expandedIds;
/// Create a copy of FacilityFaqState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityFaqStateCopyWith<FacilityFaqState> get copyWith => _$FacilityFaqStateCopyWithImpl<FacilityFaqState>(this as FacilityFaqState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityFaqState&&(identical(other.faqsRequest, faqsRequest) || other.faqsRequest == faqsRequest)&&const DeepCollectionEquality().equals(other.expandedIds, expandedIds));
}


@override
int get hashCode => Object.hash(runtimeType,faqsRequest,const DeepCollectionEquality().hash(expandedIds));

@override
String toString() {
  return 'FacilityFaqState(faqsRequest: $faqsRequest, expandedIds: $expandedIds)';
}


}

/// @nodoc
abstract mixin class $FacilityFaqStateCopyWith<$Res>  {
  factory $FacilityFaqStateCopyWith(FacilityFaqState value, $Res Function(FacilityFaqState) _then) = _$FacilityFaqStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<List<FacilityFaqEntity>> faqsRequest, Set<int> expandedIds
});


$AsyncStateCopyWith<List<FacilityFaqEntity>, $Res> get faqsRequest;

}
/// @nodoc
class _$FacilityFaqStateCopyWithImpl<$Res>
    implements $FacilityFaqStateCopyWith<$Res> {
  _$FacilityFaqStateCopyWithImpl(this._self, this._then);

  final FacilityFaqState _self;
  final $Res Function(FacilityFaqState) _then;

/// Create a copy of FacilityFaqState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? faqsRequest = null,Object? expandedIds = null,}) {
  return _then(_self.copyWith(
faqsRequest: null == faqsRequest ? _self.faqsRequest : faqsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<FacilityFaqEntity>>,expandedIds: null == expandedIds ? _self.expandedIds : expandedIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}
/// Create a copy of FacilityFaqState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<FacilityFaqEntity>, $Res> get faqsRequest {
  
  return $AsyncStateCopyWith<List<FacilityFaqEntity>, $Res>(_self.faqsRequest, (value) {
    return _then(_self.copyWith(faqsRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [FacilityFaqState].
extension FacilityFaqStatePatterns on FacilityFaqState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityFaqState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityFaqState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityFaqState value)  $default,){
final _that = this;
switch (_that) {
case _FacilityFaqState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityFaqState value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityFaqState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<List<FacilityFaqEntity>> faqsRequest,  Set<int> expandedIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityFaqState() when $default != null:
return $default(_that.faqsRequest,_that.expandedIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<List<FacilityFaqEntity>> faqsRequest,  Set<int> expandedIds)  $default,) {final _that = this;
switch (_that) {
case _FacilityFaqState():
return $default(_that.faqsRequest,_that.expandedIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<List<FacilityFaqEntity>> faqsRequest,  Set<int> expandedIds)?  $default,) {final _that = this;
switch (_that) {
case _FacilityFaqState() when $default != null:
return $default(_that.faqsRequest,_that.expandedIds);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityFaqState implements FacilityFaqState {
  const _FacilityFaqState({this.faqsRequest = const AsyncState.idle(), final  Set<int> expandedIds = const <int>{}}): _expandedIds = expandedIds;
  

@override@JsonKey() final  AsyncState<List<FacilityFaqEntity>> faqsRequest;
/// Ids of the entries the user has expanded. Kept in state so the list can
/// stay stateless and rebuild from the top.
 final  Set<int> _expandedIds;
/// Ids of the entries the user has expanded. Kept in state so the list can
/// stay stateless and rebuild from the top.
@override@JsonKey() Set<int> get expandedIds {
  if (_expandedIds is EqualUnmodifiableSetView) return _expandedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_expandedIds);
}


/// Create a copy of FacilityFaqState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityFaqStateCopyWith<_FacilityFaqState> get copyWith => __$FacilityFaqStateCopyWithImpl<_FacilityFaqState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityFaqState&&(identical(other.faqsRequest, faqsRequest) || other.faqsRequest == faqsRequest)&&const DeepCollectionEquality().equals(other._expandedIds, _expandedIds));
}


@override
int get hashCode => Object.hash(runtimeType,faqsRequest,const DeepCollectionEquality().hash(_expandedIds));

@override
String toString() {
  return 'FacilityFaqState(faqsRequest: $faqsRequest, expandedIds: $expandedIds)';
}


}

/// @nodoc
abstract mixin class _$FacilityFaqStateCopyWith<$Res> implements $FacilityFaqStateCopyWith<$Res> {
  factory _$FacilityFaqStateCopyWith(_FacilityFaqState value, $Res Function(_FacilityFaqState) _then) = __$FacilityFaqStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<List<FacilityFaqEntity>> faqsRequest, Set<int> expandedIds
});


@override $AsyncStateCopyWith<List<FacilityFaqEntity>, $Res> get faqsRequest;

}
/// @nodoc
class __$FacilityFaqStateCopyWithImpl<$Res>
    implements _$FacilityFaqStateCopyWith<$Res> {
  __$FacilityFaqStateCopyWithImpl(this._self, this._then);

  final _FacilityFaqState _self;
  final $Res Function(_FacilityFaqState) _then;

/// Create a copy of FacilityFaqState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? faqsRequest = null,Object? expandedIds = null,}) {
  return _then(_FacilityFaqState(
faqsRequest: null == faqsRequest ? _self.faqsRequest : faqsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<FacilityFaqEntity>>,expandedIds: null == expandedIds ? _self._expandedIds : expandedIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

/// Create a copy of FacilityFaqState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<FacilityFaqEntity>, $Res> get faqsRequest {
  
  return $AsyncStateCopyWith<List<FacilityFaqEntity>, $Res>(_self.faqsRequest, (value) {
    return _then(_self.copyWith(faqsRequest: value));
  });
}
}

// dart format on
