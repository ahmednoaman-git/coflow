// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collapsed_facility_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CollapsedFacilityEntity {

 int get id; String get name; String get description; String? get statusMessage; String? get logoUrl; String? get coverUrl; int? get likeCount; ActivityLineEntity get activityLine; List<TagEntity> get tags; FacilityType get type; FacilityStatus get status; SubscriptionStatus get subscriptionStatus; PaymentType get paymentType; int get views;
/// Create a copy of CollapsedFacilityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollapsedFacilityEntityCopyWith<CollapsedFacilityEntity> get copyWith => _$CollapsedFacilityEntityCopyWithImpl<CollapsedFacilityEntity>(this as CollapsedFacilityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollapsedFacilityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.activityLine, activityLine) || other.activityLine == activityLine)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.views, views) || other.views == views));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,statusMessage,logoUrl,coverUrl,likeCount,activityLine,const DeepCollectionEquality().hash(tags),type,status,subscriptionStatus,paymentType,views);

@override
String toString() {
  return 'CollapsedFacilityEntity(id: $id, name: $name, description: $description, statusMessage: $statusMessage, logoUrl: $logoUrl, coverUrl: $coverUrl, likeCount: $likeCount, activityLine: $activityLine, tags: $tags, type: $type, status: $status, subscriptionStatus: $subscriptionStatus, paymentType: $paymentType, views: $views)';
}


}

/// @nodoc
abstract mixin class $CollapsedFacilityEntityCopyWith<$Res>  {
  factory $CollapsedFacilityEntityCopyWith(CollapsedFacilityEntity value, $Res Function(CollapsedFacilityEntity) _then) = _$CollapsedFacilityEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, String? statusMessage, String? logoUrl, String? coverUrl, int? likeCount, ActivityLineEntity activityLine, List<TagEntity> tags, FacilityType type, FacilityStatus status, SubscriptionStatus subscriptionStatus, PaymentType paymentType, int views
});


$ActivityLineEntityCopyWith<$Res> get activityLine;

}
/// @nodoc
class _$CollapsedFacilityEntityCopyWithImpl<$Res>
    implements $CollapsedFacilityEntityCopyWith<$Res> {
  _$CollapsedFacilityEntityCopyWithImpl(this._self, this._then);

  final CollapsedFacilityEntity _self;
  final $Res Function(CollapsedFacilityEntity) _then;

/// Create a copy of CollapsedFacilityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? statusMessage = freezed,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? likeCount = freezed,Object? activityLine = null,Object? tags = null,Object? type = null,Object? status = null,Object? subscriptionStatus = null,Object? paymentType = null,Object? views = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,statusMessage: freezed == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,likeCount: freezed == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int?,activityLine: null == activityLine ? _self.activityLine : activityLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagEntity>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FacilityType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FacilityStatus,subscriptionStatus: null == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CollapsedFacilityEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLineEntityCopyWith<$Res> get activityLine {
  
  return $ActivityLineEntityCopyWith<$Res>(_self.activityLine, (value) {
    return _then(_self.copyWith(activityLine: value));
  });
}
}


/// Adds pattern-matching-related methods to [CollapsedFacilityEntity].
extension CollapsedFacilityEntityPatterns on CollapsedFacilityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollapsedFacilityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollapsedFacilityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollapsedFacilityEntity value)  $default,){
final _that = this;
switch (_that) {
case _CollapsedFacilityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollapsedFacilityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CollapsedFacilityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String? statusMessage,  String? logoUrl,  String? coverUrl,  int? likeCount,  ActivityLineEntity activityLine,  List<TagEntity> tags,  FacilityType type,  FacilityStatus status,  SubscriptionStatus subscriptionStatus,  PaymentType paymentType,  int views)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollapsedFacilityEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.statusMessage,_that.logoUrl,_that.coverUrl,_that.likeCount,_that.activityLine,_that.tags,_that.type,_that.status,_that.subscriptionStatus,_that.paymentType,_that.views);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String? statusMessage,  String? logoUrl,  String? coverUrl,  int? likeCount,  ActivityLineEntity activityLine,  List<TagEntity> tags,  FacilityType type,  FacilityStatus status,  SubscriptionStatus subscriptionStatus,  PaymentType paymentType,  int views)  $default,) {final _that = this;
switch (_that) {
case _CollapsedFacilityEntity():
return $default(_that.id,_that.name,_that.description,_that.statusMessage,_that.logoUrl,_that.coverUrl,_that.likeCount,_that.activityLine,_that.tags,_that.type,_that.status,_that.subscriptionStatus,_that.paymentType,_that.views);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  String? statusMessage,  String? logoUrl,  String? coverUrl,  int? likeCount,  ActivityLineEntity activityLine,  List<TagEntity> tags,  FacilityType type,  FacilityStatus status,  SubscriptionStatus subscriptionStatus,  PaymentType paymentType,  int views)?  $default,) {final _that = this;
switch (_that) {
case _CollapsedFacilityEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.statusMessage,_that.logoUrl,_that.coverUrl,_that.likeCount,_that.activityLine,_that.tags,_that.type,_that.status,_that.subscriptionStatus,_that.paymentType,_that.views);case _:
  return null;

}
}

}

/// @nodoc


class _CollapsedFacilityEntity implements CollapsedFacilityEntity {
  const _CollapsedFacilityEntity({required this.id, required this.name, required this.description, this.statusMessage, this.logoUrl, this.coverUrl, this.likeCount, required this.activityLine, final  List<TagEntity> tags = const [], required this.type, required this.status, required this.subscriptionStatus, required this.paymentType, required this.views}): _tags = tags;
  

@override final  int id;
@override final  String name;
@override final  String description;
@override final  String? statusMessage;
@override final  String? logoUrl;
@override final  String? coverUrl;
@override final  int? likeCount;
@override final  ActivityLineEntity activityLine;
 final  List<TagEntity> _tags;
@override@JsonKey() List<TagEntity> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  FacilityType type;
@override final  FacilityStatus status;
@override final  SubscriptionStatus subscriptionStatus;
@override final  PaymentType paymentType;
@override final  int views;

/// Create a copy of CollapsedFacilityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollapsedFacilityEntityCopyWith<_CollapsedFacilityEntity> get copyWith => __$CollapsedFacilityEntityCopyWithImpl<_CollapsedFacilityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollapsedFacilityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.activityLine, activityLine) || other.activityLine == activityLine)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.views, views) || other.views == views));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,statusMessage,logoUrl,coverUrl,likeCount,activityLine,const DeepCollectionEquality().hash(_tags),type,status,subscriptionStatus,paymentType,views);

@override
String toString() {
  return 'CollapsedFacilityEntity(id: $id, name: $name, description: $description, statusMessage: $statusMessage, logoUrl: $logoUrl, coverUrl: $coverUrl, likeCount: $likeCount, activityLine: $activityLine, tags: $tags, type: $type, status: $status, subscriptionStatus: $subscriptionStatus, paymentType: $paymentType, views: $views)';
}


}

/// @nodoc
abstract mixin class _$CollapsedFacilityEntityCopyWith<$Res> implements $CollapsedFacilityEntityCopyWith<$Res> {
  factory _$CollapsedFacilityEntityCopyWith(_CollapsedFacilityEntity value, $Res Function(_CollapsedFacilityEntity) _then) = __$CollapsedFacilityEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, String? statusMessage, String? logoUrl, String? coverUrl, int? likeCount, ActivityLineEntity activityLine, List<TagEntity> tags, FacilityType type, FacilityStatus status, SubscriptionStatus subscriptionStatus, PaymentType paymentType, int views
});


@override $ActivityLineEntityCopyWith<$Res> get activityLine;

}
/// @nodoc
class __$CollapsedFacilityEntityCopyWithImpl<$Res>
    implements _$CollapsedFacilityEntityCopyWith<$Res> {
  __$CollapsedFacilityEntityCopyWithImpl(this._self, this._then);

  final _CollapsedFacilityEntity _self;
  final $Res Function(_CollapsedFacilityEntity) _then;

/// Create a copy of CollapsedFacilityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? statusMessage = freezed,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? likeCount = freezed,Object? activityLine = null,Object? tags = null,Object? type = null,Object? status = null,Object? subscriptionStatus = null,Object? paymentType = null,Object? views = null,}) {
  return _then(_CollapsedFacilityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,statusMessage: freezed == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,likeCount: freezed == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int?,activityLine: null == activityLine ? _self.activityLine : activityLine // ignore: cast_nullable_to_non_nullable
as ActivityLineEntity,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagEntity>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FacilityType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FacilityStatus,subscriptionStatus: null == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CollapsedFacilityEntity
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
