// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChangePasswordDto {

// ignore: invalid_annotation_target
@JsonKey(name: 'new_password') String get newPassword;
/// Create a copy of ChangePasswordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordDtoCopyWith<ChangePasswordDto> get copyWith => _$ChangePasswordDtoCopyWithImpl<ChangePasswordDto>(this as ChangePasswordDto, _$identity);

  /// Serializes this ChangePasswordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordDto&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newPassword);

@override
String toString() {
  return 'ChangePasswordDto(newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordDtoCopyWith<$Res>  {
  factory $ChangePasswordDtoCopyWith(ChangePasswordDto value, $Res Function(ChangePasswordDto) _then) = _$ChangePasswordDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'new_password') String newPassword
});




}
/// @nodoc
class _$ChangePasswordDtoCopyWithImpl<$Res>
    implements $ChangePasswordDtoCopyWith<$Res> {
  _$ChangePasswordDtoCopyWithImpl(this._self, this._then);

  final ChangePasswordDto _self;
  final $Res Function(ChangePasswordDto) _then;

/// Create a copy of ChangePasswordDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newPassword = null,}) {
  return _then(_self.copyWith(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangePasswordDto].
extension ChangePasswordDtoPatterns on ChangePasswordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangePasswordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangePasswordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangePasswordDto value)  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangePasswordDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'new_password')  String newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangePasswordDto() when $default != null:
return $default(_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'new_password')  String newPassword)  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordDto():
return $default(_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'new_password')  String newPassword)?  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordDto() when $default != null:
return $default(_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ChangePasswordDto implements ChangePasswordDto {
  const _ChangePasswordDto({@JsonKey(name: 'new_password') required this.newPassword});
  

// ignore: invalid_annotation_target
@override@JsonKey(name: 'new_password') final  String newPassword;

/// Create a copy of ChangePasswordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordDtoCopyWith<_ChangePasswordDto> get copyWith => __$ChangePasswordDtoCopyWithImpl<_ChangePasswordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangePasswordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePasswordDto&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newPassword);

@override
String toString() {
  return 'ChangePasswordDto(newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordDtoCopyWith<$Res> implements $ChangePasswordDtoCopyWith<$Res> {
  factory _$ChangePasswordDtoCopyWith(_ChangePasswordDto value, $Res Function(_ChangePasswordDto) _then) = __$ChangePasswordDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'new_password') String newPassword
});




}
/// @nodoc
class __$ChangePasswordDtoCopyWithImpl<$Res>
    implements _$ChangePasswordDtoCopyWith<$Res> {
  __$ChangePasswordDtoCopyWithImpl(this._self, this._then);

  final _ChangePasswordDto _self;
  final $Res Function(_ChangePasswordDto) _then;

/// Create a copy of ChangePasswordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newPassword = null,}) {
  return _then(_ChangePasswordDto(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
