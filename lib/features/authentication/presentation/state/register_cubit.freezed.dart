// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState {

// Current page index (0-based)
 int get pageIndex;// Step 1: Basic info
 String get name; String get email; String get password; bool get isPasswordVisible;// Step 2: Profile details
 DateTime? get birthdate; Gender get gender; String? get nationality; String get phone; File? get image;// Step 3: OTP verification
 String get otpCode;// Async request states
 AsyncState<List<String>> get nationalitiesRequest; AsyncState<void> get sendOtpRequest; AsyncState<void> get verifyOtpRequest; AsyncState<UserEntity> get registerRequest;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.image, image) || other.image == image)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.nationalitiesRequest, nationalitiesRequest) || other.nationalitiesRequest == nationalitiesRequest)&&(identical(other.sendOtpRequest, sendOtpRequest) || other.sendOtpRequest == sendOtpRequest)&&(identical(other.verifyOtpRequest, verifyOtpRequest) || other.verifyOtpRequest == verifyOtpRequest)&&(identical(other.registerRequest, registerRequest) || other.registerRequest == registerRequest));
}


@override
int get hashCode => Object.hash(runtimeType,pageIndex,name,email,password,isPasswordVisible,birthdate,gender,nationality,phone,image,otpCode,nationalitiesRequest,sendOtpRequest,verifyOtpRequest,registerRequest);

@override
String toString() {
  return 'RegisterState(pageIndex: $pageIndex, name: $name, email: $email, password: $password, isPasswordVisible: $isPasswordVisible, birthdate: $birthdate, gender: $gender, nationality: $nationality, phone: $phone, image: $image, otpCode: $otpCode, nationalitiesRequest: $nationalitiesRequest, sendOtpRequest: $sendOtpRequest, verifyOtpRequest: $verifyOtpRequest, registerRequest: $registerRequest)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 int pageIndex, String name, String email, String password, bool isPasswordVisible, DateTime? birthdate, Gender gender, String? nationality, String phone, File? image, String otpCode, AsyncState<List<String>> nationalitiesRequest, AsyncState<void> sendOtpRequest, AsyncState<void> verifyOtpRequest, AsyncState<UserEntity> registerRequest
});


$AsyncStateCopyWith<List<String>, $Res> get nationalitiesRequest;$AsyncStateCopyWith<void, $Res> get sendOtpRequest;$AsyncStateCopyWith<void, $Res> get verifyOtpRequest;$AsyncStateCopyWith<UserEntity, $Res> get registerRequest;

}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageIndex = null,Object? name = null,Object? email = null,Object? password = null,Object? isPasswordVisible = null,Object? birthdate = freezed,Object? gender = null,Object? nationality = freezed,Object? phone = null,Object? image = freezed,Object? otpCode = null,Object? nationalitiesRequest = null,Object? sendOtpRequest = null,Object? verifyOtpRequest = null,Object? registerRequest = null,}) {
  return _then(_self.copyWith(
pageIndex: null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,nationalitiesRequest: null == nationalitiesRequest ? _self.nationalitiesRequest : nationalitiesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<String>>,sendOtpRequest: null == sendOtpRequest ? _self.sendOtpRequest : sendOtpRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,verifyOtpRequest: null == verifyOtpRequest ? _self.verifyOtpRequest : verifyOtpRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,registerRequest: null == registerRequest ? _self.registerRequest : registerRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<UserEntity>,
  ));
}
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<String>, $Res> get nationalitiesRequest {
  
  return $AsyncStateCopyWith<List<String>, $Res>(_self.nationalitiesRequest, (value) {
    return _then(_self.copyWith(nationalitiesRequest: value));
  });
}/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get sendOtpRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.sendOtpRequest, (value) {
    return _then(_self.copyWith(sendOtpRequest: value));
  });
}/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get verifyOtpRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.verifyOtpRequest, (value) {
    return _then(_self.copyWith(verifyOtpRequest: value));
  });
}/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<UserEntity, $Res> get registerRequest {
  
  return $AsyncStateCopyWith<UserEntity, $Res>(_self.registerRequest, (value) {
    return _then(_self.copyWith(registerRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterState value)  $default,){
final _that = this;
switch (_that) {
case _RegisterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pageIndex,  String name,  String email,  String password,  bool isPasswordVisible,  DateTime? birthdate,  Gender gender,  String? nationality,  String phone,  File? image,  String otpCode,  AsyncState<List<String>> nationalitiesRequest,  AsyncState<void> sendOtpRequest,  AsyncState<void> verifyOtpRequest,  AsyncState<UserEntity> registerRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.pageIndex,_that.name,_that.email,_that.password,_that.isPasswordVisible,_that.birthdate,_that.gender,_that.nationality,_that.phone,_that.image,_that.otpCode,_that.nationalitiesRequest,_that.sendOtpRequest,_that.verifyOtpRequest,_that.registerRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pageIndex,  String name,  String email,  String password,  bool isPasswordVisible,  DateTime? birthdate,  Gender gender,  String? nationality,  String phone,  File? image,  String otpCode,  AsyncState<List<String>> nationalitiesRequest,  AsyncState<void> sendOtpRequest,  AsyncState<void> verifyOtpRequest,  AsyncState<UserEntity> registerRequest)  $default,) {final _that = this;
switch (_that) {
case _RegisterState():
return $default(_that.pageIndex,_that.name,_that.email,_that.password,_that.isPasswordVisible,_that.birthdate,_that.gender,_that.nationality,_that.phone,_that.image,_that.otpCode,_that.nationalitiesRequest,_that.sendOtpRequest,_that.verifyOtpRequest,_that.registerRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pageIndex,  String name,  String email,  String password,  bool isPasswordVisible,  DateTime? birthdate,  Gender gender,  String? nationality,  String phone,  File? image,  String otpCode,  AsyncState<List<String>> nationalitiesRequest,  AsyncState<void> sendOtpRequest,  AsyncState<void> verifyOtpRequest,  AsyncState<UserEntity> registerRequest)?  $default,) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.pageIndex,_that.name,_that.email,_that.password,_that.isPasswordVisible,_that.birthdate,_that.gender,_that.nationality,_that.phone,_that.image,_that.otpCode,_that.nationalitiesRequest,_that.sendOtpRequest,_that.verifyOtpRequest,_that.registerRequest);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterState extends RegisterState {
  const _RegisterState({this.pageIndex = 0, this.name = '', this.email = '', this.password = '', this.isPasswordVisible = false, this.birthdate, this.gender = Gender.male, this.nationality, this.phone = '', this.image, this.otpCode = '', this.nationalitiesRequest = const AsyncState.idle(), this.sendOtpRequest = const AsyncState.idle(), this.verifyOtpRequest = const AsyncState.idle(), this.registerRequest = const AsyncState.idle()}): super._();
  

// Current page index (0-based)
@override@JsonKey() final  int pageIndex;
// Step 1: Basic info
@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override@JsonKey() final  bool isPasswordVisible;
// Step 2: Profile details
@override final  DateTime? birthdate;
@override@JsonKey() final  Gender gender;
@override final  String? nationality;
@override@JsonKey() final  String phone;
@override final  File? image;
// Step 3: OTP verification
@override@JsonKey() final  String otpCode;
// Async request states
@override@JsonKey() final  AsyncState<List<String>> nationalitiesRequest;
@override@JsonKey() final  AsyncState<void> sendOtpRequest;
@override@JsonKey() final  AsyncState<void> verifyOtpRequest;
@override@JsonKey() final  AsyncState<UserEntity> registerRequest;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.image, image) || other.image == image)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.nationalitiesRequest, nationalitiesRequest) || other.nationalitiesRequest == nationalitiesRequest)&&(identical(other.sendOtpRequest, sendOtpRequest) || other.sendOtpRequest == sendOtpRequest)&&(identical(other.verifyOtpRequest, verifyOtpRequest) || other.verifyOtpRequest == verifyOtpRequest)&&(identical(other.registerRequest, registerRequest) || other.registerRequest == registerRequest));
}


@override
int get hashCode => Object.hash(runtimeType,pageIndex,name,email,password,isPasswordVisible,birthdate,gender,nationality,phone,image,otpCode,nationalitiesRequest,sendOtpRequest,verifyOtpRequest,registerRequest);

@override
String toString() {
  return 'RegisterState(pageIndex: $pageIndex, name: $name, email: $email, password: $password, isPasswordVisible: $isPasswordVisible, birthdate: $birthdate, gender: $gender, nationality: $nationality, phone: $phone, image: $image, otpCode: $otpCode, nationalitiesRequest: $nationalitiesRequest, sendOtpRequest: $sendOtpRequest, verifyOtpRequest: $verifyOtpRequest, registerRequest: $registerRequest)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 int pageIndex, String name, String email, String password, bool isPasswordVisible, DateTime? birthdate, Gender gender, String? nationality, String phone, File? image, String otpCode, AsyncState<List<String>> nationalitiesRequest, AsyncState<void> sendOtpRequest, AsyncState<void> verifyOtpRequest, AsyncState<UserEntity> registerRequest
});


@override $AsyncStateCopyWith<List<String>, $Res> get nationalitiesRequest;@override $AsyncStateCopyWith<void, $Res> get sendOtpRequest;@override $AsyncStateCopyWith<void, $Res> get verifyOtpRequest;@override $AsyncStateCopyWith<UserEntity, $Res> get registerRequest;

}
/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageIndex = null,Object? name = null,Object? email = null,Object? password = null,Object? isPasswordVisible = null,Object? birthdate = freezed,Object? gender = null,Object? nationality = freezed,Object? phone = null,Object? image = freezed,Object? otpCode = null,Object? nationalitiesRequest = null,Object? sendOtpRequest = null,Object? verifyOtpRequest = null,Object? registerRequest = null,}) {
  return _then(_RegisterState(
pageIndex: null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,otpCode: null == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String,nationalitiesRequest: null == nationalitiesRequest ? _self.nationalitiesRequest : nationalitiesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<String>>,sendOtpRequest: null == sendOtpRequest ? _self.sendOtpRequest : sendOtpRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,verifyOtpRequest: null == verifyOtpRequest ? _self.verifyOtpRequest : verifyOtpRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,registerRequest: null == registerRequest ? _self.registerRequest : registerRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<UserEntity>,
  ));
}

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<String>, $Res> get nationalitiesRequest {
  
  return $AsyncStateCopyWith<List<String>, $Res>(_self.nationalitiesRequest, (value) {
    return _then(_self.copyWith(nationalitiesRequest: value));
  });
}/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get sendOtpRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.sendOtpRequest, (value) {
    return _then(_self.copyWith(sendOtpRequest: value));
  });
}/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get verifyOtpRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.verifyOtpRequest, (value) {
    return _then(_self.copyWith(verifyOtpRequest: value));
  });
}/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<UserEntity, $Res> get registerRequest {
  
  return $AsyncStateCopyWith<UserEntity, $Res>(_self.registerRequest, (value) {
    return _then(_self.copyWith(registerRequest: value));
  });
}
}

// dart format on
