// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TagEntity {

 int get id; String get name;
/// Create a copy of TagEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagEntityCopyWith<TagEntity> get copyWith => _$TagEntityCopyWithImpl<TagEntity>(this as TagEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TagEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $TagEntityCopyWith<$Res>  {
  factory $TagEntityCopyWith(TagEntity value, $Res Function(TagEntity) _then) = _$TagEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$TagEntityCopyWithImpl<$Res>
    implements $TagEntityCopyWith<$Res> {
  _$TagEntityCopyWithImpl(this._self, this._then);

  final TagEntity _self;
  final $Res Function(TagEntity) _then;

/// Create a copy of TagEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TagEntity].
extension TagEntityPatterns on TagEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagEntity value)  $default,){
final _that = this;
switch (_that) {
case _TagEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TagEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagEntity() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _TagEntity():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _TagEntity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _TagEntity implements TagEntity {
  const _TagEntity({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of TagEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagEntityCopyWith<_TagEntity> get copyWith => __$TagEntityCopyWithImpl<_TagEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TagEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TagEntityCopyWith<$Res> implements $TagEntityCopyWith<$Res> {
  factory _$TagEntityCopyWith(_TagEntity value, $Res Function(_TagEntity) _then) = __$TagEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$TagEntityCopyWithImpl<$Res>
    implements _$TagEntityCopyWith<$Res> {
  __$TagEntityCopyWithImpl(this._self, this._then);

  final _TagEntity _self;
  final $Res Function(_TagEntity) _then;

/// Create a copy of TagEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_TagEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$TagWithCountEntity {

 int get id; String get name; int get count;
/// Create a copy of TagWithCountEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagWithCountEntityCopyWith<TagWithCountEntity> get copyWith => _$TagWithCountEntityCopyWithImpl<TagWithCountEntity>(this as TagWithCountEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagWithCountEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,count);

@override
String toString() {
  return 'TagWithCountEntity(id: $id, name: $name, count: $count)';
}


}

/// @nodoc
abstract mixin class $TagWithCountEntityCopyWith<$Res>  {
  factory $TagWithCountEntityCopyWith(TagWithCountEntity value, $Res Function(TagWithCountEntity) _then) = _$TagWithCountEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, int count
});




}
/// @nodoc
class _$TagWithCountEntityCopyWithImpl<$Res>
    implements $TagWithCountEntityCopyWith<$Res> {
  _$TagWithCountEntityCopyWithImpl(this._self, this._then);

  final TagWithCountEntity _self;
  final $Res Function(TagWithCountEntity) _then;

/// Create a copy of TagWithCountEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? count = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TagWithCountEntity].
extension TagWithCountEntityPatterns on TagWithCountEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagWithCountEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagWithCountEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagWithCountEntity value)  $default,){
final _that = this;
switch (_that) {
case _TagWithCountEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagWithCountEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TagWithCountEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagWithCountEntity() when $default != null:
return $default(_that.id,_that.name,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int count)  $default,) {final _that = this;
switch (_that) {
case _TagWithCountEntity():
return $default(_that.id,_that.name,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int count)?  $default,) {final _that = this;
switch (_that) {
case _TagWithCountEntity() when $default != null:
return $default(_that.id,_that.name,_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _TagWithCountEntity implements TagWithCountEntity {
  const _TagWithCountEntity({required this.id, required this.name, required this.count});
  

@override final  int id;
@override final  String name;
@override final  int count;

/// Create a copy of TagWithCountEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagWithCountEntityCopyWith<_TagWithCountEntity> get copyWith => __$TagWithCountEntityCopyWithImpl<_TagWithCountEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagWithCountEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,count);

@override
String toString() {
  return 'TagWithCountEntity(id: $id, name: $name, count: $count)';
}


}

/// @nodoc
abstract mixin class _$TagWithCountEntityCopyWith<$Res> implements $TagWithCountEntityCopyWith<$Res> {
  factory _$TagWithCountEntityCopyWith(_TagWithCountEntity value, $Res Function(_TagWithCountEntity) _then) = __$TagWithCountEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int count
});




}
/// @nodoc
class __$TagWithCountEntityCopyWithImpl<$Res>
    implements _$TagWithCountEntityCopyWith<$Res> {
  __$TagWithCountEntityCopyWithImpl(this._self, this._then);

  final _TagWithCountEntity _self;
  final $Res Function(_TagWithCountEntity) _then;

/// Create a copy of TagWithCountEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? count = null,}) {
  return _then(_TagWithCountEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
