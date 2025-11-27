// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalizationState {

 Locale? get locale;
/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizationStateCopyWith<LocalizationState> get copyWith => _$LocalizationStateCopyWithImpl<LocalizationState>(this as LocalizationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizationState&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'LocalizationState(locale: $locale)';
}


}

/// @nodoc
abstract mixin class $LocalizationStateCopyWith<$Res>  {
  factory $LocalizationStateCopyWith(LocalizationState value, $Res Function(LocalizationState) _then) = _$LocalizationStateCopyWithImpl;
@useResult
$Res call({
 Locale? locale
});




}
/// @nodoc
class _$LocalizationStateCopyWithImpl<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  _$LocalizationStateCopyWithImpl(this._self, this._then);

  final LocalizationState _self;
  final $Res Function(LocalizationState) _then;

/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = freezed,}) {
  return _then(_self.copyWith(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizationState].
extension LocalizationStatePatterns on LocalizationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizationState value)  $default,){
final _that = this;
switch (_that) {
case _LocalizationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizationState value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Locale? locale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizationState() when $default != null:
return $default(_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Locale? locale)  $default,) {final _that = this;
switch (_that) {
case _LocalizationState():
return $default(_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Locale? locale)?  $default,) {final _that = this;
switch (_that) {
case _LocalizationState() when $default != null:
return $default(_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _LocalizationState implements LocalizationState {
  const _LocalizationState({this.locale});
  

@override final  Locale? locale;

/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizationStateCopyWith<_LocalizationState> get copyWith => __$LocalizationStateCopyWithImpl<_LocalizationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizationState&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'LocalizationState(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$LocalizationStateCopyWith<$Res> implements $LocalizationStateCopyWith<$Res> {
  factory _$LocalizationStateCopyWith(_LocalizationState value, $Res Function(_LocalizationState) _then) = __$LocalizationStateCopyWithImpl;
@override @useResult
$Res call({
 Locale? locale
});




}
/// @nodoc
class __$LocalizationStateCopyWithImpl<$Res>
    implements _$LocalizationStateCopyWith<$Res> {
  __$LocalizationStateCopyWithImpl(this._self, this._then);

  final _LocalizationState _self;
  final $Res Function(_LocalizationState) _then;

/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = freezed,}) {
  return _then(_LocalizationState(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale?,
  ));
}


}

// dart format on
