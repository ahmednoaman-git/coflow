// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppNotificationEntity {

 int get id; String get title; String get content;/// The day it was sent (the server sends no time).
 DateTime? get sentOn;/// The facility it is about, or null for a message from Coflow itself.
 NotificationFacilityEntity? get facility;
/// Create a copy of AppNotificationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationEntityCopyWith<AppNotificationEntity> get copyWith => _$AppNotificationEntityCopyWithImpl<AppNotificationEntity>(this as AppNotificationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotificationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.sentOn, sentOn) || other.sentOn == sentOn)&&(identical(other.facility, facility) || other.facility == facility));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,content,sentOn,facility);

@override
String toString() {
  return 'AppNotificationEntity(id: $id, title: $title, content: $content, sentOn: $sentOn, facility: $facility)';
}


}

/// @nodoc
abstract mixin class $AppNotificationEntityCopyWith<$Res>  {
  factory $AppNotificationEntityCopyWith(AppNotificationEntity value, $Res Function(AppNotificationEntity) _then) = _$AppNotificationEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, String content, DateTime? sentOn, NotificationFacilityEntity? facility
});


$NotificationFacilityEntityCopyWith<$Res>? get facility;

}
/// @nodoc
class _$AppNotificationEntityCopyWithImpl<$Res>
    implements $AppNotificationEntityCopyWith<$Res> {
  _$AppNotificationEntityCopyWithImpl(this._self, this._then);

  final AppNotificationEntity _self;
  final $Res Function(AppNotificationEntity) _then;

/// Create a copy of AppNotificationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,Object? sentOn = freezed,Object? facility = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,sentOn: freezed == sentOn ? _self.sentOn : sentOn // ignore: cast_nullable_to_non_nullable
as DateTime?,facility: freezed == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as NotificationFacilityEntity?,
  ));
}
/// Create a copy of AppNotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationFacilityEntityCopyWith<$Res>? get facility {
    if (_self.facility == null) {
    return null;
  }

  return $NotificationFacilityEntityCopyWith<$Res>(_self.facility!, (value) {
    return _then(_self.copyWith(facility: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppNotificationEntity].
extension AppNotificationEntityPatterns on AppNotificationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotificationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotificationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotificationEntity value)  $default,){
final _that = this;
switch (_that) {
case _AppNotificationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotificationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotificationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String content,  DateTime? sentOn,  NotificationFacilityEntity? facility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotificationEntity() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.sentOn,_that.facility);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String content,  DateTime? sentOn,  NotificationFacilityEntity? facility)  $default,) {final _that = this;
switch (_that) {
case _AppNotificationEntity():
return $default(_that.id,_that.title,_that.content,_that.sentOn,_that.facility);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String content,  DateTime? sentOn,  NotificationFacilityEntity? facility)?  $default,) {final _that = this;
switch (_that) {
case _AppNotificationEntity() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.sentOn,_that.facility);case _:
  return null;

}
}

}

/// @nodoc


class _AppNotificationEntity implements AppNotificationEntity {
  const _AppNotificationEntity({required this.id, required this.title, required this.content, this.sentOn, this.facility});
  

@override final  int id;
@override final  String title;
@override final  String content;
/// The day it was sent (the server sends no time).
@override final  DateTime? sentOn;
/// The facility it is about, or null for a message from Coflow itself.
@override final  NotificationFacilityEntity? facility;

/// Create a copy of AppNotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationEntityCopyWith<_AppNotificationEntity> get copyWith => __$AppNotificationEntityCopyWithImpl<_AppNotificationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotificationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.sentOn, sentOn) || other.sentOn == sentOn)&&(identical(other.facility, facility) || other.facility == facility));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,content,sentOn,facility);

@override
String toString() {
  return 'AppNotificationEntity(id: $id, title: $title, content: $content, sentOn: $sentOn, facility: $facility)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationEntityCopyWith<$Res> implements $AppNotificationEntityCopyWith<$Res> {
  factory _$AppNotificationEntityCopyWith(_AppNotificationEntity value, $Res Function(_AppNotificationEntity) _then) = __$AppNotificationEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String content, DateTime? sentOn, NotificationFacilityEntity? facility
});


@override $NotificationFacilityEntityCopyWith<$Res>? get facility;

}
/// @nodoc
class __$AppNotificationEntityCopyWithImpl<$Res>
    implements _$AppNotificationEntityCopyWith<$Res> {
  __$AppNotificationEntityCopyWithImpl(this._self, this._then);

  final _AppNotificationEntity _self;
  final $Res Function(_AppNotificationEntity) _then;

/// Create a copy of AppNotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,Object? sentOn = freezed,Object? facility = freezed,}) {
  return _then(_AppNotificationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,sentOn: freezed == sentOn ? _self.sentOn : sentOn // ignore: cast_nullable_to_non_nullable
as DateTime?,facility: freezed == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as NotificationFacilityEntity?,
  ));
}

/// Create a copy of AppNotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationFacilityEntityCopyWith<$Res>? get facility {
    if (_self.facility == null) {
    return null;
  }

  return $NotificationFacilityEntityCopyWith<$Res>(_self.facility!, (value) {
    return _then(_self.copyWith(facility: value));
  });
}
}

/// @nodoc
mixin _$NotificationFacilityEntity {

 int get id; String get name; String? get logoUrl; int? get activityLineId;/// `GO`, `FLOW` or `PRO`.
 String? get facilityType;
/// Create a copy of NotificationFacilityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationFacilityEntityCopyWith<NotificationFacilityEntity> get copyWith => _$NotificationFacilityEntityCopyWithImpl<NotificationFacilityEntity>(this as NotificationFacilityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationFacilityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.activityLineId, activityLineId) || other.activityLineId == activityLineId)&&(identical(other.facilityType, facilityType) || other.facilityType == facilityType));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,activityLineId,facilityType);

@override
String toString() {
  return 'NotificationFacilityEntity(id: $id, name: $name, logoUrl: $logoUrl, activityLineId: $activityLineId, facilityType: $facilityType)';
}


}

/// @nodoc
abstract mixin class $NotificationFacilityEntityCopyWith<$Res>  {
  factory $NotificationFacilityEntityCopyWith(NotificationFacilityEntity value, $Res Function(NotificationFacilityEntity) _then) = _$NotificationFacilityEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? logoUrl, int? activityLineId, String? facilityType
});




}
/// @nodoc
class _$NotificationFacilityEntityCopyWithImpl<$Res>
    implements $NotificationFacilityEntityCopyWith<$Res> {
  _$NotificationFacilityEntityCopyWithImpl(this._self, this._then);

  final NotificationFacilityEntity _self;
  final $Res Function(NotificationFacilityEntity) _then;

/// Create a copy of NotificationFacilityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? activityLineId = freezed,Object? facilityType = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,activityLineId: freezed == activityLineId ? _self.activityLineId : activityLineId // ignore: cast_nullable_to_non_nullable
as int?,facilityType: freezed == facilityType ? _self.facilityType : facilityType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationFacilityEntity].
extension NotificationFacilityEntityPatterns on NotificationFacilityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationFacilityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationFacilityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationFacilityEntity value)  $default,){
final _that = this;
switch (_that) {
case _NotificationFacilityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationFacilityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationFacilityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? logoUrl,  int? activityLineId,  String? facilityType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationFacilityEntity() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.activityLineId,_that.facilityType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? logoUrl,  int? activityLineId,  String? facilityType)  $default,) {final _that = this;
switch (_that) {
case _NotificationFacilityEntity():
return $default(_that.id,_that.name,_that.logoUrl,_that.activityLineId,_that.facilityType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? logoUrl,  int? activityLineId,  String? facilityType)?  $default,) {final _that = this;
switch (_that) {
case _NotificationFacilityEntity() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.activityLineId,_that.facilityType);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationFacilityEntity implements NotificationFacilityEntity {
  const _NotificationFacilityEntity({required this.id, required this.name, this.logoUrl, this.activityLineId, this.facilityType});
  

@override final  int id;
@override final  String name;
@override final  String? logoUrl;
@override final  int? activityLineId;
/// `GO`, `FLOW` or `PRO`.
@override final  String? facilityType;

/// Create a copy of NotificationFacilityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationFacilityEntityCopyWith<_NotificationFacilityEntity> get copyWith => __$NotificationFacilityEntityCopyWithImpl<_NotificationFacilityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationFacilityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.activityLineId, activityLineId) || other.activityLineId == activityLineId)&&(identical(other.facilityType, facilityType) || other.facilityType == facilityType));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,activityLineId,facilityType);

@override
String toString() {
  return 'NotificationFacilityEntity(id: $id, name: $name, logoUrl: $logoUrl, activityLineId: $activityLineId, facilityType: $facilityType)';
}


}

/// @nodoc
abstract mixin class _$NotificationFacilityEntityCopyWith<$Res> implements $NotificationFacilityEntityCopyWith<$Res> {
  factory _$NotificationFacilityEntityCopyWith(_NotificationFacilityEntity value, $Res Function(_NotificationFacilityEntity) _then) = __$NotificationFacilityEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? logoUrl, int? activityLineId, String? facilityType
});




}
/// @nodoc
class __$NotificationFacilityEntityCopyWithImpl<$Res>
    implements _$NotificationFacilityEntityCopyWith<$Res> {
  __$NotificationFacilityEntityCopyWithImpl(this._self, this._then);

  final _NotificationFacilityEntity _self;
  final $Res Function(_NotificationFacilityEntity) _then;

/// Create a copy of NotificationFacilityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? activityLineId = freezed,Object? facilityType = freezed,}) {
  return _then(_NotificationFacilityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,activityLineId: freezed == activityLineId ? _self.activityLineId : activityLineId // ignore: cast_nullable_to_non_nullable
as int?,facilityType: freezed == facilityType ? _self.facilityType : facilityType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
