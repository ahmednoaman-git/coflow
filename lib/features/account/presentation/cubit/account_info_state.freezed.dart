// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountInfoState {

 AsyncState<ProfileEntity> get updateRequest; AsyncState<ProfileEntity> get imageRequest; AsyncState<void> get passwordRequest; AsyncState<List<NationalityEntity>> get nationalitiesRequest;
/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountInfoStateCopyWith<AccountInfoState> get copyWith => _$AccountInfoStateCopyWithImpl<AccountInfoState>(this as AccountInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountInfoState&&(identical(other.updateRequest, updateRequest) || other.updateRequest == updateRequest)&&(identical(other.imageRequest, imageRequest) || other.imageRequest == imageRequest)&&(identical(other.passwordRequest, passwordRequest) || other.passwordRequest == passwordRequest)&&(identical(other.nationalitiesRequest, nationalitiesRequest) || other.nationalitiesRequest == nationalitiesRequest));
}


@override
int get hashCode => Object.hash(runtimeType,updateRequest,imageRequest,passwordRequest,nationalitiesRequest);

@override
String toString() {
  return 'AccountInfoState(updateRequest: $updateRequest, imageRequest: $imageRequest, passwordRequest: $passwordRequest, nationalitiesRequest: $nationalitiesRequest)';
}


}

/// @nodoc
abstract mixin class $AccountInfoStateCopyWith<$Res>  {
  factory $AccountInfoStateCopyWith(AccountInfoState value, $Res Function(AccountInfoState) _then) = _$AccountInfoStateCopyWithImpl;
@useResult
$Res call({
 AsyncState<ProfileEntity> updateRequest, AsyncState<ProfileEntity> imageRequest, AsyncState<void> passwordRequest, AsyncState<List<NationalityEntity>> nationalitiesRequest
});


$AsyncStateCopyWith<ProfileEntity, $Res> get updateRequest;$AsyncStateCopyWith<ProfileEntity, $Res> get imageRequest;$AsyncStateCopyWith<void, $Res> get passwordRequest;$AsyncStateCopyWith<List<NationalityEntity>, $Res> get nationalitiesRequest;

}
/// @nodoc
class _$AccountInfoStateCopyWithImpl<$Res>
    implements $AccountInfoStateCopyWith<$Res> {
  _$AccountInfoStateCopyWithImpl(this._self, this._then);

  final AccountInfoState _self;
  final $Res Function(AccountInfoState) _then;

/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updateRequest = null,Object? imageRequest = null,Object? passwordRequest = null,Object? nationalitiesRequest = null,}) {
  return _then(_self.copyWith(
updateRequest: null == updateRequest ? _self.updateRequest : updateRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ProfileEntity>,imageRequest: null == imageRequest ? _self.imageRequest : imageRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ProfileEntity>,passwordRequest: null == passwordRequest ? _self.passwordRequest : passwordRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,nationalitiesRequest: null == nationalitiesRequest ? _self.nationalitiesRequest : nationalitiesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<NationalityEntity>>,
  ));
}
/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ProfileEntity, $Res> get updateRequest {
  
  return $AsyncStateCopyWith<ProfileEntity, $Res>(_self.updateRequest, (value) {
    return _then(_self.copyWith(updateRequest: value));
  });
}/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ProfileEntity, $Res> get imageRequest {
  
  return $AsyncStateCopyWith<ProfileEntity, $Res>(_self.imageRequest, (value) {
    return _then(_self.copyWith(imageRequest: value));
  });
}/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get passwordRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.passwordRequest, (value) {
    return _then(_self.copyWith(passwordRequest: value));
  });
}/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<NationalityEntity>, $Res> get nationalitiesRequest {
  
  return $AsyncStateCopyWith<List<NationalityEntity>, $Res>(_self.nationalitiesRequest, (value) {
    return _then(_self.copyWith(nationalitiesRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountInfoState].
extension AccountInfoStatePatterns on AccountInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountInfoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountInfoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountInfoState value)  $default,){
final _that = this;
switch (_that) {
case _AccountInfoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountInfoState value)?  $default,){
final _that = this;
switch (_that) {
case _AccountInfoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncState<ProfileEntity> updateRequest,  AsyncState<ProfileEntity> imageRequest,  AsyncState<void> passwordRequest,  AsyncState<List<NationalityEntity>> nationalitiesRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountInfoState() when $default != null:
return $default(_that.updateRequest,_that.imageRequest,_that.passwordRequest,_that.nationalitiesRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncState<ProfileEntity> updateRequest,  AsyncState<ProfileEntity> imageRequest,  AsyncState<void> passwordRequest,  AsyncState<List<NationalityEntity>> nationalitiesRequest)  $default,) {final _that = this;
switch (_that) {
case _AccountInfoState():
return $default(_that.updateRequest,_that.imageRequest,_that.passwordRequest,_that.nationalitiesRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncState<ProfileEntity> updateRequest,  AsyncState<ProfileEntity> imageRequest,  AsyncState<void> passwordRequest,  AsyncState<List<NationalityEntity>> nationalitiesRequest)?  $default,) {final _that = this;
switch (_that) {
case _AccountInfoState() when $default != null:
return $default(_that.updateRequest,_that.imageRequest,_that.passwordRequest,_that.nationalitiesRequest);case _:
  return null;

}
}

}

/// @nodoc


class _AccountInfoState implements AccountInfoState {
  const _AccountInfoState({this.updateRequest = const AsyncState.idle(), this.imageRequest = const AsyncState.idle(), this.passwordRequest = const AsyncState.idle(), this.nationalitiesRequest = const AsyncState.idle()});
  

@override@JsonKey() final  AsyncState<ProfileEntity> updateRequest;
@override@JsonKey() final  AsyncState<ProfileEntity> imageRequest;
@override@JsonKey() final  AsyncState<void> passwordRequest;
@override@JsonKey() final  AsyncState<List<NationalityEntity>> nationalitiesRequest;

/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountInfoStateCopyWith<_AccountInfoState> get copyWith => __$AccountInfoStateCopyWithImpl<_AccountInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountInfoState&&(identical(other.updateRequest, updateRequest) || other.updateRequest == updateRequest)&&(identical(other.imageRequest, imageRequest) || other.imageRequest == imageRequest)&&(identical(other.passwordRequest, passwordRequest) || other.passwordRequest == passwordRequest)&&(identical(other.nationalitiesRequest, nationalitiesRequest) || other.nationalitiesRequest == nationalitiesRequest));
}


@override
int get hashCode => Object.hash(runtimeType,updateRequest,imageRequest,passwordRequest,nationalitiesRequest);

@override
String toString() {
  return 'AccountInfoState(updateRequest: $updateRequest, imageRequest: $imageRequest, passwordRequest: $passwordRequest, nationalitiesRequest: $nationalitiesRequest)';
}


}

/// @nodoc
abstract mixin class _$AccountInfoStateCopyWith<$Res> implements $AccountInfoStateCopyWith<$Res> {
  factory _$AccountInfoStateCopyWith(_AccountInfoState value, $Res Function(_AccountInfoState) _then) = __$AccountInfoStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncState<ProfileEntity> updateRequest, AsyncState<ProfileEntity> imageRequest, AsyncState<void> passwordRequest, AsyncState<List<NationalityEntity>> nationalitiesRequest
});


@override $AsyncStateCopyWith<ProfileEntity, $Res> get updateRequest;@override $AsyncStateCopyWith<ProfileEntity, $Res> get imageRequest;@override $AsyncStateCopyWith<void, $Res> get passwordRequest;@override $AsyncStateCopyWith<List<NationalityEntity>, $Res> get nationalitiesRequest;

}
/// @nodoc
class __$AccountInfoStateCopyWithImpl<$Res>
    implements _$AccountInfoStateCopyWith<$Res> {
  __$AccountInfoStateCopyWithImpl(this._self, this._then);

  final _AccountInfoState _self;
  final $Res Function(_AccountInfoState) _then;

/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updateRequest = null,Object? imageRequest = null,Object? passwordRequest = null,Object? nationalitiesRequest = null,}) {
  return _then(_AccountInfoState(
updateRequest: null == updateRequest ? _self.updateRequest : updateRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ProfileEntity>,imageRequest: null == imageRequest ? _self.imageRequest : imageRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<ProfileEntity>,passwordRequest: null == passwordRequest ? _self.passwordRequest : passwordRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<void>,nationalitiesRequest: null == nationalitiesRequest ? _self.nationalitiesRequest : nationalitiesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<List<NationalityEntity>>,
  ));
}

/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ProfileEntity, $Res> get updateRequest {
  
  return $AsyncStateCopyWith<ProfileEntity, $Res>(_self.updateRequest, (value) {
    return _then(_self.copyWith(updateRequest: value));
  });
}/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<ProfileEntity, $Res> get imageRequest {
  
  return $AsyncStateCopyWith<ProfileEntity, $Res>(_self.imageRequest, (value) {
    return _then(_self.copyWith(imageRequest: value));
  });
}/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<void, $Res> get passwordRequest {
  
  return $AsyncStateCopyWith<void, $Res>(_self.passwordRequest, (value) {
    return _then(_self.copyWith(passwordRequest: value));
  });
}/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<List<NationalityEntity>, $Res> get nationalitiesRequest {
  
  return $AsyncStateCopyWith<List<NationalityEntity>, $Res>(_self.nationalitiesRequest, (value) {
    return _then(_self.copyWith(nationalitiesRequest: value));
  });
}
}

// dart format on
