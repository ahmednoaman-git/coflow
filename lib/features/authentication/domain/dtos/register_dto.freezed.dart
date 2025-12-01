// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterDto {

 String get name; String get email; String get password;@DateFormatConverter() DateTime get birthdate;@GenderConverter() Gender get gender; String get nationality; String get phone; String get otpCode;/// Image file for user avatar. Excluded from JSON serialization.
// ignore: invalid_annotation_target
@JsonKey(includeToJson: false, includeFromJson: false) File? get image;
/// Create a copy of RegisterDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterDtoCopyWith<RegisterDto> get copyWith => _$RegisterDtoCopyWithImpl<RegisterDto>(this as RegisterDto, _$identity);

  /// Serializes this RegisterDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterDto&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,password,birthdate,gender,nationality,phone,otpCode,image);

@override
String toString() {
  return 'RegisterDto(name: $name, email: $email, password: $password, birthdate: $birthdate, gender: $gender, nationality: $nationality, phone: $phone, otpCode: $otpCode, image: $image)';
}


}

/// @nodoc
abstract mixin class $RegisterDtoCopyWith<$Res>  {
  factory $RegisterDtoCopyWith(RegisterDto value, $Res Function(RegisterDto) _then) = _$RegisterDtoCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password,@DateFormatConverter() DateTime birthdate,@GenderConverter() Gender gender, String nationality, String phone, String otpCode,@JsonKey(includeToJson: false, includeFromJson: false) File? image
});




}
/// @nodoc
class _$RegisterDtoCopyWithImpl<$Res>
    implements $RegisterDtoCopyWith<$Res> {
  _$RegisterDtoCopyWithImpl(this._self, this._then);

  final RegisterDto _self;
  final $Res Function(RegisterDto) _then;

/// Create a copy of RegisterDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? password = null,Object? birthdate = null,Object? gender = null,Object? nationality = null,Object? phone = null,Object? otpCode = null,Object? image = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,birthdate: null == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterDto].
extension RegisterDtoPatterns on RegisterDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterDto value)  $default,){
final _that = this;
switch (_that) {
case _RegisterDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterDto value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String password, @DateFormatConverter()  DateTime birthdate, @GenderConverter()  Gender gender,  String nationality,  String phone,  String otpCode, @JsonKey(includeToJson: false, includeFromJson: false)  File? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterDto() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.birthdate,_that.gender,_that.nationality,_that.phone,_that.otpCode,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String password, @DateFormatConverter()  DateTime birthdate, @GenderConverter()  Gender gender,  String nationality,  String phone,  String otpCode, @JsonKey(includeToJson: false, includeFromJson: false)  File? image)  $default,) {final _that = this;
switch (_that) {
case _RegisterDto():
return $default(_that.name,_that.email,_that.password,_that.birthdate,_that.gender,_that.nationality,_that.phone,_that.otpCode,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String password, @DateFormatConverter()  DateTime birthdate, @GenderConverter()  Gender gender,  String nationality,  String phone,  String otpCode, @JsonKey(includeToJson: false, includeFromJson: false)  File? image)?  $default,) {final _that = this;
switch (_that) {
case _RegisterDto() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.birthdate,_that.gender,_that.nationality,_that.phone,_that.otpCode,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterDto implements RegisterDto {
  const _RegisterDto({required this.name, required this.email, required this.password, @DateFormatConverter() required this.birthdate, @GenderConverter() required this.gender, required this.nationality, required this.phone, required this.otpCode, @JsonKey(includeToJson: false, includeFromJson: false) this.image});
  factory _RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);

@override final  String name;
@override final  String email;
@override final  String password;
@override@DateFormatConverter() final  DateTime birthdate;
@override@GenderConverter() final  Gender gender;
@override final  String nationality;
@override final  String phone;
@override final  String otpCode;
/// Image file for user avatar. Excluded from JSON serialization.
// ignore: invalid_annotation_target
@override@JsonKey(includeToJson: false, includeFromJson: false) final  File? image;

/// Create a copy of RegisterDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterDtoCopyWith<_RegisterDto> get copyWith => __$RegisterDtoCopyWithImpl<_RegisterDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterDto&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,password,birthdate,gender,nationality,phone,otpCode,image);

@override
String toString() {
  return 'RegisterDto(name: $name, email: $email, password: $password, birthdate: $birthdate, gender: $gender, nationality: $nationality, phone: $phone, otpCode: $otpCode, image: $image)';
}


}

/// @nodoc
abstract mixin class _$RegisterDtoCopyWith<$Res> implements $RegisterDtoCopyWith<$Res> {
  factory _$RegisterDtoCopyWith(_RegisterDto value, $Res Function(_RegisterDto) _then) = __$RegisterDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String password,@DateFormatConverter() DateTime birthdate,@GenderConverter() Gender gender, String nationality, String phone, String otpCode,@JsonKey(includeToJson: false, includeFromJson: false) File? image
});




}
/// @nodoc
class __$RegisterDtoCopyWithImpl<$Res>
    implements _$RegisterDtoCopyWith<$Res> {
  __$RegisterDtoCopyWithImpl(this._self, this._then);

  final _RegisterDto _self;
  final $Res Function(_RegisterDto) _then;

/// Create a copy of RegisterDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,Object? birthdate = null,Object? gender = null,Object? nationality = null,Object? phone = null,Object? otpCode = null,Object? image = freezed,}) {
  return _then(_RegisterDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,birthdate: null == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

// dart format on
