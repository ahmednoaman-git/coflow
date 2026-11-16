// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snackbar_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SnackbarItem {

 int get id; String get message; SnackbarType get type; Duration get duration;
/// Create a copy of SnackbarItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnackbarItemCopyWith<SnackbarItem> get copyWith => _$SnackbarItemCopyWithImpl<SnackbarItem>(this as SnackbarItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnackbarItem&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.type, type) || other.type == type)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,id,message,type,duration);

@override
String toString() {
  return 'SnackbarItem(id: $id, message: $message, type: $type, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $SnackbarItemCopyWith<$Res>  {
  factory $SnackbarItemCopyWith(SnackbarItem value, $Res Function(SnackbarItem) _then) = _$SnackbarItemCopyWithImpl;
@useResult
$Res call({
 int id, String message, SnackbarType type, Duration duration
});




}
/// @nodoc
class _$SnackbarItemCopyWithImpl<$Res>
    implements $SnackbarItemCopyWith<$Res> {
  _$SnackbarItemCopyWithImpl(this._self, this._then);

  final SnackbarItem _self;
  final $Res Function(SnackbarItem) _then;

/// Create a copy of SnackbarItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? message = null,Object? type = null,Object? duration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SnackbarType,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [SnackbarItem].
extension SnackbarItemPatterns on SnackbarItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnackbarItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnackbarItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnackbarItem value)  $default,){
final _that = this;
switch (_that) {
case _SnackbarItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnackbarItem value)?  $default,){
final _that = this;
switch (_that) {
case _SnackbarItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String message,  SnackbarType type,  Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnackbarItem() when $default != null:
return $default(_that.id,_that.message,_that.type,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String message,  SnackbarType type,  Duration duration)  $default,) {final _that = this;
switch (_that) {
case _SnackbarItem():
return $default(_that.id,_that.message,_that.type,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String message,  SnackbarType type,  Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _SnackbarItem() when $default != null:
return $default(_that.id,_that.message,_that.type,_that.duration);case _:
  return null;

}
}

}

/// @nodoc


class _SnackbarItem implements SnackbarItem {
  const _SnackbarItem({required this.id, required this.message, required this.type, required this.duration});
  

@override final  int id;
@override final  String message;
@override final  SnackbarType type;
@override final  Duration duration;

/// Create a copy of SnackbarItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnackbarItemCopyWith<_SnackbarItem> get copyWith => __$SnackbarItemCopyWithImpl<_SnackbarItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnackbarItem&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.type, type) || other.type == type)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,id,message,type,duration);

@override
String toString() {
  return 'SnackbarItem(id: $id, message: $message, type: $type, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$SnackbarItemCopyWith<$Res> implements $SnackbarItemCopyWith<$Res> {
  factory _$SnackbarItemCopyWith(_SnackbarItem value, $Res Function(_SnackbarItem) _then) = __$SnackbarItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String message, SnackbarType type, Duration duration
});




}
/// @nodoc
class __$SnackbarItemCopyWithImpl<$Res>
    implements _$SnackbarItemCopyWith<$Res> {
  __$SnackbarItemCopyWithImpl(this._self, this._then);

  final _SnackbarItem _self;
  final $Res Function(_SnackbarItem) _then;

/// Create a copy of SnackbarItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? message = null,Object? type = null,Object? duration = null,}) {
  return _then(_SnackbarItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SnackbarType,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
