// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEntity {

 int get id; String get name; String? get logo; String? get cover; String get title; ActivityLineEntity get activityLine; CityEntity? get city; AreaEntity? get area;
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<ProfileEntity> get copyWith => _$ProfileEntityCopyWithImpl<ProfileEntity>(this as ProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.activityLine, activityLine) || other.activityLine == activityLine)&&(identical(other.city, city) || other.city == city)&&(identical(other.area, area) || other.area == area));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logo,cover,title,activityLine,city,area);

@override
String toString() {
  return 'ProfileEntity(id: $id, name: $name, logo: $logo, cover: $cover, title: $title, activityLine: $activityLine, city: $city, area: $area)';
}


}

/// @nodoc
abstract mixin class $ProfileEntityCopyWith<$Res>  {
  factory $ProfileEntityCopyWith(ProfileEntity value, $Res Function(ProfileEntity) _then) = _$ProfileEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? logo, String? cover, String title, ActivityLineEntity activityLine, CityEntity? city, AreaEntity? area
});


$ActivityLineEntityCopyWith<$Res> get activityLine;$CityEntityCopyWith<$Res>? get city;$AreaEntityCopyWith<$Res>? get area;

}
/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._self, this._then);

  final ProfileEntity _self;
  final $Res Function(ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logo = freezed,Object? cover = freezed,Object? title = null,Object? activityLine = null,Object? city = freezed,Object? area = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,activityLine: null == activityLine ? _self.activityLine : activityLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityEntity?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as AreaEntity?,
  ));
}
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLineEntityCopyWith<$Res> get activityLine {
  
  return $ActivityLineEntityCopyWith<$Res>(_self.activityLine, (value) {
    return _then(_self.copyWith(activityLine: value));
  });
}/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityEntityCopyWith<$Res>? get city {
    if (_self.city == null) {
    return null;
  }

  return $CityEntityCopyWith<$Res>(_self.city!, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AreaEntityCopyWith<$Res>? get area {
    if (_self.area == null) {
    return null;
  }

  return $AreaEntityCopyWith<$Res>(_self.area!, (value) {
    return _then(_self.copyWith(area: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileEntity].
extension ProfileEntityPatterns on ProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? logo,  String? cover,  String title,  ActivityLineEntity activityLine,  CityEntity? city,  AreaEntity? area)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.logo,_that.cover,_that.title,_that.activityLine,_that.city,_that.area);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? logo,  String? cover,  String title,  ActivityLineEntity activityLine,  CityEntity? city,  AreaEntity? area)  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity():
return $default(_that.id,_that.name,_that.logo,_that.cover,_that.title,_that.activityLine,_that.city,_that.area);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? logo,  String? cover,  String title,  ActivityLineEntity activityLine,  CityEntity? city,  AreaEntity? area)?  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.logo,_that.cover,_that.title,_that.activityLine,_that.city,_that.area);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileEntity implements ProfileEntity {
  const _ProfileEntity({required this.id, required this.name, required this.logo, required this.cover, required this.title, required this.activityLine, required this.city, required this.area});
  

@override final  int id;
@override final  String name;
@override final  String? logo;
@override final  String? cover;
@override final  String title;
@override final  ActivityLineEntity activityLine;
@override final  CityEntity? city;
@override final  AreaEntity? area;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileEntityCopyWith<_ProfileEntity> get copyWith => __$ProfileEntityCopyWithImpl<_ProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.title, title) || other.title == title)&&(identical(other.activityLine, activityLine) || other.activityLine == activityLine)&&(identical(other.city, city) || other.city == city)&&(identical(other.area, area) || other.area == area));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logo,cover,title,activityLine,city,area);

@override
String toString() {
  return 'ProfileEntity(id: $id, name: $name, logo: $logo, cover: $cover, title: $title, activityLine: $activityLine, city: $city, area: $area)';
}


}

/// @nodoc
abstract mixin class _$ProfileEntityCopyWith<$Res> implements $ProfileEntityCopyWith<$Res> {
  factory _$ProfileEntityCopyWith(_ProfileEntity value, $Res Function(_ProfileEntity) _then) = __$ProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? logo, String? cover, String title, ActivityLineEntity activityLine, CityEntity? city, AreaEntity? area
});


@override $ActivityLineEntityCopyWith<$Res> get activityLine;@override $CityEntityCopyWith<$Res>? get city;@override $AreaEntityCopyWith<$Res>? get area;

}
/// @nodoc
class __$ProfileEntityCopyWithImpl<$Res>
    implements _$ProfileEntityCopyWith<$Res> {
  __$ProfileEntityCopyWithImpl(this._self, this._then);

  final _ProfileEntity _self;
  final $Res Function(_ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logo = freezed,Object? cover = freezed,Object? title = null,Object? activityLine = null,Object? city = freezed,Object? area = freezed,}) {
  return _then(_ProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,activityLine: null == activityLine ? _self.activityLine : activityLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityEntity?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as AreaEntity?,
  ));
}

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLineEntityCopyWith<$Res> get activityLine {
  
  return $ActivityLineEntityCopyWith<$Res>(_self.activityLine, (value) {
    return _then(_self.copyWith(activityLine: value));
  });
}/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityEntityCopyWith<$Res>? get city {
    if (_self.city == null) {
    return null;
  }

  return $CityEntityCopyWith<$Res>(_self.city!, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AreaEntityCopyWith<$Res>? get area {
    if (_self.area == null) {
    return null;
  }

  return $AreaEntityCopyWith<$Res>(_self.area!, (value) {
    return _then(_self.copyWith(area: value));
  });
}
}

// dart format on
