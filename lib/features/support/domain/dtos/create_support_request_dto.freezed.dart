// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_support_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateSupportRequestDto {

 String get issue; File? get image;
/// Create a copy of CreateSupportRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSupportRequestDtoCopyWith<CreateSupportRequestDto> get copyWith => _$CreateSupportRequestDtoCopyWithImpl<CreateSupportRequestDto>(this as CreateSupportRequestDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSupportRequestDto&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,issue,image);

@override
String toString() {
  return 'CreateSupportRequestDto(issue: $issue, image: $image)';
}


}

/// @nodoc
abstract mixin class $CreateSupportRequestDtoCopyWith<$Res>  {
  factory $CreateSupportRequestDtoCopyWith(CreateSupportRequestDto value, $Res Function(CreateSupportRequestDto) _then) = _$CreateSupportRequestDtoCopyWithImpl;
@useResult
$Res call({
 String issue, File? image
});




}
/// @nodoc
class _$CreateSupportRequestDtoCopyWithImpl<$Res>
    implements $CreateSupportRequestDtoCopyWith<$Res> {
  _$CreateSupportRequestDtoCopyWithImpl(this._self, this._then);

  final CreateSupportRequestDto _self;
  final $Res Function(CreateSupportRequestDto) _then;

/// Create a copy of CreateSupportRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? issue = null,Object? image = freezed,}) {
  return _then(_self.copyWith(
issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSupportRequestDto].
extension CreateSupportRequestDtoPatterns on CreateSupportRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSupportRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSupportRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSupportRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateSupportRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSupportRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSupportRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String issue,  File? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSupportRequestDto() when $default != null:
return $default(_that.issue,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String issue,  File? image)  $default,) {final _that = this;
switch (_that) {
case _CreateSupportRequestDto():
return $default(_that.issue,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String issue,  File? image)?  $default,) {final _that = this;
switch (_that) {
case _CreateSupportRequestDto() when $default != null:
return $default(_that.issue,_that.image);case _:
  return null;

}
}

}

/// @nodoc


class _CreateSupportRequestDto implements CreateSupportRequestDto {
  const _CreateSupportRequestDto({required this.issue, this.image});
  

@override final  String issue;
@override final  File? image;

/// Create a copy of CreateSupportRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSupportRequestDtoCopyWith<_CreateSupportRequestDto> get copyWith => __$CreateSupportRequestDtoCopyWithImpl<_CreateSupportRequestDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSupportRequestDto&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,issue,image);

@override
String toString() {
  return 'CreateSupportRequestDto(issue: $issue, image: $image)';
}


}

/// @nodoc
abstract mixin class _$CreateSupportRequestDtoCopyWith<$Res> implements $CreateSupportRequestDtoCopyWith<$Res> {
  factory _$CreateSupportRequestDtoCopyWith(_CreateSupportRequestDto value, $Res Function(_CreateSupportRequestDto) _then) = __$CreateSupportRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String issue, File? image
});




}
/// @nodoc
class __$CreateSupportRequestDtoCopyWithImpl<$Res>
    implements _$CreateSupportRequestDtoCopyWith<$Res> {
  __$CreateSupportRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateSupportRequestDto _self;
  final $Res Function(_CreateSupportRequestDto) _then;

/// Create a copy of CreateSupportRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? issue = null,Object? image = freezed,}) {
  return _then(_CreateSupportRequestDto(
issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

// dart format on
