// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedProfileEntity {

 int get id; String get name;/// Short headline under the name, e.g. `Aerial Silks & Flexibility`.
 String get description; ActivityLineEntity get activityLine; FacilityStatus get status; String? get logoUrl; int get likeCount;/// The branch shown on the card, e.g. `New Cairo, Cairo`.
///
/// TODO(backend): confirm which branch this is meant to be — a facility can
/// have several. The design highlights exactly one per card; is it the main
/// branch, the nearest one to the user, or the branch the user saved from?
/// Until the endpoint says, the stub serves the main branch.
 String? get branchLabel;/// Whether the user is tracking this facility's updates.
///
/// TODO(backend): confirm what tracking actually subscribes the user to
/// (push notifications on new services? schedule changes? offers?) and
/// whether it is the same flag as the "Track Updates" action on the
/// facility profile screen — the two should not diverge.
 bool get isTracked;
/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedProfileEntityCopyWith<SavedProfileEntity> get copyWith => _$SavedProfileEntityCopyWithImpl<SavedProfileEntity>(this as SavedProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.activityLine, activityLine) || other.activityLine == activityLine)&&(identical(other.status, status) || other.status == status)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.branchLabel, branchLabel) || other.branchLabel == branchLabel)&&(identical(other.isTracked, isTracked) || other.isTracked == isTracked));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,activityLine,status,logoUrl,likeCount,branchLabel,isTracked);

@override
String toString() {
  return 'SavedProfileEntity(id: $id, name: $name, description: $description, activityLine: $activityLine, status: $status, logoUrl: $logoUrl, likeCount: $likeCount, branchLabel: $branchLabel, isTracked: $isTracked)';
}


}

/// @nodoc
abstract mixin class $SavedProfileEntityCopyWith<$Res>  {
  factory $SavedProfileEntityCopyWith(SavedProfileEntity value, $Res Function(SavedProfileEntity) _then) = _$SavedProfileEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, ActivityLineEntity activityLine, FacilityStatus status, String? logoUrl, int likeCount, String? branchLabel, bool isTracked
});


$ActivityLineEntityCopyWith<$Res> get activityLine;

}
/// @nodoc
class _$SavedProfileEntityCopyWithImpl<$Res>
    implements $SavedProfileEntityCopyWith<$Res> {
  _$SavedProfileEntityCopyWithImpl(this._self, this._then);

  final SavedProfileEntity _self;
  final $Res Function(SavedProfileEntity) _then;

/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? activityLine = null,Object? status = null,Object? logoUrl = freezed,Object? likeCount = null,Object? branchLabel = freezed,Object? isTracked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,activityLine: null == activityLine ? _self.activityLine : activityLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FacilityStatus,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,branchLabel: freezed == branchLabel ? _self.branchLabel : branchLabel // ignore: cast_nullable_to_non_nullable
as String?,isTracked: null == isTracked ? _self.isTracked : isTracked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLineEntityCopyWith<$Res> get activityLine {
  
  return $ActivityLineEntityCopyWith<$Res>(_self.activityLine, (value) {
    return _then(_self.copyWith(activityLine: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedProfileEntity].
extension SavedProfileEntityPatterns on SavedProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavedProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavedProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  ActivityLineEntity activityLine,  FacilityStatus status,  String? logoUrl,  int likeCount,  String? branchLabel,  bool isTracked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.activityLine,_that.status,_that.logoUrl,_that.likeCount,_that.branchLabel,_that.isTracked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  ActivityLineEntity activityLine,  FacilityStatus status,  String? logoUrl,  int likeCount,  String? branchLabel,  bool isTracked)  $default,) {final _that = this;
switch (_that) {
case _SavedProfileEntity():
return $default(_that.id,_that.name,_that.description,_that.activityLine,_that.status,_that.logoUrl,_that.likeCount,_that.branchLabel,_that.isTracked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  ActivityLineEntity activityLine,  FacilityStatus status,  String? logoUrl,  int likeCount,  String? branchLabel,  bool isTracked)?  $default,) {final _that = this;
switch (_that) {
case _SavedProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.activityLine,_that.status,_that.logoUrl,_that.likeCount,_that.branchLabel,_that.isTracked);case _:
  return null;

}
}

}

/// @nodoc


class _SavedProfileEntity extends SavedProfileEntity {
  const _SavedProfileEntity({required this.id, required this.name, required this.description, required this.activityLine, required this.status, this.logoUrl, this.likeCount = 0, this.branchLabel, this.isTracked = false}): super._();
  

@override final  int id;
@override final  String name;
/// Short headline under the name, e.g. `Aerial Silks & Flexibility`.
@override final  String description;
@override final  ActivityLineEntity activityLine;
@override final  FacilityStatus status;
@override final  String? logoUrl;
@override@JsonKey() final  int likeCount;
/// The branch shown on the card, e.g. `New Cairo, Cairo`.
///
/// TODO(backend): confirm which branch this is meant to be — a facility can
/// have several. The design highlights exactly one per card; is it the main
/// branch, the nearest one to the user, or the branch the user saved from?
/// Until the endpoint says, the stub serves the main branch.
@override final  String? branchLabel;
/// Whether the user is tracking this facility's updates.
///
/// TODO(backend): confirm what tracking actually subscribes the user to
/// (push notifications on new services? schedule changes? offers?) and
/// whether it is the same flag as the "Track Updates" action on the
/// facility profile screen — the two should not diverge.
@override@JsonKey() final  bool isTracked;

/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedProfileEntityCopyWith<_SavedProfileEntity> get copyWith => __$SavedProfileEntityCopyWithImpl<_SavedProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.activityLine, activityLine) || other.activityLine == activityLine)&&(identical(other.status, status) || other.status == status)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.branchLabel, branchLabel) || other.branchLabel == branchLabel)&&(identical(other.isTracked, isTracked) || other.isTracked == isTracked));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,activityLine,status,logoUrl,likeCount,branchLabel,isTracked);

@override
String toString() {
  return 'SavedProfileEntity(id: $id, name: $name, description: $description, activityLine: $activityLine, status: $status, logoUrl: $logoUrl, likeCount: $likeCount, branchLabel: $branchLabel, isTracked: $isTracked)';
}


}

/// @nodoc
abstract mixin class _$SavedProfileEntityCopyWith<$Res> implements $SavedProfileEntityCopyWith<$Res> {
  factory _$SavedProfileEntityCopyWith(_SavedProfileEntity value, $Res Function(_SavedProfileEntity) _then) = __$SavedProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, ActivityLineEntity activityLine, FacilityStatus status, String? logoUrl, int likeCount, String? branchLabel, bool isTracked
});


@override $ActivityLineEntityCopyWith<$Res> get activityLine;

}
/// @nodoc
class __$SavedProfileEntityCopyWithImpl<$Res>
    implements _$SavedProfileEntityCopyWith<$Res> {
  __$SavedProfileEntityCopyWithImpl(this._self, this._then);

  final _SavedProfileEntity _self;
  final $Res Function(_SavedProfileEntity) _then;

/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? activityLine = null,Object? status = null,Object? logoUrl = freezed,Object? likeCount = null,Object? branchLabel = freezed,Object? isTracked = null,}) {
  return _then(_SavedProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,activityLine: null == activityLine ? _self.activityLine : activityLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FacilityStatus,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,branchLabel: freezed == branchLabel ? _self.branchLabel : branchLabel // ignore: cast_nullable_to_non_nullable
as String?,isTracked: null == isTracked ? _self.isTracked : isTracked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SavedProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLineEntityCopyWith<$Res> get activityLine {
  
  return $ActivityLineEntityCopyWith<$Res>(_self.activityLine, (value) {
    return _then(_self.copyWith(activityLine: value));
  });
}
}

// dart format on
