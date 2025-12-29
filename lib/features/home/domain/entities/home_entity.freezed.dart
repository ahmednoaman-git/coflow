// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEntity {

 List<ProfileEntity> get profiles; List<ProfileEntity> get recentlyJoined; List<InstructorEntity> get instructors;
/// Create a copy of HomeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEntityCopyWith<HomeEntity> get copyWith => _$HomeEntityCopyWithImpl<HomeEntity>(this as HomeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEntity&&const DeepCollectionEquality().equals(other.profiles, profiles)&&const DeepCollectionEquality().equals(other.recentlyJoined, recentlyJoined)&&const DeepCollectionEquality().equals(other.instructors, instructors));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(profiles),const DeepCollectionEquality().hash(recentlyJoined),const DeepCollectionEquality().hash(instructors));

@override
String toString() {
  return 'HomeEntity(profiles: $profiles, recentlyJoined: $recentlyJoined, instructors: $instructors)';
}


}

/// @nodoc
abstract mixin class $HomeEntityCopyWith<$Res>  {
  factory $HomeEntityCopyWith(HomeEntity value, $Res Function(HomeEntity) _then) = _$HomeEntityCopyWithImpl;
@useResult
$Res call({
 List<ProfileEntity> profiles, List<ProfileEntity> recentlyJoined, List<InstructorEntity> instructors
});




}
/// @nodoc
class _$HomeEntityCopyWithImpl<$Res>
    implements $HomeEntityCopyWith<$Res> {
  _$HomeEntityCopyWithImpl(this._self, this._then);

  final HomeEntity _self;
  final $Res Function(HomeEntity) _then;

/// Create a copy of HomeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profiles = null,Object? recentlyJoined = null,Object? instructors = null,}) {
  return _then(_self.copyWith(
profiles: null == profiles ? _self.profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<ProfileEntity>,recentlyJoined: null == recentlyJoined ? _self.recentlyJoined : recentlyJoined // ignore: cast_nullable_to_non_nullable
as List<ProfileEntity>,instructors: null == instructors ? _self.instructors : instructors // ignore: cast_nullable_to_non_nullable
as List<InstructorEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeEntity].
extension HomeEntityPatterns on HomeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeEntity value)  $default,){
final _that = this;
switch (_that) {
case _HomeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HomeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProfileEntity> profiles,  List<ProfileEntity> recentlyJoined,  List<InstructorEntity> instructors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeEntity() when $default != null:
return $default(_that.profiles,_that.recentlyJoined,_that.instructors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProfileEntity> profiles,  List<ProfileEntity> recentlyJoined,  List<InstructorEntity> instructors)  $default,) {final _that = this;
switch (_that) {
case _HomeEntity():
return $default(_that.profiles,_that.recentlyJoined,_that.instructors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProfileEntity> profiles,  List<ProfileEntity> recentlyJoined,  List<InstructorEntity> instructors)?  $default,) {final _that = this;
switch (_that) {
case _HomeEntity() when $default != null:
return $default(_that.profiles,_that.recentlyJoined,_that.instructors);case _:
  return null;

}
}

}

/// @nodoc


class _HomeEntity implements HomeEntity {
  const _HomeEntity({required final  List<ProfileEntity> profiles, required final  List<ProfileEntity> recentlyJoined, required final  List<InstructorEntity> instructors}): _profiles = profiles,_recentlyJoined = recentlyJoined,_instructors = instructors;
  

 final  List<ProfileEntity> _profiles;
@override List<ProfileEntity> get profiles {
  if (_profiles is EqualUnmodifiableListView) return _profiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profiles);
}

 final  List<ProfileEntity> _recentlyJoined;
@override List<ProfileEntity> get recentlyJoined {
  if (_recentlyJoined is EqualUnmodifiableListView) return _recentlyJoined;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentlyJoined);
}

 final  List<InstructorEntity> _instructors;
@override List<InstructorEntity> get instructors {
  if (_instructors is EqualUnmodifiableListView) return _instructors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructors);
}


/// Create a copy of HomeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeEntityCopyWith<_HomeEntity> get copyWith => __$HomeEntityCopyWithImpl<_HomeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeEntity&&const DeepCollectionEquality().equals(other._profiles, _profiles)&&const DeepCollectionEquality().equals(other._recentlyJoined, _recentlyJoined)&&const DeepCollectionEquality().equals(other._instructors, _instructors));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_profiles),const DeepCollectionEquality().hash(_recentlyJoined),const DeepCollectionEquality().hash(_instructors));

@override
String toString() {
  return 'HomeEntity(profiles: $profiles, recentlyJoined: $recentlyJoined, instructors: $instructors)';
}


}

/// @nodoc
abstract mixin class _$HomeEntityCopyWith<$Res> implements $HomeEntityCopyWith<$Res> {
  factory _$HomeEntityCopyWith(_HomeEntity value, $Res Function(_HomeEntity) _then) = __$HomeEntityCopyWithImpl;
@override @useResult
$Res call({
 List<ProfileEntity> profiles, List<ProfileEntity> recentlyJoined, List<InstructorEntity> instructors
});




}
/// @nodoc
class __$HomeEntityCopyWithImpl<$Res>
    implements _$HomeEntityCopyWith<$Res> {
  __$HomeEntityCopyWithImpl(this._self, this._then);

  final _HomeEntity _self;
  final $Res Function(_HomeEntity) _then;

/// Create a copy of HomeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profiles = null,Object? recentlyJoined = null,Object? instructors = null,}) {
  return _then(_HomeEntity(
profiles: null == profiles ? _self._profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<ProfileEntity>,recentlyJoined: null == recentlyJoined ? _self._recentlyJoined : recentlyJoined // ignore: cast_nullable_to_non_nullable
as List<ProfileEntity>,instructors: null == instructors ? _self._instructors : instructors // ignore: cast_nullable_to_non_nullable
as List<InstructorEntity>,
  ));
}


}

// dart format on
