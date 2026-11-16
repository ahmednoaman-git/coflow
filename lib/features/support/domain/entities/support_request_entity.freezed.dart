// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupportRequestEntity {

 int get id;/// What the customer wrote.
 String get issue; SupportRequestStatus get status;/// The server's status string, shown as-is for [SupportRequestStatus.other].
 String get rawStatus;/// The admin's reply, or null before they write one.
 String? get adminNote;/// The screenshot the customer attached, if any.
 String? get imageUrl; DateTime? get createdAt;
/// Create a copy of SupportRequestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportRequestEntityCopyWith<SupportRequestEntity> get copyWith => _$SupportRequestEntityCopyWithImpl<SupportRequestEntity>(this as SupportRequestEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportRequestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.status, status) || other.status == status)&&(identical(other.rawStatus, rawStatus) || other.rawStatus == rawStatus)&&(identical(other.adminNote, adminNote) || other.adminNote == adminNote)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,issue,status,rawStatus,adminNote,imageUrl,createdAt);

@override
String toString() {
  return 'SupportRequestEntity(id: $id, issue: $issue, status: $status, rawStatus: $rawStatus, adminNote: $adminNote, imageUrl: $imageUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SupportRequestEntityCopyWith<$Res>  {
  factory $SupportRequestEntityCopyWith(SupportRequestEntity value, $Res Function(SupportRequestEntity) _then) = _$SupportRequestEntityCopyWithImpl;
@useResult
$Res call({
 int id, String issue, SupportRequestStatus status, String rawStatus, String? adminNote, String? imageUrl, DateTime? createdAt
});




}
/// @nodoc
class _$SupportRequestEntityCopyWithImpl<$Res>
    implements $SupportRequestEntityCopyWith<$Res> {
  _$SupportRequestEntityCopyWithImpl(this._self, this._then);

  final SupportRequestEntity _self;
  final $Res Function(SupportRequestEntity) _then;

/// Create a copy of SupportRequestEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? issue = null,Object? status = null,Object? rawStatus = null,Object? adminNote = freezed,Object? imageUrl = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SupportRequestStatus,rawStatus: null == rawStatus ? _self.rawStatus : rawStatus // ignore: cast_nullable_to_non_nullable
as String,adminNote: freezed == adminNote ? _self.adminNote : adminNote // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportRequestEntity].
extension SupportRequestEntityPatterns on SupportRequestEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportRequestEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportRequestEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportRequestEntity value)  $default,){
final _that = this;
switch (_that) {
case _SupportRequestEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportRequestEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SupportRequestEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String issue,  SupportRequestStatus status,  String rawStatus,  String? adminNote,  String? imageUrl,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportRequestEntity() when $default != null:
return $default(_that.id,_that.issue,_that.status,_that.rawStatus,_that.adminNote,_that.imageUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String issue,  SupportRequestStatus status,  String rawStatus,  String? adminNote,  String? imageUrl,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _SupportRequestEntity():
return $default(_that.id,_that.issue,_that.status,_that.rawStatus,_that.adminNote,_that.imageUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String issue,  SupportRequestStatus status,  String rawStatus,  String? adminNote,  String? imageUrl,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SupportRequestEntity() when $default != null:
return $default(_that.id,_that.issue,_that.status,_that.rawStatus,_that.adminNote,_that.imageUrl,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _SupportRequestEntity implements SupportRequestEntity {
  const _SupportRequestEntity({required this.id, required this.issue, required this.status, required this.rawStatus, this.adminNote, this.imageUrl, this.createdAt});
  

@override final  int id;
/// What the customer wrote.
@override final  String issue;
@override final  SupportRequestStatus status;
/// The server's status string, shown as-is for [SupportRequestStatus.other].
@override final  String rawStatus;
/// The admin's reply, or null before they write one.
@override final  String? adminNote;
/// The screenshot the customer attached, if any.
@override final  String? imageUrl;
@override final  DateTime? createdAt;

/// Create a copy of SupportRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportRequestEntityCopyWith<_SupportRequestEntity> get copyWith => __$SupportRequestEntityCopyWithImpl<_SupportRequestEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportRequestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.status, status) || other.status == status)&&(identical(other.rawStatus, rawStatus) || other.rawStatus == rawStatus)&&(identical(other.adminNote, adminNote) || other.adminNote == adminNote)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,issue,status,rawStatus,adminNote,imageUrl,createdAt);

@override
String toString() {
  return 'SupportRequestEntity(id: $id, issue: $issue, status: $status, rawStatus: $rawStatus, adminNote: $adminNote, imageUrl: $imageUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SupportRequestEntityCopyWith<$Res> implements $SupportRequestEntityCopyWith<$Res> {
  factory _$SupportRequestEntityCopyWith(_SupportRequestEntity value, $Res Function(_SupportRequestEntity) _then) = __$SupportRequestEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String issue, SupportRequestStatus status, String rawStatus, String? adminNote, String? imageUrl, DateTime? createdAt
});




}
/// @nodoc
class __$SupportRequestEntityCopyWithImpl<$Res>
    implements _$SupportRequestEntityCopyWith<$Res> {
  __$SupportRequestEntityCopyWithImpl(this._self, this._then);

  final _SupportRequestEntity _self;
  final $Res Function(_SupportRequestEntity) _then;

/// Create a copy of SupportRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? issue = null,Object? status = null,Object? rawStatus = null,Object? adminNote = freezed,Object? imageUrl = freezed,Object? createdAt = freezed,}) {
  return _then(_SupportRequestEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SupportRequestStatus,rawStatus: null == rawStatus ? _self.rawStatus : rawStatus // ignore: cast_nullable_to_non_nullable
as String,adminNote: freezed == adminNote ? _self.adminNote : adminNote // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
