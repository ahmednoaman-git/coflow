// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_support_requests_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetSupportRequestsDto {

 int get page; int get limit;
/// Create a copy of GetSupportRequestsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSupportRequestsDtoCopyWith<GetSupportRequestsDto> get copyWith => _$GetSupportRequestsDtoCopyWithImpl<GetSupportRequestsDto>(this as GetSupportRequestsDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSupportRequestsDto&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,page,limit);

@override
String toString() {
  return 'GetSupportRequestsDto(page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $GetSupportRequestsDtoCopyWith<$Res>  {
  factory $GetSupportRequestsDtoCopyWith(GetSupportRequestsDto value, $Res Function(GetSupportRequestsDto) _then) = _$GetSupportRequestsDtoCopyWithImpl;
@useResult
$Res call({
 int page, int limit
});




}
/// @nodoc
class _$GetSupportRequestsDtoCopyWithImpl<$Res>
    implements $GetSupportRequestsDtoCopyWith<$Res> {
  _$GetSupportRequestsDtoCopyWithImpl(this._self, this._then);

  final GetSupportRequestsDto _self;
  final $Res Function(GetSupportRequestsDto) _then;

/// Create a copy of GetSupportRequestsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetSupportRequestsDto].
extension GetSupportRequestsDtoPatterns on GetSupportRequestsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetSupportRequestsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetSupportRequestsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetSupportRequestsDto value)  $default,){
final _that = this;
switch (_that) {
case _GetSupportRequestsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetSupportRequestsDto value)?  $default,){
final _that = this;
switch (_that) {
case _GetSupportRequestsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetSupportRequestsDto() when $default != null:
return $default(_that.page,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit)  $default,) {final _that = this;
switch (_that) {
case _GetSupportRequestsDto():
return $default(_that.page,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _GetSupportRequestsDto() when $default != null:
return $default(_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _GetSupportRequestsDto extends GetSupportRequestsDto {
  const _GetSupportRequestsDto({required this.page, this.limit = GetSupportRequestsDto.pageSize}): super._();
  

@override final  int page;
@override@JsonKey() final  int limit;

/// Create a copy of GetSupportRequestsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSupportRequestsDtoCopyWith<_GetSupportRequestsDto> get copyWith => __$GetSupportRequestsDtoCopyWithImpl<_GetSupportRequestsDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSupportRequestsDto&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,page,limit);

@override
String toString() {
  return 'GetSupportRequestsDto(page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$GetSupportRequestsDtoCopyWith<$Res> implements $GetSupportRequestsDtoCopyWith<$Res> {
  factory _$GetSupportRequestsDtoCopyWith(_GetSupportRequestsDto value, $Res Function(_GetSupportRequestsDto) _then) = __$GetSupportRequestsDtoCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit
});




}
/// @nodoc
class __$GetSupportRequestsDtoCopyWithImpl<$Res>
    implements _$GetSupportRequestsDtoCopyWith<$Res> {
  __$GetSupportRequestsDtoCopyWithImpl(this._self, this._then);

  final _GetSupportRequestsDto _self;
  final $Res Function(_GetSupportRequestsDto) _then;

/// Create a copy of GetSupportRequestsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,}) {
  return _then(_GetSupportRequestsDto(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
