// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_service_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CollapsedFacilityServiceEntity {

 int get id; String get name; String? get imageUrl; int get reservations; String? get durationLabel; FacilityServiceLevel? get level;
/// Create a copy of CollapsedFacilityServiceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollapsedFacilityServiceEntityCopyWith<CollapsedFacilityServiceEntity> get copyWith => _$CollapsedFacilityServiceEntityCopyWithImpl<CollapsedFacilityServiceEntity>(this as CollapsedFacilityServiceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollapsedFacilityServiceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.reservations, reservations) || other.reservations == reservations)&&(identical(other.durationLabel, durationLabel) || other.durationLabel == durationLabel)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,reservations,durationLabel,level);

@override
String toString() {
  return 'CollapsedFacilityServiceEntity(id: $id, name: $name, imageUrl: $imageUrl, reservations: $reservations, durationLabel: $durationLabel, level: $level)';
}


}

/// @nodoc
abstract mixin class $CollapsedFacilityServiceEntityCopyWith<$Res>  {
  factory $CollapsedFacilityServiceEntityCopyWith(CollapsedFacilityServiceEntity value, $Res Function(CollapsedFacilityServiceEntity) _then) = _$CollapsedFacilityServiceEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? imageUrl, int reservations, String? durationLabel, FacilityServiceLevel? level
});


$FacilityServiceLevelCopyWith<$Res>? get level;

}
/// @nodoc
class _$CollapsedFacilityServiceEntityCopyWithImpl<$Res>
    implements $CollapsedFacilityServiceEntityCopyWith<$Res> {
  _$CollapsedFacilityServiceEntityCopyWithImpl(this._self, this._then);

  final CollapsedFacilityServiceEntity _self;
  final $Res Function(CollapsedFacilityServiceEntity) _then;

/// Create a copy of CollapsedFacilityServiceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? reservations = null,Object? durationLabel = freezed,Object? level = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,reservations: null == reservations ? _self.reservations : reservations // ignore: cast_nullable_to_non_nullable
as int,durationLabel: freezed == durationLabel ? _self.durationLabel : durationLabel // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as FacilityServiceLevel?,
  ));
}
/// Create a copy of CollapsedFacilityServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilityServiceLevelCopyWith<$Res>? get level {
    if (_self.level == null) {
    return null;
  }

  return $FacilityServiceLevelCopyWith<$Res>(_self.level!, (value) {
    return _then(_self.copyWith(level: value));
  });
}
}


/// Adds pattern-matching-related methods to [CollapsedFacilityServiceEntity].
extension CollapsedFacilityServiceEntityPatterns on CollapsedFacilityServiceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollapsedFacilityServiceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollapsedFacilityServiceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollapsedFacilityServiceEntity value)  $default,){
final _that = this;
switch (_that) {
case _CollapsedFacilityServiceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollapsedFacilityServiceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CollapsedFacilityServiceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? imageUrl,  int reservations,  String? durationLabel,  FacilityServiceLevel? level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollapsedFacilityServiceEntity() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.reservations,_that.durationLabel,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? imageUrl,  int reservations,  String? durationLabel,  FacilityServiceLevel? level)  $default,) {final _that = this;
switch (_that) {
case _CollapsedFacilityServiceEntity():
return $default(_that.id,_that.name,_that.imageUrl,_that.reservations,_that.durationLabel,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? imageUrl,  int reservations,  String? durationLabel,  FacilityServiceLevel? level)?  $default,) {final _that = this;
switch (_that) {
case _CollapsedFacilityServiceEntity() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.reservations,_that.durationLabel,_that.level);case _:
  return null;

}
}

}

/// @nodoc


class _CollapsedFacilityServiceEntity implements CollapsedFacilityServiceEntity {
  const _CollapsedFacilityServiceEntity({required this.id, required this.name, this.imageUrl, required this.reservations, this.durationLabel, this.level});
  

@override final  int id;
@override final  String name;
@override final  String? imageUrl;
@override final  int reservations;
@override final  String? durationLabel;
@override final  FacilityServiceLevel? level;

/// Create a copy of CollapsedFacilityServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollapsedFacilityServiceEntityCopyWith<_CollapsedFacilityServiceEntity> get copyWith => __$CollapsedFacilityServiceEntityCopyWithImpl<_CollapsedFacilityServiceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollapsedFacilityServiceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.reservations, reservations) || other.reservations == reservations)&&(identical(other.durationLabel, durationLabel) || other.durationLabel == durationLabel)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,reservations,durationLabel,level);

@override
String toString() {
  return 'CollapsedFacilityServiceEntity(id: $id, name: $name, imageUrl: $imageUrl, reservations: $reservations, durationLabel: $durationLabel, level: $level)';
}


}

/// @nodoc
abstract mixin class _$CollapsedFacilityServiceEntityCopyWith<$Res> implements $CollapsedFacilityServiceEntityCopyWith<$Res> {
  factory _$CollapsedFacilityServiceEntityCopyWith(_CollapsedFacilityServiceEntity value, $Res Function(_CollapsedFacilityServiceEntity) _then) = __$CollapsedFacilityServiceEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? imageUrl, int reservations, String? durationLabel, FacilityServiceLevel? level
});


@override $FacilityServiceLevelCopyWith<$Res>? get level;

}
/// @nodoc
class __$CollapsedFacilityServiceEntityCopyWithImpl<$Res>
    implements _$CollapsedFacilityServiceEntityCopyWith<$Res> {
  __$CollapsedFacilityServiceEntityCopyWithImpl(this._self, this._then);

  final _CollapsedFacilityServiceEntity _self;
  final $Res Function(_CollapsedFacilityServiceEntity) _then;

/// Create a copy of CollapsedFacilityServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? reservations = null,Object? durationLabel = freezed,Object? level = freezed,}) {
  return _then(_CollapsedFacilityServiceEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,reservations: null == reservations ? _self.reservations : reservations // ignore: cast_nullable_to_non_nullable
as int,durationLabel: freezed == durationLabel ? _self.durationLabel : durationLabel // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as FacilityServiceLevel?,
  ));
}

/// Create a copy of CollapsedFacilityServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilityServiceLevelCopyWith<$Res>? get level {
    if (_self.level == null) {
    return null;
  }

  return $FacilityServiceLevelCopyWith<$Res>(_self.level!, (value) {
    return _then(_self.copyWith(level: value));
  });
}
}

/// @nodoc
mixin _$FacilityServiceFolderEntity {

 int get id; String get name; List<CollapsedFacilityServiceEntity> get services;
/// Create a copy of FacilityServiceFolderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityServiceFolderEntityCopyWith<FacilityServiceFolderEntity> get copyWith => _$FacilityServiceFolderEntityCopyWithImpl<FacilityServiceFolderEntity>(this as FacilityServiceFolderEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityServiceFolderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.services, services));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(services));

@override
String toString() {
  return 'FacilityServiceFolderEntity(id: $id, name: $name, services: $services)';
}


}

/// @nodoc
abstract mixin class $FacilityServiceFolderEntityCopyWith<$Res>  {
  factory $FacilityServiceFolderEntityCopyWith(FacilityServiceFolderEntity value, $Res Function(FacilityServiceFolderEntity) _then) = _$FacilityServiceFolderEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<CollapsedFacilityServiceEntity> services
});




}
/// @nodoc
class _$FacilityServiceFolderEntityCopyWithImpl<$Res>
    implements $FacilityServiceFolderEntityCopyWith<$Res> {
  _$FacilityServiceFolderEntityCopyWithImpl(this._self, this._then);

  final FacilityServiceFolderEntity _self;
  final $Res Function(FacilityServiceFolderEntity) _then;

/// Create a copy of FacilityServiceFolderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? services = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<CollapsedFacilityServiceEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityServiceFolderEntity].
extension FacilityServiceFolderEntityPatterns on FacilityServiceFolderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityServiceFolderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityServiceFolderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityServiceFolderEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityServiceFolderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityServiceFolderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityServiceFolderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  List<CollapsedFacilityServiceEntity> services)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityServiceFolderEntity() when $default != null:
return $default(_that.id,_that.name,_that.services);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  List<CollapsedFacilityServiceEntity> services)  $default,) {final _that = this;
switch (_that) {
case _FacilityServiceFolderEntity():
return $default(_that.id,_that.name,_that.services);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  List<CollapsedFacilityServiceEntity> services)?  $default,) {final _that = this;
switch (_that) {
case _FacilityServiceFolderEntity() when $default != null:
return $default(_that.id,_that.name,_that.services);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityServiceFolderEntity implements FacilityServiceFolderEntity {
  const _FacilityServiceFolderEntity({required this.id, required this.name, required final  List<CollapsedFacilityServiceEntity> services}): _services = services;
  

@override final  int id;
@override final  String name;
 final  List<CollapsedFacilityServiceEntity> _services;
@override List<CollapsedFacilityServiceEntity> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}


/// Create a copy of FacilityServiceFolderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityServiceFolderEntityCopyWith<_FacilityServiceFolderEntity> get copyWith => __$FacilityServiceFolderEntityCopyWithImpl<_FacilityServiceFolderEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityServiceFolderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._services, _services));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_services));

@override
String toString() {
  return 'FacilityServiceFolderEntity(id: $id, name: $name, services: $services)';
}


}

/// @nodoc
abstract mixin class _$FacilityServiceFolderEntityCopyWith<$Res> implements $FacilityServiceFolderEntityCopyWith<$Res> {
  factory _$FacilityServiceFolderEntityCopyWith(_FacilityServiceFolderEntity value, $Res Function(_FacilityServiceFolderEntity) _then) = __$FacilityServiceFolderEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<CollapsedFacilityServiceEntity> services
});




}
/// @nodoc
class __$FacilityServiceFolderEntityCopyWithImpl<$Res>
    implements _$FacilityServiceFolderEntityCopyWith<$Res> {
  __$FacilityServiceFolderEntityCopyWithImpl(this._self, this._then);

  final _FacilityServiceFolderEntity _self;
  final $Res Function(_FacilityServiceFolderEntity) _then;

/// Create a copy of FacilityServiceFolderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? services = null,}) {
  return _then(_FacilityServiceFolderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<CollapsedFacilityServiceEntity>,
  ));
}


}

/// @nodoc
mixin _$FacilityServicesEntity {

 List<FacilityServiceFolderEntity> get folders; List<CollapsedFacilityServiceEntity> get rootServices;
/// Create a copy of FacilityServicesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityServicesEntityCopyWith<FacilityServicesEntity> get copyWith => _$FacilityServicesEntityCopyWithImpl<FacilityServicesEntity>(this as FacilityServicesEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityServicesEntity&&const DeepCollectionEquality().equals(other.folders, folders)&&const DeepCollectionEquality().equals(other.rootServices, rootServices));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(folders),const DeepCollectionEquality().hash(rootServices));

@override
String toString() {
  return 'FacilityServicesEntity(folders: $folders, rootServices: $rootServices)';
}


}

/// @nodoc
abstract mixin class $FacilityServicesEntityCopyWith<$Res>  {
  factory $FacilityServicesEntityCopyWith(FacilityServicesEntity value, $Res Function(FacilityServicesEntity) _then) = _$FacilityServicesEntityCopyWithImpl;
@useResult
$Res call({
 List<FacilityServiceFolderEntity> folders, List<CollapsedFacilityServiceEntity> rootServices
});




}
/// @nodoc
class _$FacilityServicesEntityCopyWithImpl<$Res>
    implements $FacilityServicesEntityCopyWith<$Res> {
  _$FacilityServicesEntityCopyWithImpl(this._self, this._then);

  final FacilityServicesEntity _self;
  final $Res Function(FacilityServicesEntity) _then;

/// Create a copy of FacilityServicesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? folders = null,Object? rootServices = null,}) {
  return _then(_self.copyWith(
folders: null == folders ? _self.folders : folders // ignore: cast_nullable_to_non_nullable
as List<FacilityServiceFolderEntity>,rootServices: null == rootServices ? _self.rootServices : rootServices // ignore: cast_nullable_to_non_nullable
as List<CollapsedFacilityServiceEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityServicesEntity].
extension FacilityServicesEntityPatterns on FacilityServicesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityServicesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityServicesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityServicesEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityServicesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityServicesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityServicesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FacilityServiceFolderEntity> folders,  List<CollapsedFacilityServiceEntity> rootServices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityServicesEntity() when $default != null:
return $default(_that.folders,_that.rootServices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FacilityServiceFolderEntity> folders,  List<CollapsedFacilityServiceEntity> rootServices)  $default,) {final _that = this;
switch (_that) {
case _FacilityServicesEntity():
return $default(_that.folders,_that.rootServices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FacilityServiceFolderEntity> folders,  List<CollapsedFacilityServiceEntity> rootServices)?  $default,) {final _that = this;
switch (_that) {
case _FacilityServicesEntity() when $default != null:
return $default(_that.folders,_that.rootServices);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityServicesEntity extends FacilityServicesEntity {
  const _FacilityServicesEntity({required final  List<FacilityServiceFolderEntity> folders, required final  List<CollapsedFacilityServiceEntity> rootServices}): _folders = folders,_rootServices = rootServices,super._();
  

 final  List<FacilityServiceFolderEntity> _folders;
@override List<FacilityServiceFolderEntity> get folders {
  if (_folders is EqualUnmodifiableListView) return _folders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_folders);
}

 final  List<CollapsedFacilityServiceEntity> _rootServices;
@override List<CollapsedFacilityServiceEntity> get rootServices {
  if (_rootServices is EqualUnmodifiableListView) return _rootServices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rootServices);
}


/// Create a copy of FacilityServicesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityServicesEntityCopyWith<_FacilityServicesEntity> get copyWith => __$FacilityServicesEntityCopyWithImpl<_FacilityServicesEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityServicesEntity&&const DeepCollectionEquality().equals(other._folders, _folders)&&const DeepCollectionEquality().equals(other._rootServices, _rootServices));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_folders),const DeepCollectionEquality().hash(_rootServices));

@override
String toString() {
  return 'FacilityServicesEntity(folders: $folders, rootServices: $rootServices)';
}


}

/// @nodoc
abstract mixin class _$FacilityServicesEntityCopyWith<$Res> implements $FacilityServicesEntityCopyWith<$Res> {
  factory _$FacilityServicesEntityCopyWith(_FacilityServicesEntity value, $Res Function(_FacilityServicesEntity) _then) = __$FacilityServicesEntityCopyWithImpl;
@override @useResult
$Res call({
 List<FacilityServiceFolderEntity> folders, List<CollapsedFacilityServiceEntity> rootServices
});




}
/// @nodoc
class __$FacilityServicesEntityCopyWithImpl<$Res>
    implements _$FacilityServicesEntityCopyWith<$Res> {
  __$FacilityServicesEntityCopyWithImpl(this._self, this._then);

  final _FacilityServicesEntity _self;
  final $Res Function(_FacilityServicesEntity) _then;

/// Create a copy of FacilityServicesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? folders = null,Object? rootServices = null,}) {
  return _then(_FacilityServicesEntity(
folders: null == folders ? _self._folders : folders // ignore: cast_nullable_to_non_nullable
as List<FacilityServiceFolderEntity>,rootServices: null == rootServices ? _self._rootServices : rootServices // ignore: cast_nullable_to_non_nullable
as List<CollapsedFacilityServiceEntity>,
  ));
}


}

// dart format on
