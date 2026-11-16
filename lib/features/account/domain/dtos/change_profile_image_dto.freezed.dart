// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_profile_image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChangeProfileImageDto {

 File get image;
/// Create a copy of ChangeProfileImageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeProfileImageDtoCopyWith<ChangeProfileImageDto> get copyWith => _$ChangeProfileImageDtoCopyWithImpl<ChangeProfileImageDto>(this as ChangeProfileImageDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeProfileImageDto&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,image);

@override
String toString() {
  return 'ChangeProfileImageDto(image: $image)';
}


}

/// @nodoc
abstract mixin class $ChangeProfileImageDtoCopyWith<$Res>  {
  factory $ChangeProfileImageDtoCopyWith(ChangeProfileImageDto value, $Res Function(ChangeProfileImageDto) _then) = _$ChangeProfileImageDtoCopyWithImpl;
@useResult
$Res call({
 File image
});




}
/// @nodoc
class _$ChangeProfileImageDtoCopyWithImpl<$Res>
    implements $ChangeProfileImageDtoCopyWith<$Res> {
  _$ChangeProfileImageDtoCopyWithImpl(this._self, this._then);

  final ChangeProfileImageDto _self;
  final $Res Function(ChangeProfileImageDto) _then;

/// Create a copy of ChangeProfileImageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = null,}) {
  return _then(_self.copyWith(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangeProfileImageDto].
extension ChangeProfileImageDtoPatterns on ChangeProfileImageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeProfileImageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeProfileImageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeProfileImageDto value)  $default,){
final _that = this;
switch (_that) {
case _ChangeProfileImageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeProfileImageDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeProfileImageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( File image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeProfileImageDto() when $default != null:
return $default(_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( File image)  $default,) {final _that = this;
switch (_that) {
case _ChangeProfileImageDto():
return $default(_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( File image)?  $default,) {final _that = this;
switch (_that) {
case _ChangeProfileImageDto() when $default != null:
return $default(_that.image);case _:
  return null;

}
}

}

/// @nodoc


class _ChangeProfileImageDto implements ChangeProfileImageDto {
  const _ChangeProfileImageDto({required this.image});
  

@override final  File image;

/// Create a copy of ChangeProfileImageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeProfileImageDtoCopyWith<_ChangeProfileImageDto> get copyWith => __$ChangeProfileImageDtoCopyWithImpl<_ChangeProfileImageDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeProfileImageDto&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,image);

@override
String toString() {
  return 'ChangeProfileImageDto(image: $image)';
}


}

/// @nodoc
abstract mixin class _$ChangeProfileImageDtoCopyWith<$Res> implements $ChangeProfileImageDtoCopyWith<$Res> {
  factory _$ChangeProfileImageDtoCopyWith(_ChangeProfileImageDto value, $Res Function(_ChangeProfileImageDto) _then) = __$ChangeProfileImageDtoCopyWithImpl;
@override @useResult
$Res call({
 File image
});




}
/// @nodoc
class __$ChangeProfileImageDtoCopyWithImpl<$Res>
    implements _$ChangeProfileImageDtoCopyWith<$Res> {
  __$ChangeProfileImageDtoCopyWithImpl(this._self, this._then);

  final _ChangeProfileImageDto _self;
  final $Res Function(_ChangeProfileImageDto) _then;

/// Create a copy of ChangeProfileImageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_ChangeProfileImageDto(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

// dart format on
