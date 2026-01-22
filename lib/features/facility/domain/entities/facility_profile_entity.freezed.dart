// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityProfileEntity {

 int get id; String get name; String? get title; String? get year; String? get bio; int? get likesCount; String? get logoUrl; String? get coverUrl; List<String> get tags;
/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityProfileEntityCopyWith<FacilityProfileEntity> get copyWith => _$FacilityProfileEntityCopyWithImpl<FacilityProfileEntity>(this as FacilityProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,title,year,bio,likesCount,logoUrl,coverUrl,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'FacilityProfileEntity(id: $id, name: $name, title: $title, year: $year, bio: $bio, likesCount: $likesCount, logoUrl: $logoUrl, coverUrl: $coverUrl, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $FacilityProfileEntityCopyWith<$Res>  {
  factory $FacilityProfileEntityCopyWith(FacilityProfileEntity value, $Res Function(FacilityProfileEntity) _then) = _$FacilityProfileEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? title, String? year, String? bio, int? likesCount, String? logoUrl, String? coverUrl, List<String> tags
});




}
/// @nodoc
class _$FacilityProfileEntityCopyWithImpl<$Res>
    implements $FacilityProfileEntityCopyWith<$Res> {
  _$FacilityProfileEntityCopyWithImpl(this._self, this._then);

  final FacilityProfileEntity _self;
  final $Res Function(FacilityProfileEntity) _then;

/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? title = freezed,Object? year = freezed,Object? bio = freezed,Object? likesCount = freezed,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? tags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,likesCount: freezed == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityProfileEntity].
extension FacilityProfileEntityPatterns on FacilityProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? title,  String? year,  String? bio,  int? likesCount,  String? logoUrl,  String? coverUrl,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.year,_that.bio,_that.likesCount,_that.logoUrl,_that.coverUrl,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? title,  String? year,  String? bio,  int? likesCount,  String? logoUrl,  String? coverUrl,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _FacilityProfileEntity():
return $default(_that.id,_that.name,_that.title,_that.year,_that.bio,_that.likesCount,_that.logoUrl,_that.coverUrl,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? title,  String? year,  String? bio,  int? likesCount,  String? logoUrl,  String? coverUrl,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _FacilityProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.year,_that.bio,_that.likesCount,_that.logoUrl,_that.coverUrl,_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityProfileEntity implements FacilityProfileEntity {
  const _FacilityProfileEntity({required this.id, required this.name, this.title, this.year, this.bio, this.likesCount, this.logoUrl, this.coverUrl, final  List<String> tags = const <String>[]}): _tags = tags;
  

@override final  int id;
@override final  String name;
@override final  String? title;
@override final  String? year;
@override final  String? bio;
@override final  int? likesCount;
@override final  String? logoUrl;
@override final  String? coverUrl;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityProfileEntityCopyWith<_FacilityProfileEntity> get copyWith => __$FacilityProfileEntityCopyWithImpl<_FacilityProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,title,year,bio,likesCount,logoUrl,coverUrl,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'FacilityProfileEntity(id: $id, name: $name, title: $title, year: $year, bio: $bio, likesCount: $likesCount, logoUrl: $logoUrl, coverUrl: $coverUrl, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$FacilityProfileEntityCopyWith<$Res> implements $FacilityProfileEntityCopyWith<$Res> {
  factory _$FacilityProfileEntityCopyWith(_FacilityProfileEntity value, $Res Function(_FacilityProfileEntity) _then) = __$FacilityProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? title, String? year, String? bio, int? likesCount, String? logoUrl, String? coverUrl, List<String> tags
});




}
/// @nodoc
class __$FacilityProfileEntityCopyWithImpl<$Res>
    implements _$FacilityProfileEntityCopyWith<$Res> {
  __$FacilityProfileEntityCopyWithImpl(this._self, this._then);

  final _FacilityProfileEntity _self;
  final $Res Function(_FacilityProfileEntity) _then;

/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? title = freezed,Object? year = freezed,Object? bio = freezed,Object? likesCount = freezed,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? tags = null,}) {
  return _then(_FacilityProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,likesCount: freezed == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
