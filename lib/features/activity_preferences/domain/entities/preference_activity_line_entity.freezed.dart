// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_activity_line_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreferenceActivityLineEntity {

 int get id;/// The server's name, shown only for lines the app has no name for.
 String get name; List<PreferenceTagEntity> get tags;
/// Create a copy of PreferenceActivityLineEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferenceActivityLineEntityCopyWith<PreferenceActivityLineEntity> get copyWith => _$PreferenceActivityLineEntityCopyWithImpl<PreferenceActivityLineEntity>(this as PreferenceActivityLineEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferenceActivityLineEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'PreferenceActivityLineEntity(id: $id, name: $name, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $PreferenceActivityLineEntityCopyWith<$Res>  {
  factory $PreferenceActivityLineEntityCopyWith(PreferenceActivityLineEntity value, $Res Function(PreferenceActivityLineEntity) _then) = _$PreferenceActivityLineEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<PreferenceTagEntity> tags
});




}
/// @nodoc
class _$PreferenceActivityLineEntityCopyWithImpl<$Res>
    implements $PreferenceActivityLineEntityCopyWith<$Res> {
  _$PreferenceActivityLineEntityCopyWithImpl(this._self, this._then);

  final PreferenceActivityLineEntity _self;
  final $Res Function(PreferenceActivityLineEntity) _then;

/// Create a copy of PreferenceActivityLineEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<PreferenceTagEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [PreferenceActivityLineEntity].
extension PreferenceActivityLineEntityPatterns on PreferenceActivityLineEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreferenceActivityLineEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreferenceActivityLineEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreferenceActivityLineEntity value)  $default,){
final _that = this;
switch (_that) {
case _PreferenceActivityLineEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreferenceActivityLineEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PreferenceActivityLineEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  List<PreferenceTagEntity> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreferenceActivityLineEntity() when $default != null:
return $default(_that.id,_that.name,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  List<PreferenceTagEntity> tags)  $default,) {final _that = this;
switch (_that) {
case _PreferenceActivityLineEntity():
return $default(_that.id,_that.name,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  List<PreferenceTagEntity> tags)?  $default,) {final _that = this;
switch (_that) {
case _PreferenceActivityLineEntity() when $default != null:
return $default(_that.id,_that.name,_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class _PreferenceActivityLineEntity implements PreferenceActivityLineEntity {
  const _PreferenceActivityLineEntity({required this.id, required this.name, required final  List<PreferenceTagEntity> tags}): _tags = tags;
  

@override final  int id;
/// The server's name, shown only for lines the app has no name for.
@override final  String name;
 final  List<PreferenceTagEntity> _tags;
@override List<PreferenceTagEntity> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of PreferenceActivityLineEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferenceActivityLineEntityCopyWith<_PreferenceActivityLineEntity> get copyWith => __$PreferenceActivityLineEntityCopyWithImpl<_PreferenceActivityLineEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreferenceActivityLineEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'PreferenceActivityLineEntity(id: $id, name: $name, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$PreferenceActivityLineEntityCopyWith<$Res> implements $PreferenceActivityLineEntityCopyWith<$Res> {
  factory _$PreferenceActivityLineEntityCopyWith(_PreferenceActivityLineEntity value, $Res Function(_PreferenceActivityLineEntity) _then) = __$PreferenceActivityLineEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<PreferenceTagEntity> tags
});




}
/// @nodoc
class __$PreferenceActivityLineEntityCopyWithImpl<$Res>
    implements _$PreferenceActivityLineEntityCopyWith<$Res> {
  __$PreferenceActivityLineEntityCopyWithImpl(this._self, this._then);

  final _PreferenceActivityLineEntity _self;
  final $Res Function(_PreferenceActivityLineEntity) _then;

/// Create a copy of PreferenceActivityLineEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tags = null,}) {
  return _then(_PreferenceActivityLineEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<PreferenceTagEntity>,
  ));
}


}

/// @nodoc
mixin _$PreferenceTagEntity {

 int get id; String get name;
/// Create a copy of PreferenceTagEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferenceTagEntityCopyWith<PreferenceTagEntity> get copyWith => _$PreferenceTagEntityCopyWithImpl<PreferenceTagEntity>(this as PreferenceTagEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferenceTagEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'PreferenceTagEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $PreferenceTagEntityCopyWith<$Res>  {
  factory $PreferenceTagEntityCopyWith(PreferenceTagEntity value, $Res Function(PreferenceTagEntity) _then) = _$PreferenceTagEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$PreferenceTagEntityCopyWithImpl<$Res>
    implements $PreferenceTagEntityCopyWith<$Res> {
  _$PreferenceTagEntityCopyWithImpl(this._self, this._then);

  final PreferenceTagEntity _self;
  final $Res Function(PreferenceTagEntity) _then;

/// Create a copy of PreferenceTagEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PreferenceTagEntity].
extension PreferenceTagEntityPatterns on PreferenceTagEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreferenceTagEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreferenceTagEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreferenceTagEntity value)  $default,){
final _that = this;
switch (_that) {
case _PreferenceTagEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreferenceTagEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PreferenceTagEntity() when $default != null:
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
case _PreferenceTagEntity() when $default != null:
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
case _PreferenceTagEntity():
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
case _PreferenceTagEntity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _PreferenceTagEntity implements PreferenceTagEntity {
  const _PreferenceTagEntity({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of PreferenceTagEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferenceTagEntityCopyWith<_PreferenceTagEntity> get copyWith => __$PreferenceTagEntityCopyWithImpl<_PreferenceTagEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreferenceTagEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'PreferenceTagEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$PreferenceTagEntityCopyWith<$Res> implements $PreferenceTagEntityCopyWith<$Res> {
  factory _$PreferenceTagEntityCopyWith(_PreferenceTagEntity value, $Res Function(_PreferenceTagEntity) _then) = __$PreferenceTagEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$PreferenceTagEntityCopyWithImpl<$Res>
    implements _$PreferenceTagEntityCopyWith<$Res> {
  __$PreferenceTagEntityCopyWithImpl(this._self, this._then);

  final _PreferenceTagEntity _self;
  final $Res Function(_PreferenceTagEntity) _then;

/// Create a copy of PreferenceTagEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_PreferenceTagEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
