// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_purchase_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPurchaseIdDto {

 int get purchaseId;
/// Create a copy of UserPurchaseIdDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPurchaseIdDtoCopyWith<UserPurchaseIdDto> get copyWith => _$UserPurchaseIdDtoCopyWithImpl<UserPurchaseIdDto>(this as UserPurchaseIdDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPurchaseIdDto&&(identical(other.purchaseId, purchaseId) || other.purchaseId == purchaseId));
}


@override
int get hashCode => Object.hash(runtimeType,purchaseId);

@override
String toString() {
  return 'UserPurchaseIdDto(purchaseId: $purchaseId)';
}


}

/// @nodoc
abstract mixin class $UserPurchaseIdDtoCopyWith<$Res>  {
  factory $UserPurchaseIdDtoCopyWith(UserPurchaseIdDto value, $Res Function(UserPurchaseIdDto) _then) = _$UserPurchaseIdDtoCopyWithImpl;
@useResult
$Res call({
 int purchaseId
});




}
/// @nodoc
class _$UserPurchaseIdDtoCopyWithImpl<$Res>
    implements $UserPurchaseIdDtoCopyWith<$Res> {
  _$UserPurchaseIdDtoCopyWithImpl(this._self, this._then);

  final UserPurchaseIdDto _self;
  final $Res Function(UserPurchaseIdDto) _then;

/// Create a copy of UserPurchaseIdDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? purchaseId = null,}) {
  return _then(_self.copyWith(
purchaseId: null == purchaseId ? _self.purchaseId : purchaseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPurchaseIdDto].
extension UserPurchaseIdDtoPatterns on UserPurchaseIdDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPurchaseIdDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPurchaseIdDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPurchaseIdDto value)  $default,){
final _that = this;
switch (_that) {
case _UserPurchaseIdDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPurchaseIdDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserPurchaseIdDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int purchaseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPurchaseIdDto() when $default != null:
return $default(_that.purchaseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int purchaseId)  $default,) {final _that = this;
switch (_that) {
case _UserPurchaseIdDto():
return $default(_that.purchaseId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int purchaseId)?  $default,) {final _that = this;
switch (_that) {
case _UserPurchaseIdDto() when $default != null:
return $default(_that.purchaseId);case _:
  return null;

}
}

}

/// @nodoc


class _UserPurchaseIdDto implements UserPurchaseIdDto {
  const _UserPurchaseIdDto({required this.purchaseId});
  

@override final  int purchaseId;

/// Create a copy of UserPurchaseIdDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPurchaseIdDtoCopyWith<_UserPurchaseIdDto> get copyWith => __$UserPurchaseIdDtoCopyWithImpl<_UserPurchaseIdDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPurchaseIdDto&&(identical(other.purchaseId, purchaseId) || other.purchaseId == purchaseId));
}


@override
int get hashCode => Object.hash(runtimeType,purchaseId);

@override
String toString() {
  return 'UserPurchaseIdDto(purchaseId: $purchaseId)';
}


}

/// @nodoc
abstract mixin class _$UserPurchaseIdDtoCopyWith<$Res> implements $UserPurchaseIdDtoCopyWith<$Res> {
  factory _$UserPurchaseIdDtoCopyWith(_UserPurchaseIdDto value, $Res Function(_UserPurchaseIdDto) _then) = __$UserPurchaseIdDtoCopyWithImpl;
@override @useResult
$Res call({
 int purchaseId
});




}
/// @nodoc
class __$UserPurchaseIdDtoCopyWithImpl<$Res>
    implements _$UserPurchaseIdDtoCopyWith<$Res> {
  __$UserPurchaseIdDtoCopyWithImpl(this._self, this._then);

  final _UserPurchaseIdDto _self;
  final $Res Function(_UserPurchaseIdDto) _then;

/// Create a copy of UserPurchaseIdDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? purchaseId = null,}) {
  return _then(_UserPurchaseIdDto(
purchaseId: null == purchaseId ? _self.purchaseId : purchaseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
