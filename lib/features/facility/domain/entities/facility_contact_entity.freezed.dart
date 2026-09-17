// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_contact_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityContactLinkEntity {

/// The number or URL to launch.
 String get value;/// What the facility called it (`Mobile`, `Landline`, ...), when labelled.
 String? get label;
/// Create a copy of FacilityContactLinkEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityContactLinkEntityCopyWith<FacilityContactLinkEntity> get copyWith => _$FacilityContactLinkEntityCopyWithImpl<FacilityContactLinkEntity>(this as FacilityContactLinkEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityContactLinkEntity&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,value,label);

@override
String toString() {
  return 'FacilityContactLinkEntity(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class $FacilityContactLinkEntityCopyWith<$Res>  {
  factory $FacilityContactLinkEntityCopyWith(FacilityContactLinkEntity value, $Res Function(FacilityContactLinkEntity) _then) = _$FacilityContactLinkEntityCopyWithImpl;
@useResult
$Res call({
 String value, String? label
});




}
/// @nodoc
class _$FacilityContactLinkEntityCopyWithImpl<$Res>
    implements $FacilityContactLinkEntityCopyWith<$Res> {
  _$FacilityContactLinkEntityCopyWithImpl(this._self, this._then);

  final FacilityContactLinkEntity _self;
  final $Res Function(FacilityContactLinkEntity) _then;

/// Create a copy of FacilityContactLinkEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityContactLinkEntity].
extension FacilityContactLinkEntityPatterns on FacilityContactLinkEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityContactLinkEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityContactLinkEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityContactLinkEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityContactLinkEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityContactLinkEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityContactLinkEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String? label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityContactLinkEntity() when $default != null:
return $default(_that.value,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String? label)  $default,) {final _that = this;
switch (_that) {
case _FacilityContactLinkEntity():
return $default(_that.value,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String? label)?  $default,) {final _that = this;
switch (_that) {
case _FacilityContactLinkEntity() when $default != null:
return $default(_that.value,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityContactLinkEntity implements FacilityContactLinkEntity {
  const _FacilityContactLinkEntity({required this.value, this.label});
  

/// The number or URL to launch.
@override final  String value;
/// What the facility called it (`Mobile`, `Landline`, ...), when labelled.
@override final  String? label;

/// Create a copy of FacilityContactLinkEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityContactLinkEntityCopyWith<_FacilityContactLinkEntity> get copyWith => __$FacilityContactLinkEntityCopyWithImpl<_FacilityContactLinkEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityContactLinkEntity&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,value,label);

@override
String toString() {
  return 'FacilityContactLinkEntity(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class _$FacilityContactLinkEntityCopyWith<$Res> implements $FacilityContactLinkEntityCopyWith<$Res> {
  factory _$FacilityContactLinkEntityCopyWith(_FacilityContactLinkEntity value, $Res Function(_FacilityContactLinkEntity) _then) = __$FacilityContactLinkEntityCopyWithImpl;
@override @useResult
$Res call({
 String value, String? label
});




}
/// @nodoc
class __$FacilityContactLinkEntityCopyWithImpl<$Res>
    implements _$FacilityContactLinkEntityCopyWith<$Res> {
  __$FacilityContactLinkEntityCopyWithImpl(this._self, this._then);

  final _FacilityContactLinkEntity _self;
  final $Res Function(_FacilityContactLinkEntity) _then;

/// Create a copy of FacilityContactLinkEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = freezed,}) {
  return _then(_FacilityContactLinkEntity(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$FacilityContactEntity {

 FacilityContactChannel get channel;/// The label the facility authored, kept for channels the app does not
/// recognize so the UI can still name them.
 String get label; List<FacilityContactLinkEntity> get links;
/// Create a copy of FacilityContactEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityContactEntityCopyWith<FacilityContactEntity> get copyWith => _$FacilityContactEntityCopyWithImpl<FacilityContactEntity>(this as FacilityContactEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityContactEntity&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.links, links));
}


@override
int get hashCode => Object.hash(runtimeType,channel,label,const DeepCollectionEquality().hash(links));

@override
String toString() {
  return 'FacilityContactEntity(channel: $channel, label: $label, links: $links)';
}


}

/// @nodoc
abstract mixin class $FacilityContactEntityCopyWith<$Res>  {
  factory $FacilityContactEntityCopyWith(FacilityContactEntity value, $Res Function(FacilityContactEntity) _then) = _$FacilityContactEntityCopyWithImpl;
@useResult
$Res call({
 FacilityContactChannel channel, String label, List<FacilityContactLinkEntity> links
});




}
/// @nodoc
class _$FacilityContactEntityCopyWithImpl<$Res>
    implements $FacilityContactEntityCopyWith<$Res> {
  _$FacilityContactEntityCopyWithImpl(this._self, this._then);

  final FacilityContactEntity _self;
  final $Res Function(FacilityContactEntity) _then;

/// Create a copy of FacilityContactEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? channel = null,Object? label = null,Object? links = null,}) {
  return _then(_self.copyWith(
channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as FacilityContactChannel,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<FacilityContactLinkEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityContactEntity].
extension FacilityContactEntityPatterns on FacilityContactEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityContactEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityContactEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityContactEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityContactEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityContactEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityContactEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FacilityContactChannel channel,  String label,  List<FacilityContactLinkEntity> links)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityContactEntity() when $default != null:
return $default(_that.channel,_that.label,_that.links);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FacilityContactChannel channel,  String label,  List<FacilityContactLinkEntity> links)  $default,) {final _that = this;
switch (_that) {
case _FacilityContactEntity():
return $default(_that.channel,_that.label,_that.links);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FacilityContactChannel channel,  String label,  List<FacilityContactLinkEntity> links)?  $default,) {final _that = this;
switch (_that) {
case _FacilityContactEntity() when $default != null:
return $default(_that.channel,_that.label,_that.links);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityContactEntity extends FacilityContactEntity {
  const _FacilityContactEntity({required this.channel, required this.label, final  List<FacilityContactLinkEntity> links = const <FacilityContactLinkEntity>[]}): _links = links,super._();
  

@override final  FacilityContactChannel channel;
/// The label the facility authored, kept for channels the app does not
/// recognize so the UI can still name them.
@override final  String label;
 final  List<FacilityContactLinkEntity> _links;
@override@JsonKey() List<FacilityContactLinkEntity> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}


/// Create a copy of FacilityContactEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityContactEntityCopyWith<_FacilityContactEntity> get copyWith => __$FacilityContactEntityCopyWithImpl<_FacilityContactEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityContactEntity&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other._links, _links));
}


@override
int get hashCode => Object.hash(runtimeType,channel,label,const DeepCollectionEquality().hash(_links));

@override
String toString() {
  return 'FacilityContactEntity(channel: $channel, label: $label, links: $links)';
}


}

/// @nodoc
abstract mixin class _$FacilityContactEntityCopyWith<$Res> implements $FacilityContactEntityCopyWith<$Res> {
  factory _$FacilityContactEntityCopyWith(_FacilityContactEntity value, $Res Function(_FacilityContactEntity) _then) = __$FacilityContactEntityCopyWithImpl;
@override @useResult
$Res call({
 FacilityContactChannel channel, String label, List<FacilityContactLinkEntity> links
});




}
/// @nodoc
class __$FacilityContactEntityCopyWithImpl<$Res>
    implements _$FacilityContactEntityCopyWith<$Res> {
  __$FacilityContactEntityCopyWithImpl(this._self, this._then);

  final _FacilityContactEntity _self;
  final $Res Function(_FacilityContactEntity) _then;

/// Create a copy of FacilityContactEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? channel = null,Object? label = null,Object? links = null,}) {
  return _then(_FacilityContactEntity(
channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as FacilityContactChannel,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<FacilityContactLinkEntity>,
  ));
}


}

// dart format on
