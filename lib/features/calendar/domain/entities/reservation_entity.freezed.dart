// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReservationLevelEntity {

 String get name; String get colorHex;
/// Create a copy of ReservationLevelEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationLevelEntityCopyWith<ReservationLevelEntity> get copyWith => _$ReservationLevelEntityCopyWithImpl<ReservationLevelEntity>(this as ReservationLevelEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationLevelEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex));
}


@override
int get hashCode => Object.hash(runtimeType,name,colorHex);

@override
String toString() {
  return 'ReservationLevelEntity(name: $name, colorHex: $colorHex)';
}


}

/// @nodoc
abstract mixin class $ReservationLevelEntityCopyWith<$Res>  {
  factory $ReservationLevelEntityCopyWith(ReservationLevelEntity value, $Res Function(ReservationLevelEntity) _then) = _$ReservationLevelEntityCopyWithImpl;
@useResult
$Res call({
 String name, String colorHex
});




}
/// @nodoc
class _$ReservationLevelEntityCopyWithImpl<$Res>
    implements $ReservationLevelEntityCopyWith<$Res> {
  _$ReservationLevelEntityCopyWithImpl(this._self, this._then);

  final ReservationLevelEntity _self;
  final $Res Function(ReservationLevelEntity) _then;

/// Create a copy of ReservationLevelEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? colorHex = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationLevelEntity].
extension ReservationLevelEntityPatterns on ReservationLevelEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationLevelEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationLevelEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationLevelEntity value)  $default,){
final _that = this;
switch (_that) {
case _ReservationLevelEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationLevelEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationLevelEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String colorHex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationLevelEntity() when $default != null:
return $default(_that.name,_that.colorHex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String colorHex)  $default,) {final _that = this;
switch (_that) {
case _ReservationLevelEntity():
return $default(_that.name,_that.colorHex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String colorHex)?  $default,) {final _that = this;
switch (_that) {
case _ReservationLevelEntity() when $default != null:
return $default(_that.name,_that.colorHex);case _:
  return null;

}
}

}

/// @nodoc


class _ReservationLevelEntity implements ReservationLevelEntity {
  const _ReservationLevelEntity({required this.name, required this.colorHex});
  

@override final  String name;
@override final  String colorHex;

/// Create a copy of ReservationLevelEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationLevelEntityCopyWith<_ReservationLevelEntity> get copyWith => __$ReservationLevelEntityCopyWithImpl<_ReservationLevelEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationLevelEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex));
}


@override
int get hashCode => Object.hash(runtimeType,name,colorHex);

@override
String toString() {
  return 'ReservationLevelEntity(name: $name, colorHex: $colorHex)';
}


}

/// @nodoc
abstract mixin class _$ReservationLevelEntityCopyWith<$Res> implements $ReservationLevelEntityCopyWith<$Res> {
  factory _$ReservationLevelEntityCopyWith(_ReservationLevelEntity value, $Res Function(_ReservationLevelEntity) _then) = __$ReservationLevelEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String colorHex
});




}
/// @nodoc
class __$ReservationLevelEntityCopyWithImpl<$Res>
    implements _$ReservationLevelEntityCopyWith<$Res> {
  __$ReservationLevelEntityCopyWithImpl(this._self, this._then);

  final _ReservationLevelEntity _self;
  final $Res Function(_ReservationLevelEntity) _then;

/// Create a copy of ReservationLevelEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? colorHex = null,}) {
  return _then(_ReservationLevelEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ReservationEntity {

 int get id; int get facilityId; String get facilityName; String get serviceName; DateTime get startsAt; DateTime get endsAt; String get colorHex; String? get facilityLogoUrl; ReservationLevelEntity? get level; List<String> get instructorNames;
/// Create a copy of ReservationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationEntityCopyWith<ReservationEntity> get copyWith => _$ReservationEntityCopyWithImpl<ReservationEntity>(this as ReservationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.facilityName, facilityName) || other.facilityName == facilityName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.facilityLogoUrl, facilityLogoUrl) || other.facilityLogoUrl == facilityLogoUrl)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.instructorNames, instructorNames));
}


@override
int get hashCode => Object.hash(runtimeType,id,facilityId,facilityName,serviceName,startsAt,endsAt,colorHex,facilityLogoUrl,level,const DeepCollectionEquality().hash(instructorNames));

@override
String toString() {
  return 'ReservationEntity(id: $id, facilityId: $facilityId, facilityName: $facilityName, serviceName: $serviceName, startsAt: $startsAt, endsAt: $endsAt, colorHex: $colorHex, facilityLogoUrl: $facilityLogoUrl, level: $level, instructorNames: $instructorNames)';
}


}

/// @nodoc
abstract mixin class $ReservationEntityCopyWith<$Res>  {
  factory $ReservationEntityCopyWith(ReservationEntity value, $Res Function(ReservationEntity) _then) = _$ReservationEntityCopyWithImpl;
@useResult
$Res call({
 int id, int facilityId, String facilityName, String serviceName, DateTime startsAt, DateTime endsAt, String colorHex, String? facilityLogoUrl, ReservationLevelEntity? level, List<String> instructorNames
});


$ReservationLevelEntityCopyWith<$Res>? get level;

}
/// @nodoc
class _$ReservationEntityCopyWithImpl<$Res>
    implements $ReservationEntityCopyWith<$Res> {
  _$ReservationEntityCopyWithImpl(this._self, this._then);

  final ReservationEntity _self;
  final $Res Function(ReservationEntity) _then;

/// Create a copy of ReservationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? facilityId = null,Object? facilityName = null,Object? serviceName = null,Object? startsAt = null,Object? endsAt = null,Object? colorHex = null,Object? facilityLogoUrl = freezed,Object? level = freezed,Object? instructorNames = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,facilityName: null == facilityName ? _self.facilityName : facilityName // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,facilityLogoUrl: freezed == facilityLogoUrl ? _self.facilityLogoUrl : facilityLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as ReservationLevelEntity?,instructorNames: null == instructorNames ? _self.instructorNames : instructorNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of ReservationEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationLevelEntityCopyWith<$Res>? get level {
    if (_self.level == null) {
    return null;
  }

  return $ReservationLevelEntityCopyWith<$Res>(_self.level!, (value) {
    return _then(_self.copyWith(level: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReservationEntity].
extension ReservationEntityPatterns on ReservationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationEntity value)  $default,){
final _that = this;
switch (_that) {
case _ReservationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int facilityId,  String facilityName,  String serviceName,  DateTime startsAt,  DateTime endsAt,  String colorHex,  String? facilityLogoUrl,  ReservationLevelEntity? level,  List<String> instructorNames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationEntity() when $default != null:
return $default(_that.id,_that.facilityId,_that.facilityName,_that.serviceName,_that.startsAt,_that.endsAt,_that.colorHex,_that.facilityLogoUrl,_that.level,_that.instructorNames);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int facilityId,  String facilityName,  String serviceName,  DateTime startsAt,  DateTime endsAt,  String colorHex,  String? facilityLogoUrl,  ReservationLevelEntity? level,  List<String> instructorNames)  $default,) {final _that = this;
switch (_that) {
case _ReservationEntity():
return $default(_that.id,_that.facilityId,_that.facilityName,_that.serviceName,_that.startsAt,_that.endsAt,_that.colorHex,_that.facilityLogoUrl,_that.level,_that.instructorNames);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int facilityId,  String facilityName,  String serviceName,  DateTime startsAt,  DateTime endsAt,  String colorHex,  String? facilityLogoUrl,  ReservationLevelEntity? level,  List<String> instructorNames)?  $default,) {final _that = this;
switch (_that) {
case _ReservationEntity() when $default != null:
return $default(_that.id,_that.facilityId,_that.facilityName,_that.serviceName,_that.startsAt,_that.endsAt,_that.colorHex,_that.facilityLogoUrl,_that.level,_that.instructorNames);case _:
  return null;

}
}

}

/// @nodoc


class _ReservationEntity extends ReservationEntity {
  const _ReservationEntity({required this.id, required this.facilityId, required this.facilityName, required this.serviceName, required this.startsAt, required this.endsAt, required this.colorHex, this.facilityLogoUrl, this.level, final  List<String> instructorNames = const <String>[]}): _instructorNames = instructorNames,super._();
  

@override final  int id;
@override final  int facilityId;
@override final  String facilityName;
@override final  String serviceName;
@override final  DateTime startsAt;
@override final  DateTime endsAt;
@override final  String colorHex;
@override final  String? facilityLogoUrl;
@override final  ReservationLevelEntity? level;
 final  List<String> _instructorNames;
@override@JsonKey() List<String> get instructorNames {
  if (_instructorNames is EqualUnmodifiableListView) return _instructorNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructorNames);
}


/// Create a copy of ReservationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationEntityCopyWith<_ReservationEntity> get copyWith => __$ReservationEntityCopyWithImpl<_ReservationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.facilityName, facilityName) || other.facilityName == facilityName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.facilityLogoUrl, facilityLogoUrl) || other.facilityLogoUrl == facilityLogoUrl)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other._instructorNames, _instructorNames));
}


@override
int get hashCode => Object.hash(runtimeType,id,facilityId,facilityName,serviceName,startsAt,endsAt,colorHex,facilityLogoUrl,level,const DeepCollectionEquality().hash(_instructorNames));

@override
String toString() {
  return 'ReservationEntity(id: $id, facilityId: $facilityId, facilityName: $facilityName, serviceName: $serviceName, startsAt: $startsAt, endsAt: $endsAt, colorHex: $colorHex, facilityLogoUrl: $facilityLogoUrl, level: $level, instructorNames: $instructorNames)';
}


}

/// @nodoc
abstract mixin class _$ReservationEntityCopyWith<$Res> implements $ReservationEntityCopyWith<$Res> {
  factory _$ReservationEntityCopyWith(_ReservationEntity value, $Res Function(_ReservationEntity) _then) = __$ReservationEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int facilityId, String facilityName, String serviceName, DateTime startsAt, DateTime endsAt, String colorHex, String? facilityLogoUrl, ReservationLevelEntity? level, List<String> instructorNames
});


@override $ReservationLevelEntityCopyWith<$Res>? get level;

}
/// @nodoc
class __$ReservationEntityCopyWithImpl<$Res>
    implements _$ReservationEntityCopyWith<$Res> {
  __$ReservationEntityCopyWithImpl(this._self, this._then);

  final _ReservationEntity _self;
  final $Res Function(_ReservationEntity) _then;

/// Create a copy of ReservationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? facilityId = null,Object? facilityName = null,Object? serviceName = null,Object? startsAt = null,Object? endsAt = null,Object? colorHex = null,Object? facilityLogoUrl = freezed,Object? level = freezed,Object? instructorNames = null,}) {
  return _then(_ReservationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,facilityName: null == facilityName ? _self.facilityName : facilityName // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,facilityLogoUrl: freezed == facilityLogoUrl ? _self.facilityLogoUrl : facilityLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as ReservationLevelEntity?,instructorNames: null == instructorNames ? _self._instructorNames : instructorNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of ReservationEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationLevelEntityCopyWith<$Res>? get level {
    if (_self.level == null) {
    return null;
  }

  return $ReservationLevelEntityCopyWith<$Res>(_self.level!, (value) {
    return _then(_self.copyWith(level: value));
  });
}
}

/// @nodoc
mixin _$ReservationCalendarEntity {

 DateTime get windowStart; DateTime get windowEnd;/// Chronologically sorted across the whole window.
 List<ReservationEntity> get reservations;
/// Create a copy of ReservationCalendarEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationCalendarEntityCopyWith<ReservationCalendarEntity> get copyWith => _$ReservationCalendarEntityCopyWithImpl<ReservationCalendarEntity>(this as ReservationCalendarEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationCalendarEntity&&(identical(other.windowStart, windowStart) || other.windowStart == windowStart)&&(identical(other.windowEnd, windowEnd) || other.windowEnd == windowEnd)&&const DeepCollectionEquality().equals(other.reservations, reservations));
}


@override
int get hashCode => Object.hash(runtimeType,windowStart,windowEnd,const DeepCollectionEquality().hash(reservations));

@override
String toString() {
  return 'ReservationCalendarEntity(windowStart: $windowStart, windowEnd: $windowEnd, reservations: $reservations)';
}


}

/// @nodoc
abstract mixin class $ReservationCalendarEntityCopyWith<$Res>  {
  factory $ReservationCalendarEntityCopyWith(ReservationCalendarEntity value, $Res Function(ReservationCalendarEntity) _then) = _$ReservationCalendarEntityCopyWithImpl;
@useResult
$Res call({
 DateTime windowStart, DateTime windowEnd, List<ReservationEntity> reservations
});




}
/// @nodoc
class _$ReservationCalendarEntityCopyWithImpl<$Res>
    implements $ReservationCalendarEntityCopyWith<$Res> {
  _$ReservationCalendarEntityCopyWithImpl(this._self, this._then);

  final ReservationCalendarEntity _self;
  final $Res Function(ReservationCalendarEntity) _then;

/// Create a copy of ReservationCalendarEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? windowStart = null,Object? windowEnd = null,Object? reservations = null,}) {
  return _then(_self.copyWith(
windowStart: null == windowStart ? _self.windowStart : windowStart // ignore: cast_nullable_to_non_nullable
as DateTime,windowEnd: null == windowEnd ? _self.windowEnd : windowEnd // ignore: cast_nullable_to_non_nullable
as DateTime,reservations: null == reservations ? _self.reservations : reservations // ignore: cast_nullable_to_non_nullable
as List<ReservationEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationCalendarEntity].
extension ReservationCalendarEntityPatterns on ReservationCalendarEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationCalendarEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationCalendarEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationCalendarEntity value)  $default,){
final _that = this;
switch (_that) {
case _ReservationCalendarEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationCalendarEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationCalendarEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime windowStart,  DateTime windowEnd,  List<ReservationEntity> reservations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationCalendarEntity() when $default != null:
return $default(_that.windowStart,_that.windowEnd,_that.reservations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime windowStart,  DateTime windowEnd,  List<ReservationEntity> reservations)  $default,) {final _that = this;
switch (_that) {
case _ReservationCalendarEntity():
return $default(_that.windowStart,_that.windowEnd,_that.reservations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime windowStart,  DateTime windowEnd,  List<ReservationEntity> reservations)?  $default,) {final _that = this;
switch (_that) {
case _ReservationCalendarEntity() when $default != null:
return $default(_that.windowStart,_that.windowEnd,_that.reservations);case _:
  return null;

}
}

}

/// @nodoc


class _ReservationCalendarEntity extends ReservationCalendarEntity {
  const _ReservationCalendarEntity({required this.windowStart, required this.windowEnd, required final  List<ReservationEntity> reservations}): _reservations = reservations,super._();
  

@override final  DateTime windowStart;
@override final  DateTime windowEnd;
/// Chronologically sorted across the whole window.
 final  List<ReservationEntity> _reservations;
/// Chronologically sorted across the whole window.
@override List<ReservationEntity> get reservations {
  if (_reservations is EqualUnmodifiableListView) return _reservations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reservations);
}


/// Create a copy of ReservationCalendarEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationCalendarEntityCopyWith<_ReservationCalendarEntity> get copyWith => __$ReservationCalendarEntityCopyWithImpl<_ReservationCalendarEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationCalendarEntity&&(identical(other.windowStart, windowStart) || other.windowStart == windowStart)&&(identical(other.windowEnd, windowEnd) || other.windowEnd == windowEnd)&&const DeepCollectionEquality().equals(other._reservations, _reservations));
}


@override
int get hashCode => Object.hash(runtimeType,windowStart,windowEnd,const DeepCollectionEquality().hash(_reservations));

@override
String toString() {
  return 'ReservationCalendarEntity(windowStart: $windowStart, windowEnd: $windowEnd, reservations: $reservations)';
}


}

/// @nodoc
abstract mixin class _$ReservationCalendarEntityCopyWith<$Res> implements $ReservationCalendarEntityCopyWith<$Res> {
  factory _$ReservationCalendarEntityCopyWith(_ReservationCalendarEntity value, $Res Function(_ReservationCalendarEntity) _then) = __$ReservationCalendarEntityCopyWithImpl;
@override @useResult
$Res call({
 DateTime windowStart, DateTime windowEnd, List<ReservationEntity> reservations
});




}
/// @nodoc
class __$ReservationCalendarEntityCopyWithImpl<$Res>
    implements _$ReservationCalendarEntityCopyWith<$Res> {
  __$ReservationCalendarEntityCopyWithImpl(this._self, this._then);

  final _ReservationCalendarEntity _self;
  final $Res Function(_ReservationCalendarEntity) _then;

/// Create a copy of ReservationCalendarEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? windowStart = null,Object? windowEnd = null,Object? reservations = null,}) {
  return _then(_ReservationCalendarEntity(
windowStart: null == windowStart ? _self.windowStart : windowStart // ignore: cast_nullable_to_non_nullable
as DateTime,windowEnd: null == windowEnd ? _self.windowEnd : windowEnd // ignore: cast_nullable_to_non_nullable
as DateTime,reservations: null == reservations ? _self._reservations : reservations // ignore: cast_nullable_to_non_nullable
as List<ReservationEntity>,
  ));
}


}

// dart format on
