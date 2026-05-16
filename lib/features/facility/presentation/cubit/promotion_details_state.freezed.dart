// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PromotionDetailsState {

 int get promotionId; AsyncState<FacilityPromotionDetailsEntity> get detailsRequest;
/// Create a copy of PromotionDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromotionDetailsStateCopyWith<PromotionDetailsState> get copyWith => _$PromotionDetailsStateCopyWithImpl<PromotionDetailsState>(this as PromotionDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromotionDetailsState&&(identical(other.promotionId, promotionId) || other.promotionId == promotionId)&&(identical(other.detailsRequest, detailsRequest) || other.detailsRequest == detailsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,promotionId,detailsRequest);

@override
String toString() {
  return 'PromotionDetailsState(promotionId: $promotionId, detailsRequest: $detailsRequest)';
}


}

/// @nodoc
abstract mixin class $PromotionDetailsStateCopyWith<$Res>  {
  factory $PromotionDetailsStateCopyWith(PromotionDetailsState value, $Res Function(PromotionDetailsState) _then) = _$PromotionDetailsStateCopyWithImpl;
@useResult
$Res call({
 int promotionId, AsyncState<FacilityPromotionDetailsEntity> detailsRequest
});


$AsyncStateCopyWith<FacilityPromotionDetailsEntity, $Res> get detailsRequest;

}
/// @nodoc
class _$PromotionDetailsStateCopyWithImpl<$Res>
    implements $PromotionDetailsStateCopyWith<$Res> {
  _$PromotionDetailsStateCopyWithImpl(this._self, this._then);

  final PromotionDetailsState _self;
  final $Res Function(PromotionDetailsState) _then;

/// Create a copy of PromotionDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? promotionId = null,Object? detailsRequest = null,}) {
  return _then(_self.copyWith(
promotionId: null == promotionId ? _self.promotionId : promotionId // ignore: cast_nullable_to_non_nullable
as int,detailsRequest: null == detailsRequest ? _self.detailsRequest : detailsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilityPromotionDetailsEntity>,
  ));
}
/// Create a copy of PromotionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilityPromotionDetailsEntity, $Res> get detailsRequest {
  
  return $AsyncStateCopyWith<FacilityPromotionDetailsEntity, $Res>(_self.detailsRequest, (value) {
    return _then(_self.copyWith(detailsRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [PromotionDetailsState].
extension PromotionDetailsStatePatterns on PromotionDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromotionDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromotionDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromotionDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _PromotionDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromotionDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _PromotionDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int promotionId,  AsyncState<FacilityPromotionDetailsEntity> detailsRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromotionDetailsState() when $default != null:
return $default(_that.promotionId,_that.detailsRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int promotionId,  AsyncState<FacilityPromotionDetailsEntity> detailsRequest)  $default,) {final _that = this;
switch (_that) {
case _PromotionDetailsState():
return $default(_that.promotionId,_that.detailsRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int promotionId,  AsyncState<FacilityPromotionDetailsEntity> detailsRequest)?  $default,) {final _that = this;
switch (_that) {
case _PromotionDetailsState() when $default != null:
return $default(_that.promotionId,_that.detailsRequest);case _:
  return null;

}
}

}

/// @nodoc


class _PromotionDetailsState implements PromotionDetailsState {
  const _PromotionDetailsState({required this.promotionId, this.detailsRequest = const AsyncState.idle()});
  

@override final  int promotionId;
@override@JsonKey() final  AsyncState<FacilityPromotionDetailsEntity> detailsRequest;

/// Create a copy of PromotionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromotionDetailsStateCopyWith<_PromotionDetailsState> get copyWith => __$PromotionDetailsStateCopyWithImpl<_PromotionDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromotionDetailsState&&(identical(other.promotionId, promotionId) || other.promotionId == promotionId)&&(identical(other.detailsRequest, detailsRequest) || other.detailsRequest == detailsRequest));
}


@override
int get hashCode => Object.hash(runtimeType,promotionId,detailsRequest);

@override
String toString() {
  return 'PromotionDetailsState(promotionId: $promotionId, detailsRequest: $detailsRequest)';
}


}

/// @nodoc
abstract mixin class _$PromotionDetailsStateCopyWith<$Res> implements $PromotionDetailsStateCopyWith<$Res> {
  factory _$PromotionDetailsStateCopyWith(_PromotionDetailsState value, $Res Function(_PromotionDetailsState) _then) = __$PromotionDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 int promotionId, AsyncState<FacilityPromotionDetailsEntity> detailsRequest
});


@override $AsyncStateCopyWith<FacilityPromotionDetailsEntity, $Res> get detailsRequest;

}
/// @nodoc
class __$PromotionDetailsStateCopyWithImpl<$Res>
    implements _$PromotionDetailsStateCopyWith<$Res> {
  __$PromotionDetailsStateCopyWithImpl(this._self, this._then);

  final _PromotionDetailsState _self;
  final $Res Function(_PromotionDetailsState) _then;

/// Create a copy of PromotionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? promotionId = null,Object? detailsRequest = null,}) {
  return _then(_PromotionDetailsState(
promotionId: null == promotionId ? _self.promotionId : promotionId // ignore: cast_nullable_to_non_nullable
as int,detailsRequest: null == detailsRequest ? _self.detailsRequest : detailsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<FacilityPromotionDetailsEntity>,
  ));
}

/// Create a copy of PromotionDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<FacilityPromotionDetailsEntity, $Res> get detailsRequest {
  
  return $AsyncStateCopyWith<FacilityPromotionDetailsEntity, $Res>(_self.detailsRequest, (value) {
    return _then(_self.copyWith(detailsRequest: value));
  });
}
}

// dart format on
