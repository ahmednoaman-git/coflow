// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SplashInitial value)?  initial,TResult Function( SplashAuthenticated value)?  authenticated,TResult Function( SplashUnauthenticated value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SplashInitial() when initial != null:
return initial(_that);case SplashAuthenticated() when authenticated != null:
return authenticated(_that);case SplashUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SplashInitial value)  initial,required TResult Function( SplashAuthenticated value)  authenticated,required TResult Function( SplashUnauthenticated value)  unauthenticated,}){
final _that = this;
switch (_that) {
case SplashInitial():
return initial(_that);case SplashAuthenticated():
return authenticated(_that);case SplashUnauthenticated():
return unauthenticated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SplashInitial value)?  initial,TResult? Function( SplashAuthenticated value)?  authenticated,TResult? Function( SplashUnauthenticated value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case SplashInitial() when initial != null:
return initial(_that);case SplashAuthenticated() when authenticated != null:
return authenticated(_that);case SplashUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  authenticated,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SplashInitial() when initial != null:
return initial();case SplashAuthenticated() when authenticated != null:
return authenticated();case SplashUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  authenticated,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case SplashInitial():
return initial();case SplashAuthenticated():
return authenticated();case SplashUnauthenticated():
return unauthenticated();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  authenticated,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case SplashInitial() when initial != null:
return initial();case SplashAuthenticated() when authenticated != null:
return authenticated();case SplashUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class SplashInitial implements SplashState {
  const SplashInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.initial()';
}


}




/// @nodoc


class SplashAuthenticated implements SplashState {
  const SplashAuthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashAuthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.authenticated()';
}


}




/// @nodoc


class SplashUnauthenticated implements SplashState {
  const SplashUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.unauthenticated()';
}


}




// dart format on
