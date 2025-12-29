// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instructor_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InstructorEntity {

 int get id; String get name; String? get image; String? get title;
/// Create a copy of InstructorEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstructorEntityCopyWith<InstructorEntity> get copyWith => _$InstructorEntityCopyWithImpl<InstructorEntity>(this as InstructorEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InstructorEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,image,title);

@override
String toString() {
  return 'InstructorEntity(id: $id, name: $name, image: $image, title: $title)';
}


}

/// @nodoc
abstract mixin class $InstructorEntityCopyWith<$Res>  {
  factory $InstructorEntityCopyWith(InstructorEntity value, $Res Function(InstructorEntity) _then) = _$InstructorEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? image, String? title
});




}
/// @nodoc
class _$InstructorEntityCopyWithImpl<$Res>
    implements $InstructorEntityCopyWith<$Res> {
  _$InstructorEntityCopyWithImpl(this._self, this._then);

  final InstructorEntity _self;
  final $Res Function(InstructorEntity) _then;

/// Create a copy of InstructorEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = freezed,Object? title = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InstructorEntity].
extension InstructorEntityPatterns on InstructorEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InstructorEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InstructorEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InstructorEntity value)  $default,){
final _that = this;
switch (_that) {
case _InstructorEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InstructorEntity value)?  $default,){
final _that = this;
switch (_that) {
case _InstructorEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? image,  String? title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InstructorEntity() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? image,  String? title)  $default,) {final _that = this;
switch (_that) {
case _InstructorEntity():
return $default(_that.id,_that.name,_that.image,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? image,  String? title)?  $default,) {final _that = this;
switch (_that) {
case _InstructorEntity() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.title);case _:
  return null;

}
}

}

/// @nodoc


class _InstructorEntity implements InstructorEntity {
  const _InstructorEntity({required this.id, required this.name, required this.image, required this.title});
  

@override final  int id;
@override final  String name;
@override final  String? image;
@override final  String? title;

/// Create a copy of InstructorEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstructorEntityCopyWith<_InstructorEntity> get copyWith => __$InstructorEntityCopyWithImpl<_InstructorEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstructorEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,image,title);

@override
String toString() {
  return 'InstructorEntity(id: $id, name: $name, image: $image, title: $title)';
}


}

/// @nodoc
abstract mixin class _$InstructorEntityCopyWith<$Res> implements $InstructorEntityCopyWith<$Res> {
  factory _$InstructorEntityCopyWith(_InstructorEntity value, $Res Function(_InstructorEntity) _then) = __$InstructorEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? image, String? title
});




}
/// @nodoc
class __$InstructorEntityCopyWithImpl<$Res>
    implements _$InstructorEntityCopyWith<$Res> {
  __$InstructorEntityCopyWithImpl(this._self, this._then);

  final _InstructorEntity _self;
  final $Res Function(_InstructorEntity) _then;

/// Create a copy of InstructorEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = freezed,Object? title = freezed,}) {
  return _then(_InstructorEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
