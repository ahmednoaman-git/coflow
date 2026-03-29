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
mixin _$TeamMemberEntity {

 int get id; String get name; String get title; String get imageUrl; String? get bio;
/// Create a copy of TeamMemberEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamMemberEntityCopyWith<TeamMemberEntity> get copyWith => _$TeamMemberEntityCopyWithImpl<TeamMemberEntity>(this as TeamMemberEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMemberEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bio, bio) || other.bio == bio));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,title,imageUrl,bio);

@override
String toString() {
  return 'TeamMemberEntity(id: $id, name: $name, title: $title, imageUrl: $imageUrl, bio: $bio)';
}


}

/// @nodoc
abstract mixin class $TeamMemberEntityCopyWith<$Res>  {
  factory $TeamMemberEntityCopyWith(TeamMemberEntity value, $Res Function(TeamMemberEntity) _then) = _$TeamMemberEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String title, String imageUrl, String? bio
});




}
/// @nodoc
class _$TeamMemberEntityCopyWithImpl<$Res>
    implements $TeamMemberEntityCopyWith<$Res> {
  _$TeamMemberEntityCopyWithImpl(this._self, this._then);

  final TeamMemberEntity _self;
  final $Res Function(TeamMemberEntity) _then;

/// Create a copy of TeamMemberEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? title = null,Object? imageUrl = null,Object? bio = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamMemberEntity].
extension TeamMemberEntityPatterns on TeamMemberEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamMemberEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamMemberEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamMemberEntity value)  $default,){
final _that = this;
switch (_that) {
case _TeamMemberEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamMemberEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TeamMemberEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String title,  String imageUrl,  String? bio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamMemberEntity() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.imageUrl,_that.bio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String title,  String imageUrl,  String? bio)  $default,) {final _that = this;
switch (_that) {
case _TeamMemberEntity():
return $default(_that.id,_that.name,_that.title,_that.imageUrl,_that.bio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String title,  String imageUrl,  String? bio)?  $default,) {final _that = this;
switch (_that) {
case _TeamMemberEntity() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.imageUrl,_that.bio);case _:
  return null;

}
}

}

/// @nodoc


class _TeamMemberEntity implements TeamMemberEntity {
  const _TeamMemberEntity({required this.id, required this.name, required this.title, required this.imageUrl, this.bio});
  

@override final  int id;
@override final  String name;
@override final  String title;
@override final  String imageUrl;
@override final  String? bio;

/// Create a copy of TeamMemberEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamMemberEntityCopyWith<_TeamMemberEntity> get copyWith => __$TeamMemberEntityCopyWithImpl<_TeamMemberEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamMemberEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bio, bio) || other.bio == bio));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,title,imageUrl,bio);

@override
String toString() {
  return 'TeamMemberEntity(id: $id, name: $name, title: $title, imageUrl: $imageUrl, bio: $bio)';
}


}

/// @nodoc
abstract mixin class _$TeamMemberEntityCopyWith<$Res> implements $TeamMemberEntityCopyWith<$Res> {
  factory _$TeamMemberEntityCopyWith(_TeamMemberEntity value, $Res Function(_TeamMemberEntity) _then) = __$TeamMemberEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String title, String imageUrl, String? bio
});




}
/// @nodoc
class __$TeamMemberEntityCopyWithImpl<$Res>
    implements _$TeamMemberEntityCopyWith<$Res> {
  __$TeamMemberEntityCopyWithImpl(this._self, this._then);

  final _TeamMemberEntity _self;
  final $Res Function(_TeamMemberEntity) _then;

/// Create a copy of TeamMemberEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? title = null,Object? imageUrl = null,Object? bio = freezed,}) {
  return _then(_TeamMemberEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$OperatingHoursEntity {

 int get id; List<String> get days; String get fromTime; String get toTime;
/// Create a copy of OperatingHoursEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperatingHoursEntityCopyWith<OperatingHoursEntity> get copyWith => _$OperatingHoursEntityCopyWithImpl<OperatingHoursEntity>(this as OperatingHoursEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperatingHoursEntity&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.days, days)&&(identical(other.fromTime, fromTime) || other.fromTime == fromTime)&&(identical(other.toTime, toTime) || other.toTime == toTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(days),fromTime,toTime);

@override
String toString() {
  return 'OperatingHoursEntity(id: $id, days: $days, fromTime: $fromTime, toTime: $toTime)';
}


}

/// @nodoc
abstract mixin class $OperatingHoursEntityCopyWith<$Res>  {
  factory $OperatingHoursEntityCopyWith(OperatingHoursEntity value, $Res Function(OperatingHoursEntity) _then) = _$OperatingHoursEntityCopyWithImpl;
@useResult
$Res call({
 int id, List<String> days, String fromTime, String toTime
});




}
/// @nodoc
class _$OperatingHoursEntityCopyWithImpl<$Res>
    implements $OperatingHoursEntityCopyWith<$Res> {
  _$OperatingHoursEntityCopyWithImpl(this._self, this._then);

  final OperatingHoursEntity _self;
  final $Res Function(OperatingHoursEntity) _then;

/// Create a copy of OperatingHoursEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? days = null,Object? fromTime = null,Object? toTime = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<String>,fromTime: null == fromTime ? _self.fromTime : fromTime // ignore: cast_nullable_to_non_nullable
as String,toTime: null == toTime ? _self.toTime : toTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OperatingHoursEntity].
extension OperatingHoursEntityPatterns on OperatingHoursEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperatingHoursEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperatingHoursEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperatingHoursEntity value)  $default,){
final _that = this;
switch (_that) {
case _OperatingHoursEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperatingHoursEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OperatingHoursEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  List<String> days,  String fromTime,  String toTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperatingHoursEntity() when $default != null:
return $default(_that.id,_that.days,_that.fromTime,_that.toTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  List<String> days,  String fromTime,  String toTime)  $default,) {final _that = this;
switch (_that) {
case _OperatingHoursEntity():
return $default(_that.id,_that.days,_that.fromTime,_that.toTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  List<String> days,  String fromTime,  String toTime)?  $default,) {final _that = this;
switch (_that) {
case _OperatingHoursEntity() when $default != null:
return $default(_that.id,_that.days,_that.fromTime,_that.toTime);case _:
  return null;

}
}

}

/// @nodoc


class _OperatingHoursEntity implements OperatingHoursEntity {
  const _OperatingHoursEntity({required this.id, required final  List<String> days, required this.fromTime, required this.toTime}): _days = days;
  

@override final  int id;
 final  List<String> _days;
@override List<String> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

@override final  String fromTime;
@override final  String toTime;

/// Create a copy of OperatingHoursEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperatingHoursEntityCopyWith<_OperatingHoursEntity> get copyWith => __$OperatingHoursEntityCopyWithImpl<_OperatingHoursEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperatingHoursEntity&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._days, _days)&&(identical(other.fromTime, fromTime) || other.fromTime == fromTime)&&(identical(other.toTime, toTime) || other.toTime == toTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_days),fromTime,toTime);

@override
String toString() {
  return 'OperatingHoursEntity(id: $id, days: $days, fromTime: $fromTime, toTime: $toTime)';
}


}

/// @nodoc
abstract mixin class _$OperatingHoursEntityCopyWith<$Res> implements $OperatingHoursEntityCopyWith<$Res> {
  factory _$OperatingHoursEntityCopyWith(_OperatingHoursEntity value, $Res Function(_OperatingHoursEntity) _then) = __$OperatingHoursEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, List<String> days, String fromTime, String toTime
});




}
/// @nodoc
class __$OperatingHoursEntityCopyWithImpl<$Res>
    implements _$OperatingHoursEntityCopyWith<$Res> {
  __$OperatingHoursEntityCopyWithImpl(this._self, this._then);

  final _OperatingHoursEntity _self;
  final $Res Function(_OperatingHoursEntity) _then;

/// Create a copy of OperatingHoursEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? days = null,Object? fromTime = null,Object? toTime = null,}) {
  return _then(_OperatingHoursEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<String>,fromTime: null == fromTime ? _self.fromTime : fromTime // ignore: cast_nullable_to_non_nullable
as String,toTime: null == toTime ? _self.toTime : toTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BranchEntity {

 int get id; String get title; String? get coverUrl;
/// Create a copy of BranchEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchEntityCopyWith<BranchEntity> get copyWith => _$BranchEntityCopyWithImpl<BranchEntity>(this as BranchEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,coverUrl);

@override
String toString() {
  return 'BranchEntity(id: $id, title: $title, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class $BranchEntityCopyWith<$Res>  {
  factory $BranchEntityCopyWith(BranchEntity value, $Res Function(BranchEntity) _then) = _$BranchEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, String? coverUrl
});




}
/// @nodoc
class _$BranchEntityCopyWithImpl<$Res>
    implements $BranchEntityCopyWith<$Res> {
  _$BranchEntityCopyWithImpl(this._self, this._then);

  final BranchEntity _self;
  final $Res Function(BranchEntity) _then;

/// Create a copy of BranchEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? coverUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BranchEntity].
extension BranchEntityPatterns on BranchEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchEntity value)  $default,){
final _that = this;
switch (_that) {
case _BranchEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BranchEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String? coverUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchEntity() when $default != null:
return $default(_that.id,_that.title,_that.coverUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String? coverUrl)  $default,) {final _that = this;
switch (_that) {
case _BranchEntity():
return $default(_that.id,_that.title,_that.coverUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String? coverUrl)?  $default,) {final _that = this;
switch (_that) {
case _BranchEntity() when $default != null:
return $default(_that.id,_that.title,_that.coverUrl);case _:
  return null;

}
}

}

/// @nodoc


class _BranchEntity implements BranchEntity {
  const _BranchEntity({required this.id, required this.title, this.coverUrl});
  

@override final  int id;
@override final  String title;
@override final  String? coverUrl;

/// Create a copy of BranchEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchEntityCopyWith<_BranchEntity> get copyWith => __$BranchEntityCopyWithImpl<_BranchEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,coverUrl);

@override
String toString() {
  return 'BranchEntity(id: $id, title: $title, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class _$BranchEntityCopyWith<$Res> implements $BranchEntityCopyWith<$Res> {
  factory _$BranchEntityCopyWith(_BranchEntity value, $Res Function(_BranchEntity) _then) = __$BranchEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String? coverUrl
});




}
/// @nodoc
class __$BranchEntityCopyWithImpl<$Res>
    implements _$BranchEntityCopyWith<$Res> {
  __$BranchEntityCopyWithImpl(this._self, this._then);

  final _BranchEntity _self;
  final $Res Function(_BranchEntity) _then;

/// Create a copy of BranchEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? coverUrl = freezed,}) {
  return _then(_BranchEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$LanguageEntity {

 int get id; String get name;
/// Create a copy of LanguageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageEntityCopyWith<LanguageEntity> get copyWith => _$LanguageEntityCopyWithImpl<LanguageEntity>(this as LanguageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'LanguageEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $LanguageEntityCopyWith<$Res>  {
  factory $LanguageEntityCopyWith(LanguageEntity value, $Res Function(LanguageEntity) _then) = _$LanguageEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$LanguageEntityCopyWithImpl<$Res>
    implements $LanguageEntityCopyWith<$Res> {
  _$LanguageEntityCopyWithImpl(this._self, this._then);

  final LanguageEntity _self;
  final $Res Function(LanguageEntity) _then;

/// Create a copy of LanguageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LanguageEntity].
extension LanguageEntityPatterns on LanguageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LanguageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LanguageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LanguageEntity value)  $default,){
final _that = this;
switch (_that) {
case _LanguageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LanguageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LanguageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LanguageEntity() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _LanguageEntity():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _LanguageEntity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _LanguageEntity implements LanguageEntity {
  const _LanguageEntity({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of LanguageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LanguageEntityCopyWith<_LanguageEntity> get copyWith => __$LanguageEntityCopyWithImpl<_LanguageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LanguageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'LanguageEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$LanguageEntityCopyWith<$Res> implements $LanguageEntityCopyWith<$Res> {
  factory _$LanguageEntityCopyWith(_LanguageEntity value, $Res Function(_LanguageEntity) _then) = __$LanguageEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$LanguageEntityCopyWithImpl<$Res>
    implements _$LanguageEntityCopyWith<$Res> {
  __$LanguageEntityCopyWithImpl(this._self, this._then);

  final _LanguageEntity _self;
  final $Res Function(_LanguageEntity) _then;

/// Create a copy of LanguageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_LanguageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AmenityEntity {

 int get id; String get name; String get iconUrl;
/// Create a copy of AmenityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmenityEntityCopyWith<AmenityEntity> get copyWith => _$AmenityEntityCopyWithImpl<AmenityEntity>(this as AmenityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmenityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,iconUrl);

@override
String toString() {
  return 'AmenityEntity(id: $id, name: $name, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $AmenityEntityCopyWith<$Res>  {
  factory $AmenityEntityCopyWith(AmenityEntity value, $Res Function(AmenityEntity) _then) = _$AmenityEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String iconUrl
});




}
/// @nodoc
class _$AmenityEntityCopyWithImpl<$Res>
    implements $AmenityEntityCopyWith<$Res> {
  _$AmenityEntityCopyWithImpl(this._self, this._then);

  final AmenityEntity _self;
  final $Res Function(AmenityEntity) _then;

/// Create a copy of AmenityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? iconUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AmenityEntity].
extension AmenityEntityPatterns on AmenityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmenityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmenityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmenityEntity value)  $default,){
final _that = this;
switch (_that) {
case _AmenityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmenityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AmenityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AmenityEntity() when $default != null:
return $default(_that.id,_that.name,_that.iconUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String iconUrl)  $default,) {final _that = this;
switch (_that) {
case _AmenityEntity():
return $default(_that.id,_that.name,_that.iconUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _AmenityEntity() when $default != null:
return $default(_that.id,_that.name,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc


class _AmenityEntity implements AmenityEntity {
  const _AmenityEntity({required this.id, required this.name, required this.iconUrl});
  

@override final  int id;
@override final  String name;
@override final  String iconUrl;

/// Create a copy of AmenityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmenityEntityCopyWith<_AmenityEntity> get copyWith => __$AmenityEntityCopyWithImpl<_AmenityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmenityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,iconUrl);

@override
String toString() {
  return 'AmenityEntity(id: $id, name: $name, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$AmenityEntityCopyWith<$Res> implements $AmenityEntityCopyWith<$Res> {
  factory _$AmenityEntityCopyWith(_AmenityEntity value, $Res Function(_AmenityEntity) _then) = __$AmenityEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String iconUrl
});




}
/// @nodoc
class __$AmenityEntityCopyWithImpl<$Res>
    implements _$AmenityEntityCopyWith<$Res> {
  __$AmenityEntityCopyWithImpl(this._self, this._then);

  final _AmenityEntity _self;
  final $Res Function(_AmenityEntity) _then;

/// Create a copy of AmenityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? iconUrl = null,}) {
  return _then(_AmenityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LocationEntity {

 String? get address; String? get cityName; String? get areaName; double? get latitude; double? get longitude;
/// Create a copy of LocationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<LocationEntity> get copyWith => _$LocationEntityCopyWithImpl<LocationEntity>(this as LocationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationEntity&&(identical(other.address, address) || other.address == address)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,address,cityName,areaName,latitude,longitude);

@override
String toString() {
  return 'LocationEntity(address: $address, cityName: $cityName, areaName: $areaName, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $LocationEntityCopyWith<$Res>  {
  factory $LocationEntityCopyWith(LocationEntity value, $Res Function(LocationEntity) _then) = _$LocationEntityCopyWithImpl;
@useResult
$Res call({
 String? address, String? cityName, String? areaName, double? latitude, double? longitude
});




}
/// @nodoc
class _$LocationEntityCopyWithImpl<$Res>
    implements $LocationEntityCopyWith<$Res> {
  _$LocationEntityCopyWithImpl(this._self, this._then);

  final LocationEntity _self;
  final $Res Function(LocationEntity) _then;

/// Create a copy of LocationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = freezed,Object? cityName = freezed,Object? areaName = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationEntity].
extension LocationEntityPatterns on LocationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationEntity value)  $default,){
final _that = this;
switch (_that) {
case _LocationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LocationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? address,  String? cityName,  String? areaName,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationEntity() when $default != null:
return $default(_that.address,_that.cityName,_that.areaName,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? address,  String? cityName,  String? areaName,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _LocationEntity():
return $default(_that.address,_that.cityName,_that.areaName,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? address,  String? cityName,  String? areaName,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _LocationEntity() when $default != null:
return $default(_that.address,_that.cityName,_that.areaName,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _LocationEntity implements LocationEntity {
  const _LocationEntity({this.address, this.cityName, this.areaName, this.latitude, this.longitude});
  

@override final  String? address;
@override final  String? cityName;
@override final  String? areaName;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of LocationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationEntityCopyWith<_LocationEntity> get copyWith => __$LocationEntityCopyWithImpl<_LocationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationEntity&&(identical(other.address, address) || other.address == address)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,address,cityName,areaName,latitude,longitude);

@override
String toString() {
  return 'LocationEntity(address: $address, cityName: $cityName, areaName: $areaName, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$LocationEntityCopyWith<$Res> implements $LocationEntityCopyWith<$Res> {
  factory _$LocationEntityCopyWith(_LocationEntity value, $Res Function(_LocationEntity) _then) = __$LocationEntityCopyWithImpl;
@override @useResult
$Res call({
 String? address, String? cityName, String? areaName, double? latitude, double? longitude
});




}
/// @nodoc
class __$LocationEntityCopyWithImpl<$Res>
    implements _$LocationEntityCopyWith<$Res> {
  __$LocationEntityCopyWithImpl(this._self, this._then);

  final _LocationEntity _self;
  final $Res Function(_LocationEntity) _then;

/// Create a copy of LocationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = freezed,Object? cityName = freezed,Object? areaName = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_LocationEntity(
address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$ReservationContactEntity {

 String get type; String? get link;
/// Create a copy of ReservationContactEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationContactEntityCopyWith<ReservationContactEntity> get copyWith => _$ReservationContactEntityCopyWithImpl<ReservationContactEntity>(this as ReservationContactEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationContactEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.link, link) || other.link == link));
}


@override
int get hashCode => Object.hash(runtimeType,type,link);

@override
String toString() {
  return 'ReservationContactEntity(type: $type, link: $link)';
}


}

/// @nodoc
abstract mixin class $ReservationContactEntityCopyWith<$Res>  {
  factory $ReservationContactEntityCopyWith(ReservationContactEntity value, $Res Function(ReservationContactEntity) _then) = _$ReservationContactEntityCopyWithImpl;
@useResult
$Res call({
 String type, String? link
});




}
/// @nodoc
class _$ReservationContactEntityCopyWithImpl<$Res>
    implements $ReservationContactEntityCopyWith<$Res> {
  _$ReservationContactEntityCopyWithImpl(this._self, this._then);

  final ReservationContactEntity _self;
  final $Res Function(ReservationContactEntity) _then;

/// Create a copy of ReservationContactEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? link = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationContactEntity].
extension ReservationContactEntityPatterns on ReservationContactEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationContactEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationContactEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationContactEntity value)  $default,){
final _that = this;
switch (_that) {
case _ReservationContactEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationContactEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationContactEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String? link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationContactEntity() when $default != null:
return $default(_that.type,_that.link);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String? link)  $default,) {final _that = this;
switch (_that) {
case _ReservationContactEntity():
return $default(_that.type,_that.link);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String? link)?  $default,) {final _that = this;
switch (_that) {
case _ReservationContactEntity() when $default != null:
return $default(_that.type,_that.link);case _:
  return null;

}
}

}

/// @nodoc


class _ReservationContactEntity implements ReservationContactEntity {
  const _ReservationContactEntity({required this.type, this.link});
  

@override final  String type;
@override final  String? link;

/// Create a copy of ReservationContactEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationContactEntityCopyWith<_ReservationContactEntity> get copyWith => __$ReservationContactEntityCopyWithImpl<_ReservationContactEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationContactEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.link, link) || other.link == link));
}


@override
int get hashCode => Object.hash(runtimeType,type,link);

@override
String toString() {
  return 'ReservationContactEntity(type: $type, link: $link)';
}


}

/// @nodoc
abstract mixin class _$ReservationContactEntityCopyWith<$Res> implements $ReservationContactEntityCopyWith<$Res> {
  factory _$ReservationContactEntityCopyWith(_ReservationContactEntity value, $Res Function(_ReservationContactEntity) _then) = __$ReservationContactEntityCopyWithImpl;
@override @useResult
$Res call({
 String type, String? link
});




}
/// @nodoc
class __$ReservationContactEntityCopyWithImpl<$Res>
    implements _$ReservationContactEntityCopyWith<$Res> {
  __$ReservationContactEntityCopyWithImpl(this._self, this._then);

  final _ReservationContactEntity _self;
  final $Res Function(_ReservationContactEntity) _then;

/// Create a copy of ReservationContactEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? link = freezed,}) {
  return _then(_ReservationContactEntity(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$MainBranchEntity {

 int get id; String get name;
/// Create a copy of MainBranchEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainBranchEntityCopyWith<MainBranchEntity> get copyWith => _$MainBranchEntityCopyWithImpl<MainBranchEntity>(this as MainBranchEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainBranchEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'MainBranchEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $MainBranchEntityCopyWith<$Res>  {
  factory $MainBranchEntityCopyWith(MainBranchEntity value, $Res Function(MainBranchEntity) _then) = _$MainBranchEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$MainBranchEntityCopyWithImpl<$Res>
    implements $MainBranchEntityCopyWith<$Res> {
  _$MainBranchEntityCopyWithImpl(this._self, this._then);

  final MainBranchEntity _self;
  final $Res Function(MainBranchEntity) _then;

/// Create a copy of MainBranchEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MainBranchEntity].
extension MainBranchEntityPatterns on MainBranchEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MainBranchEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MainBranchEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MainBranchEntity value)  $default,){
final _that = this;
switch (_that) {
case _MainBranchEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MainBranchEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MainBranchEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MainBranchEntity() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _MainBranchEntity():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _MainBranchEntity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _MainBranchEntity implements MainBranchEntity {
  const _MainBranchEntity({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of MainBranchEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainBranchEntityCopyWith<_MainBranchEntity> get copyWith => __$MainBranchEntityCopyWithImpl<_MainBranchEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainBranchEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'MainBranchEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$MainBranchEntityCopyWith<$Res> implements $MainBranchEntityCopyWith<$Res> {
  factory _$MainBranchEntityCopyWith(_MainBranchEntity value, $Res Function(_MainBranchEntity) _then) = __$MainBranchEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$MainBranchEntityCopyWithImpl<$Res>
    implements _$MainBranchEntityCopyWith<$Res> {
  __$MainBranchEntityCopyWithImpl(this._self, this._then);

  final _MainBranchEntity _self;
  final $Res Function(_MainBranchEntity) _then;

/// Create a copy of MainBranchEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_MainBranchEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$FacilityProfileEntity {

 int get id; String get name; String? get title; String? get year; String? get bio; int? get likesCount; String? get logoUrl; String? get coverUrl; List<String> get tags; List<TeamMemberEntity> get teamMembers; List<OperatingHoursEntity> get operatingHours; List<BranchEntity> get branches; List<LanguageEntity> get languages; List<AmenityEntity> get amenities; List<ReservationContactEntity> get reservationContacts; LocationEntity? get location; MainBranchEntity? get mainBranch;
/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityProfileEntityCopyWith<FacilityProfileEntity> get copyWith => _$FacilityProfileEntityCopyWithImpl<FacilityProfileEntity>(this as FacilityProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.teamMembers, teamMembers)&&const DeepCollectionEquality().equals(other.operatingHours, operatingHours)&&const DeepCollectionEquality().equals(other.branches, branches)&&const DeepCollectionEquality().equals(other.languages, languages)&&const DeepCollectionEquality().equals(other.amenities, amenities)&&const DeepCollectionEquality().equals(other.reservationContacts, reservationContacts)&&(identical(other.location, location) || other.location == location)&&(identical(other.mainBranch, mainBranch) || other.mainBranch == mainBranch));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,title,year,bio,likesCount,logoUrl,coverUrl,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(teamMembers),const DeepCollectionEquality().hash(operatingHours),const DeepCollectionEquality().hash(branches),const DeepCollectionEquality().hash(languages),const DeepCollectionEquality().hash(amenities),const DeepCollectionEquality().hash(reservationContacts),location,mainBranch);

@override
String toString() {
  return 'FacilityProfileEntity(id: $id, name: $name, title: $title, year: $year, bio: $bio, likesCount: $likesCount, logoUrl: $logoUrl, coverUrl: $coverUrl, tags: $tags, teamMembers: $teamMembers, operatingHours: $operatingHours, branches: $branches, languages: $languages, amenities: $amenities, reservationContacts: $reservationContacts, location: $location, mainBranch: $mainBranch)';
}


}

/// @nodoc
abstract mixin class $FacilityProfileEntityCopyWith<$Res>  {
  factory $FacilityProfileEntityCopyWith(FacilityProfileEntity value, $Res Function(FacilityProfileEntity) _then) = _$FacilityProfileEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? title, String? year, String? bio, int? likesCount, String? logoUrl, String? coverUrl, List<String> tags, List<TeamMemberEntity> teamMembers, List<OperatingHoursEntity> operatingHours, List<BranchEntity> branches, List<LanguageEntity> languages, List<AmenityEntity> amenities, List<ReservationContactEntity> reservationContacts, LocationEntity? location, MainBranchEntity? mainBranch
});


$LocationEntityCopyWith<$Res>? get location;$MainBranchEntityCopyWith<$Res>? get mainBranch;

}
/// @nodoc
class _$FacilityProfileEntityCopyWithImpl<$Res>
    implements $FacilityProfileEntityCopyWith<$Res> {
  _$FacilityProfileEntityCopyWithImpl(this._self, this._then);

  final FacilityProfileEntity _self;
  final $Res Function(FacilityProfileEntity) _then;

/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? title = freezed,Object? year = freezed,Object? bio = freezed,Object? likesCount = freezed,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? tags = null,Object? teamMembers = null,Object? operatingHours = null,Object? branches = null,Object? languages = null,Object? amenities = null,Object? reservationContacts = null,Object? location = freezed,Object? mainBranch = freezed,}) {
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
as List<String>,teamMembers: null == teamMembers ? _self.teamMembers : teamMembers // ignore: cast_nullable_to_non_nullable
as List<TeamMemberEntity>,operatingHours: null == operatingHours ? _self.operatingHours : operatingHours // ignore: cast_nullable_to_non_nullable
as List<OperatingHoursEntity>,branches: null == branches ? _self.branches : branches // ignore: cast_nullable_to_non_nullable
as List<BranchEntity>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<LanguageEntity>,amenities: null == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<AmenityEntity>,reservationContacts: null == reservationContacts ? _self.reservationContacts : reservationContacts // ignore: cast_nullable_to_non_nullable
as List<ReservationContactEntity>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationEntity?,mainBranch: freezed == mainBranch ? _self.mainBranch : mainBranch // ignore: cast_nullable_to_non_nullable
as MainBranchEntity?,
  ));
}
/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationEntityCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainBranchEntityCopyWith<$Res>? get mainBranch {
    if (_self.mainBranch == null) {
    return null;
  }

  return $MainBranchEntityCopyWith<$Res>(_self.mainBranch!, (value) {
    return _then(_self.copyWith(mainBranch: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? title,  String? year,  String? bio,  int? likesCount,  String? logoUrl,  String? coverUrl,  List<String> tags,  List<TeamMemberEntity> teamMembers,  List<OperatingHoursEntity> operatingHours,  List<BranchEntity> branches,  List<LanguageEntity> languages,  List<AmenityEntity> amenities,  List<ReservationContactEntity> reservationContacts,  LocationEntity? location,  MainBranchEntity? mainBranch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.year,_that.bio,_that.likesCount,_that.logoUrl,_that.coverUrl,_that.tags,_that.teamMembers,_that.operatingHours,_that.branches,_that.languages,_that.amenities,_that.reservationContacts,_that.location,_that.mainBranch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? title,  String? year,  String? bio,  int? likesCount,  String? logoUrl,  String? coverUrl,  List<String> tags,  List<TeamMemberEntity> teamMembers,  List<OperatingHoursEntity> operatingHours,  List<BranchEntity> branches,  List<LanguageEntity> languages,  List<AmenityEntity> amenities,  List<ReservationContactEntity> reservationContacts,  LocationEntity? location,  MainBranchEntity? mainBranch)  $default,) {final _that = this;
switch (_that) {
case _FacilityProfileEntity():
return $default(_that.id,_that.name,_that.title,_that.year,_that.bio,_that.likesCount,_that.logoUrl,_that.coverUrl,_that.tags,_that.teamMembers,_that.operatingHours,_that.branches,_that.languages,_that.amenities,_that.reservationContacts,_that.location,_that.mainBranch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? title,  String? year,  String? bio,  int? likesCount,  String? logoUrl,  String? coverUrl,  List<String> tags,  List<TeamMemberEntity> teamMembers,  List<OperatingHoursEntity> operatingHours,  List<BranchEntity> branches,  List<LanguageEntity> languages,  List<AmenityEntity> amenities,  List<ReservationContactEntity> reservationContacts,  LocationEntity? location,  MainBranchEntity? mainBranch)?  $default,) {final _that = this;
switch (_that) {
case _FacilityProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.title,_that.year,_that.bio,_that.likesCount,_that.logoUrl,_that.coverUrl,_that.tags,_that.teamMembers,_that.operatingHours,_that.branches,_that.languages,_that.amenities,_that.reservationContacts,_that.location,_that.mainBranch);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityProfileEntity implements FacilityProfileEntity {
  const _FacilityProfileEntity({required this.id, required this.name, this.title, this.year, this.bio, this.likesCount, this.logoUrl, this.coverUrl, final  List<String> tags = const <String>[], final  List<TeamMemberEntity> teamMembers = const <TeamMemberEntity>[], final  List<OperatingHoursEntity> operatingHours = const <OperatingHoursEntity>[], final  List<BranchEntity> branches = const <BranchEntity>[], final  List<LanguageEntity> languages = const <LanguageEntity>[], final  List<AmenityEntity> amenities = const <AmenityEntity>[], final  List<ReservationContactEntity> reservationContacts = const <ReservationContactEntity>[], this.location, this.mainBranch}): _tags = tags,_teamMembers = teamMembers,_operatingHours = operatingHours,_branches = branches,_languages = languages,_amenities = amenities,_reservationContacts = reservationContacts;
  

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

 final  List<TeamMemberEntity> _teamMembers;
@override@JsonKey() List<TeamMemberEntity> get teamMembers {
  if (_teamMembers is EqualUnmodifiableListView) return _teamMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teamMembers);
}

 final  List<OperatingHoursEntity> _operatingHours;
@override@JsonKey() List<OperatingHoursEntity> get operatingHours {
  if (_operatingHours is EqualUnmodifiableListView) return _operatingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operatingHours);
}

 final  List<BranchEntity> _branches;
@override@JsonKey() List<BranchEntity> get branches {
  if (_branches is EqualUnmodifiableListView) return _branches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_branches);
}

 final  List<LanguageEntity> _languages;
@override@JsonKey() List<LanguageEntity> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

 final  List<AmenityEntity> _amenities;
@override@JsonKey() List<AmenityEntity> get amenities {
  if (_amenities is EqualUnmodifiableListView) return _amenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amenities);
}

 final  List<ReservationContactEntity> _reservationContacts;
@override@JsonKey() List<ReservationContactEntity> get reservationContacts {
  if (_reservationContacts is EqualUnmodifiableListView) return _reservationContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reservationContacts);
}

@override final  LocationEntity? location;
@override final  MainBranchEntity? mainBranch;

/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityProfileEntityCopyWith<_FacilityProfileEntity> get copyWith => __$FacilityProfileEntityCopyWithImpl<_FacilityProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._teamMembers, _teamMembers)&&const DeepCollectionEquality().equals(other._operatingHours, _operatingHours)&&const DeepCollectionEquality().equals(other._branches, _branches)&&const DeepCollectionEquality().equals(other._languages, _languages)&&const DeepCollectionEquality().equals(other._amenities, _amenities)&&const DeepCollectionEquality().equals(other._reservationContacts, _reservationContacts)&&(identical(other.location, location) || other.location == location)&&(identical(other.mainBranch, mainBranch) || other.mainBranch == mainBranch));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,title,year,bio,likesCount,logoUrl,coverUrl,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_teamMembers),const DeepCollectionEquality().hash(_operatingHours),const DeepCollectionEquality().hash(_branches),const DeepCollectionEquality().hash(_languages),const DeepCollectionEquality().hash(_amenities),const DeepCollectionEquality().hash(_reservationContacts),location,mainBranch);

@override
String toString() {
  return 'FacilityProfileEntity(id: $id, name: $name, title: $title, year: $year, bio: $bio, likesCount: $likesCount, logoUrl: $logoUrl, coverUrl: $coverUrl, tags: $tags, teamMembers: $teamMembers, operatingHours: $operatingHours, branches: $branches, languages: $languages, amenities: $amenities, reservationContacts: $reservationContacts, location: $location, mainBranch: $mainBranch)';
}


}

/// @nodoc
abstract mixin class _$FacilityProfileEntityCopyWith<$Res> implements $FacilityProfileEntityCopyWith<$Res> {
  factory _$FacilityProfileEntityCopyWith(_FacilityProfileEntity value, $Res Function(_FacilityProfileEntity) _then) = __$FacilityProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? title, String? year, String? bio, int? likesCount, String? logoUrl, String? coverUrl, List<String> tags, List<TeamMemberEntity> teamMembers, List<OperatingHoursEntity> operatingHours, List<BranchEntity> branches, List<LanguageEntity> languages, List<AmenityEntity> amenities, List<ReservationContactEntity> reservationContacts, LocationEntity? location, MainBranchEntity? mainBranch
});


@override $LocationEntityCopyWith<$Res>? get location;@override $MainBranchEntityCopyWith<$Res>? get mainBranch;

}
/// @nodoc
class __$FacilityProfileEntityCopyWithImpl<$Res>
    implements _$FacilityProfileEntityCopyWith<$Res> {
  __$FacilityProfileEntityCopyWithImpl(this._self, this._then);

  final _FacilityProfileEntity _self;
  final $Res Function(_FacilityProfileEntity) _then;

/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? title = freezed,Object? year = freezed,Object? bio = freezed,Object? likesCount = freezed,Object? logoUrl = freezed,Object? coverUrl = freezed,Object? tags = null,Object? teamMembers = null,Object? operatingHours = null,Object? branches = null,Object? languages = null,Object? amenities = null,Object? reservationContacts = null,Object? location = freezed,Object? mainBranch = freezed,}) {
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
as List<String>,teamMembers: null == teamMembers ? _self._teamMembers : teamMembers // ignore: cast_nullable_to_non_nullable
as List<TeamMemberEntity>,operatingHours: null == operatingHours ? _self._operatingHours : operatingHours // ignore: cast_nullable_to_non_nullable
as List<OperatingHoursEntity>,branches: null == branches ? _self._branches : branches // ignore: cast_nullable_to_non_nullable
as List<BranchEntity>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<LanguageEntity>,amenities: null == amenities ? _self._amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<AmenityEntity>,reservationContacts: null == reservationContacts ? _self._reservationContacts : reservationContacts // ignore: cast_nullable_to_non_nullable
as List<ReservationContactEntity>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationEntity?,mainBranch: freezed == mainBranch ? _self.mainBranch : mainBranch // ignore: cast_nullable_to_non_nullable
as MainBranchEntity?,
  ));
}

/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationEntityCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationEntityCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of FacilityProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainBranchEntityCopyWith<$Res>? get mainBranch {
    if (_self.mainBranch == null) {
    return null;
  }

  return $MainBranchEntityCopyWith<$Res>(_self.mainBranch!, (value) {
    return _then(_self.copyWith(mainBranch: value));
  });
}
}

// dart format on
