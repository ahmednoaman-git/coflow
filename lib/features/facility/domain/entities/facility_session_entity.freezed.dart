// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_session_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilitySessionCapacityEntity {

 int get booked; int get total;/// People queued for a spot. Only meaningful once the session is full.
 int get waitlistCount;
/// Create a copy of FacilitySessionCapacityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilitySessionCapacityEntityCopyWith<FacilitySessionCapacityEntity> get copyWith => _$FacilitySessionCapacityEntityCopyWithImpl<FacilitySessionCapacityEntity>(this as FacilitySessionCapacityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilitySessionCapacityEntity&&(identical(other.booked, booked) || other.booked == booked)&&(identical(other.total, total) || other.total == total)&&(identical(other.waitlistCount, waitlistCount) || other.waitlistCount == waitlistCount));
}


@override
int get hashCode => Object.hash(runtimeType,booked,total,waitlistCount);

@override
String toString() {
  return 'FacilitySessionCapacityEntity(booked: $booked, total: $total, waitlistCount: $waitlistCount)';
}


}

/// @nodoc
abstract mixin class $FacilitySessionCapacityEntityCopyWith<$Res>  {
  factory $FacilitySessionCapacityEntityCopyWith(FacilitySessionCapacityEntity value, $Res Function(FacilitySessionCapacityEntity) _then) = _$FacilitySessionCapacityEntityCopyWithImpl;
@useResult
$Res call({
 int booked, int total, int waitlistCount
});




}
/// @nodoc
class _$FacilitySessionCapacityEntityCopyWithImpl<$Res>
    implements $FacilitySessionCapacityEntityCopyWith<$Res> {
  _$FacilitySessionCapacityEntityCopyWithImpl(this._self, this._then);

  final FacilitySessionCapacityEntity _self;
  final $Res Function(FacilitySessionCapacityEntity) _then;

/// Create a copy of FacilitySessionCapacityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? booked = null,Object? total = null,Object? waitlistCount = null,}) {
  return _then(_self.copyWith(
booked: null == booked ? _self.booked : booked // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,waitlistCount: null == waitlistCount ? _self.waitlistCount : waitlistCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilitySessionCapacityEntity].
extension FacilitySessionCapacityEntityPatterns on FacilitySessionCapacityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilitySessionCapacityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilitySessionCapacityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilitySessionCapacityEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilitySessionCapacityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilitySessionCapacityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilitySessionCapacityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int booked,  int total,  int waitlistCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilitySessionCapacityEntity() when $default != null:
return $default(_that.booked,_that.total,_that.waitlistCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int booked,  int total,  int waitlistCount)  $default,) {final _that = this;
switch (_that) {
case _FacilitySessionCapacityEntity():
return $default(_that.booked,_that.total,_that.waitlistCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int booked,  int total,  int waitlistCount)?  $default,) {final _that = this;
switch (_that) {
case _FacilitySessionCapacityEntity() when $default != null:
return $default(_that.booked,_that.total,_that.waitlistCount);case _:
  return null;

}
}

}

/// @nodoc


class _FacilitySessionCapacityEntity extends FacilitySessionCapacityEntity {
  const _FacilitySessionCapacityEntity({required this.booked, required this.total, this.waitlistCount = 0}): super._();
  

@override final  int booked;
@override final  int total;
/// People queued for a spot. Only meaningful once the session is full.
@override@JsonKey() final  int waitlistCount;

/// Create a copy of FacilitySessionCapacityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilitySessionCapacityEntityCopyWith<_FacilitySessionCapacityEntity> get copyWith => __$FacilitySessionCapacityEntityCopyWithImpl<_FacilitySessionCapacityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilitySessionCapacityEntity&&(identical(other.booked, booked) || other.booked == booked)&&(identical(other.total, total) || other.total == total)&&(identical(other.waitlistCount, waitlistCount) || other.waitlistCount == waitlistCount));
}


@override
int get hashCode => Object.hash(runtimeType,booked,total,waitlistCount);

@override
String toString() {
  return 'FacilitySessionCapacityEntity(booked: $booked, total: $total, waitlistCount: $waitlistCount)';
}


}

/// @nodoc
abstract mixin class _$FacilitySessionCapacityEntityCopyWith<$Res> implements $FacilitySessionCapacityEntityCopyWith<$Res> {
  factory _$FacilitySessionCapacityEntityCopyWith(_FacilitySessionCapacityEntity value, $Res Function(_FacilitySessionCapacityEntity) _then) = __$FacilitySessionCapacityEntityCopyWithImpl;
@override @useResult
$Res call({
 int booked, int total, int waitlistCount
});




}
/// @nodoc
class __$FacilitySessionCapacityEntityCopyWithImpl<$Res>
    implements _$FacilitySessionCapacityEntityCopyWith<$Res> {
  __$FacilitySessionCapacityEntityCopyWithImpl(this._self, this._then);

  final _FacilitySessionCapacityEntity _self;
  final $Res Function(_FacilitySessionCapacityEntity) _then;

/// Create a copy of FacilitySessionCapacityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? booked = null,Object? total = null,Object? waitlistCount = null,}) {
  return _then(_FacilitySessionCapacityEntity(
booked: null == booked ? _self.booked : booked // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,waitlistCount: null == waitlistCount ? _self.waitlistCount : waitlistCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FacilitySessionEntity {

 int get id; int get serviceId; String get name; DateTime get startsAt; DateTime get endsAt; String get colorHex; int get facilityId; bool get isRecurring; FacilityServiceLevel? get level; bool get isLadiesOnly; List<String> get instructorNames; FacilitySessionCapacityEntity? get capacity;
/// Create a copy of FacilitySessionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilitySessionEntityCopyWith<FacilitySessionEntity> get copyWith => _$FacilitySessionEntityCopyWithImpl<FacilitySessionEntity>(this as FacilitySessionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilitySessionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.level, level) || other.level == level)&&(identical(other.isLadiesOnly, isLadiesOnly) || other.isLadiesOnly == isLadiesOnly)&&const DeepCollectionEquality().equals(other.instructorNames, instructorNames)&&(identical(other.capacity, capacity) || other.capacity == capacity));
}


@override
int get hashCode => Object.hash(runtimeType,id,serviceId,name,startsAt,endsAt,colorHex,facilityId,isRecurring,level,isLadiesOnly,const DeepCollectionEquality().hash(instructorNames),capacity);

@override
String toString() {
  return 'FacilitySessionEntity(id: $id, serviceId: $serviceId, name: $name, startsAt: $startsAt, endsAt: $endsAt, colorHex: $colorHex, facilityId: $facilityId, isRecurring: $isRecurring, level: $level, isLadiesOnly: $isLadiesOnly, instructorNames: $instructorNames, capacity: $capacity)';
}


}

/// @nodoc
abstract mixin class $FacilitySessionEntityCopyWith<$Res>  {
  factory $FacilitySessionEntityCopyWith(FacilitySessionEntity value, $Res Function(FacilitySessionEntity) _then) = _$FacilitySessionEntityCopyWithImpl;
@useResult
$Res call({
 int id, int serviceId, String name, DateTime startsAt, DateTime endsAt, String colorHex, int facilityId, bool isRecurring, FacilityServiceLevel? level, bool isLadiesOnly, List<String> instructorNames, FacilitySessionCapacityEntity? capacity
});


$FacilityServiceLevelCopyWith<$Res>? get level;$FacilitySessionCapacityEntityCopyWith<$Res>? get capacity;

}
/// @nodoc
class _$FacilitySessionEntityCopyWithImpl<$Res>
    implements $FacilitySessionEntityCopyWith<$Res> {
  _$FacilitySessionEntityCopyWithImpl(this._self, this._then);

  final FacilitySessionEntity _self;
  final $Res Function(FacilitySessionEntity) _then;

/// Create a copy of FacilitySessionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceId = null,Object? name = null,Object? startsAt = null,Object? endsAt = null,Object? colorHex = null,Object? facilityId = null,Object? isRecurring = null,Object? level = freezed,Object? isLadiesOnly = null,Object? instructorNames = null,Object? capacity = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as FacilityServiceLevel?,isLadiesOnly: null == isLadiesOnly ? _self.isLadiesOnly : isLadiesOnly // ignore: cast_nullable_to_non_nullable
as bool,instructorNames: null == instructorNames ? _self.instructorNames : instructorNames // ignore: cast_nullable_to_non_nullable
as List<String>,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as FacilitySessionCapacityEntity?,
  ));
}
/// Create a copy of FacilitySessionEntity
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
}/// Create a copy of FacilitySessionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilitySessionCapacityEntityCopyWith<$Res>? get capacity {
    if (_self.capacity == null) {
    return null;
  }

  return $FacilitySessionCapacityEntityCopyWith<$Res>(_self.capacity!, (value) {
    return _then(_self.copyWith(capacity: value));
  });
}
}


/// Adds pattern-matching-related methods to [FacilitySessionEntity].
extension FacilitySessionEntityPatterns on FacilitySessionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilitySessionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilitySessionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilitySessionEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilitySessionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilitySessionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilitySessionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int serviceId,  String name,  DateTime startsAt,  DateTime endsAt,  String colorHex,  int facilityId,  bool isRecurring,  FacilityServiceLevel? level,  bool isLadiesOnly,  List<String> instructorNames,  FacilitySessionCapacityEntity? capacity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilitySessionEntity() when $default != null:
return $default(_that.id,_that.serviceId,_that.name,_that.startsAt,_that.endsAt,_that.colorHex,_that.facilityId,_that.isRecurring,_that.level,_that.isLadiesOnly,_that.instructorNames,_that.capacity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int serviceId,  String name,  DateTime startsAt,  DateTime endsAt,  String colorHex,  int facilityId,  bool isRecurring,  FacilityServiceLevel? level,  bool isLadiesOnly,  List<String> instructorNames,  FacilitySessionCapacityEntity? capacity)  $default,) {final _that = this;
switch (_that) {
case _FacilitySessionEntity():
return $default(_that.id,_that.serviceId,_that.name,_that.startsAt,_that.endsAt,_that.colorHex,_that.facilityId,_that.isRecurring,_that.level,_that.isLadiesOnly,_that.instructorNames,_that.capacity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int serviceId,  String name,  DateTime startsAt,  DateTime endsAt,  String colorHex,  int facilityId,  bool isRecurring,  FacilityServiceLevel? level,  bool isLadiesOnly,  List<String> instructorNames,  FacilitySessionCapacityEntity? capacity)?  $default,) {final _that = this;
switch (_that) {
case _FacilitySessionEntity() when $default != null:
return $default(_that.id,_that.serviceId,_that.name,_that.startsAt,_that.endsAt,_that.colorHex,_that.facilityId,_that.isRecurring,_that.level,_that.isLadiesOnly,_that.instructorNames,_that.capacity);case _:
  return null;

}
}

}

/// @nodoc


class _FacilitySessionEntity extends FacilitySessionEntity {
  const _FacilitySessionEntity({required this.id, required this.serviceId, required this.name, required this.startsAt, required this.endsAt, required this.colorHex, this.facilityId = 0, this.isRecurring = false, this.level, this.isLadiesOnly = false, final  List<String> instructorNames = const <String>[], this.capacity}): _instructorNames = instructorNames,super._();
  

@override final  int id;
@override final  int serviceId;
@override final  String name;
@override final  DateTime startsAt;
@override final  DateTime endsAt;
@override final  String colorHex;
@override@JsonKey() final  int facilityId;
@override@JsonKey() final  bool isRecurring;
@override final  FacilityServiceLevel? level;
@override@JsonKey() final  bool isLadiesOnly;
 final  List<String> _instructorNames;
@override@JsonKey() List<String> get instructorNames {
  if (_instructorNames is EqualUnmodifiableListView) return _instructorNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructorNames);
}

@override final  FacilitySessionCapacityEntity? capacity;

/// Create a copy of FacilitySessionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilitySessionEntityCopyWith<_FacilitySessionEntity> get copyWith => __$FacilitySessionEntityCopyWithImpl<_FacilitySessionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilitySessionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.level, level) || other.level == level)&&(identical(other.isLadiesOnly, isLadiesOnly) || other.isLadiesOnly == isLadiesOnly)&&const DeepCollectionEquality().equals(other._instructorNames, _instructorNames)&&(identical(other.capacity, capacity) || other.capacity == capacity));
}


@override
int get hashCode => Object.hash(runtimeType,id,serviceId,name,startsAt,endsAt,colorHex,facilityId,isRecurring,level,isLadiesOnly,const DeepCollectionEquality().hash(_instructorNames),capacity);

@override
String toString() {
  return 'FacilitySessionEntity(id: $id, serviceId: $serviceId, name: $name, startsAt: $startsAt, endsAt: $endsAt, colorHex: $colorHex, facilityId: $facilityId, isRecurring: $isRecurring, level: $level, isLadiesOnly: $isLadiesOnly, instructorNames: $instructorNames, capacity: $capacity)';
}


}

/// @nodoc
abstract mixin class _$FacilitySessionEntityCopyWith<$Res> implements $FacilitySessionEntityCopyWith<$Res> {
  factory _$FacilitySessionEntityCopyWith(_FacilitySessionEntity value, $Res Function(_FacilitySessionEntity) _then) = __$FacilitySessionEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int serviceId, String name, DateTime startsAt, DateTime endsAt, String colorHex, int facilityId, bool isRecurring, FacilityServiceLevel? level, bool isLadiesOnly, List<String> instructorNames, FacilitySessionCapacityEntity? capacity
});


@override $FacilityServiceLevelCopyWith<$Res>? get level;@override $FacilitySessionCapacityEntityCopyWith<$Res>? get capacity;

}
/// @nodoc
class __$FacilitySessionEntityCopyWithImpl<$Res>
    implements _$FacilitySessionEntityCopyWith<$Res> {
  __$FacilitySessionEntityCopyWithImpl(this._self, this._then);

  final _FacilitySessionEntity _self;
  final $Res Function(_FacilitySessionEntity) _then;

/// Create a copy of FacilitySessionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceId = null,Object? name = null,Object? startsAt = null,Object? endsAt = null,Object? colorHex = null,Object? facilityId = null,Object? isRecurring = null,Object? level = freezed,Object? isLadiesOnly = null,Object? instructorNames = null,Object? capacity = freezed,}) {
  return _then(_FacilitySessionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as FacilityServiceLevel?,isLadiesOnly: null == isLadiesOnly ? _self.isLadiesOnly : isLadiesOnly // ignore: cast_nullable_to_non_nullable
as bool,instructorNames: null == instructorNames ? _self._instructorNames : instructorNames // ignore: cast_nullable_to_non_nullable
as List<String>,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as FacilitySessionCapacityEntity?,
  ));
}

/// Create a copy of FacilitySessionEntity
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
}/// Create a copy of FacilitySessionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilitySessionCapacityEntityCopyWith<$Res>? get capacity {
    if (_self.capacity == null) {
    return null;
  }

  return $FacilitySessionCapacityEntityCopyWith<$Res>(_self.capacity!, (value) {
    return _then(_self.copyWith(capacity: value));
  });
}
}

// dart format on
