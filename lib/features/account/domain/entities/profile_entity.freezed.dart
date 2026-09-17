// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEntity {

 UserEntity get user;
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<ProfileEntity> get copyWith => _$ProfileEntityCopyWithImpl<ProfileEntity>(this as ProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEntity&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileEntity(user: $user)';
}


}

/// @nodoc
abstract mixin class $ProfileEntityCopyWith<$Res>  {
  factory $ProfileEntityCopyWith(ProfileEntity value, $Res Function(ProfileEntity) _then) = _$ProfileEntityCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});


$UserEntityCopyWith<$Res> get user;

}
/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._self, this._then);

  final ProfileEntity _self;
  final $Res Function(ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileEntity].
extension ProfileEntityPatterns on ProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserEntity user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserEntity user)  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity():
return $default(_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserEntity user)?  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileEntity implements ProfileEntity {
  const _ProfileEntity({required this.user});
  

@override final  UserEntity user;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileEntityCopyWith<_ProfileEntity> get copyWith => __$ProfileEntityCopyWithImpl<_ProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileEntity&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileEntity(user: $user)';
}


}

/// @nodoc
abstract mixin class _$ProfileEntityCopyWith<$Res> implements $ProfileEntityCopyWith<$Res> {
  factory _$ProfileEntityCopyWith(_ProfileEntity value, $Res Function(_ProfileEntity) _then) = __$ProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 UserEntity user
});


@override $UserEntityCopyWith<$Res> get user;

}
/// @nodoc
class __$ProfileEntityCopyWithImpl<$Res>
    implements _$ProfileEntityCopyWith<$Res> {
  __$ProfileEntityCopyWithImpl(this._self, this._then);

  final _ProfileEntity _self;
  final $Res Function(_ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_ProfileEntity(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc
mixin _$ProfileStatsEntity {

 int get calendarEntries; int get businesses; int get purchases; int get gifts;
/// Create a copy of ProfileStatsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStatsEntityCopyWith<ProfileStatsEntity> get copyWith => _$ProfileStatsEntityCopyWithImpl<ProfileStatsEntity>(this as ProfileStatsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileStatsEntity&&(identical(other.calendarEntries, calendarEntries) || other.calendarEntries == calendarEntries)&&(identical(other.businesses, businesses) || other.businesses == businesses)&&(identical(other.purchases, purchases) || other.purchases == purchases)&&(identical(other.gifts, gifts) || other.gifts == gifts));
}


@override
int get hashCode => Object.hash(runtimeType,calendarEntries,businesses,purchases,gifts);

@override
String toString() {
  return 'ProfileStatsEntity(calendarEntries: $calendarEntries, businesses: $businesses, purchases: $purchases, gifts: $gifts)';
}


}

/// @nodoc
abstract mixin class $ProfileStatsEntityCopyWith<$Res>  {
  factory $ProfileStatsEntityCopyWith(ProfileStatsEntity value, $Res Function(ProfileStatsEntity) _then) = _$ProfileStatsEntityCopyWithImpl;
@useResult
$Res call({
 int calendarEntries, int businesses, int purchases, int gifts
});




}
/// @nodoc
class _$ProfileStatsEntityCopyWithImpl<$Res>
    implements $ProfileStatsEntityCopyWith<$Res> {
  _$ProfileStatsEntityCopyWithImpl(this._self, this._then);

  final ProfileStatsEntity _self;
  final $Res Function(ProfileStatsEntity) _then;

/// Create a copy of ProfileStatsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calendarEntries = null,Object? businesses = null,Object? purchases = null,Object? gifts = null,}) {
  return _then(_self.copyWith(
calendarEntries: null == calendarEntries ? _self.calendarEntries : calendarEntries // ignore: cast_nullable_to_non_nullable
as int,businesses: null == businesses ? _self.businesses : businesses // ignore: cast_nullable_to_non_nullable
as int,purchases: null == purchases ? _self.purchases : purchases // ignore: cast_nullable_to_non_nullable
as int,gifts: null == gifts ? _self.gifts : gifts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileStatsEntity].
extension ProfileStatsEntityPatterns on ProfileStatsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileStatsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileStatsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileStatsEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProfileStatsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileStatsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileStatsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int calendarEntries,  int businesses,  int purchases,  int gifts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileStatsEntity() when $default != null:
return $default(_that.calendarEntries,_that.businesses,_that.purchases,_that.gifts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int calendarEntries,  int businesses,  int purchases,  int gifts)  $default,) {final _that = this;
switch (_that) {
case _ProfileStatsEntity():
return $default(_that.calendarEntries,_that.businesses,_that.purchases,_that.gifts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int calendarEntries,  int businesses,  int purchases,  int gifts)?  $default,) {final _that = this;
switch (_that) {
case _ProfileStatsEntity() when $default != null:
return $default(_that.calendarEntries,_that.businesses,_that.purchases,_that.gifts);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileStatsEntity implements ProfileStatsEntity {
  const _ProfileStatsEntity({required this.calendarEntries, required this.businesses, required this.purchases, required this.gifts});
  

@override final  int calendarEntries;
@override final  int businesses;
@override final  int purchases;
@override final  int gifts;

/// Create a copy of ProfileStatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStatsEntityCopyWith<_ProfileStatsEntity> get copyWith => __$ProfileStatsEntityCopyWithImpl<_ProfileStatsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileStatsEntity&&(identical(other.calendarEntries, calendarEntries) || other.calendarEntries == calendarEntries)&&(identical(other.businesses, businesses) || other.businesses == businesses)&&(identical(other.purchases, purchases) || other.purchases == purchases)&&(identical(other.gifts, gifts) || other.gifts == gifts));
}


@override
int get hashCode => Object.hash(runtimeType,calendarEntries,businesses,purchases,gifts);

@override
String toString() {
  return 'ProfileStatsEntity(calendarEntries: $calendarEntries, businesses: $businesses, purchases: $purchases, gifts: $gifts)';
}


}

/// @nodoc
abstract mixin class _$ProfileStatsEntityCopyWith<$Res> implements $ProfileStatsEntityCopyWith<$Res> {
  factory _$ProfileStatsEntityCopyWith(_ProfileStatsEntity value, $Res Function(_ProfileStatsEntity) _then) = __$ProfileStatsEntityCopyWithImpl;
@override @useResult
$Res call({
 int calendarEntries, int businesses, int purchases, int gifts
});




}
/// @nodoc
class __$ProfileStatsEntityCopyWithImpl<$Res>
    implements _$ProfileStatsEntityCopyWith<$Res> {
  __$ProfileStatsEntityCopyWithImpl(this._self, this._then);

  final _ProfileStatsEntity _self;
  final $Res Function(_ProfileStatsEntity) _then;

/// Create a copy of ProfileStatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calendarEntries = null,Object? businesses = null,Object? purchases = null,Object? gifts = null,}) {
  return _then(_ProfileStatsEntity(
calendarEntries: null == calendarEntries ? _self.calendarEntries : calendarEntries // ignore: cast_nullable_to_non_nullable
as int,businesses: null == businesses ? _self.businesses : businesses // ignore: cast_nullable_to_non_nullable
as int,purchases: null == purchases ? _self.purchases : purchases // ignore: cast_nullable_to_non_nullable
as int,gifts: null == gifts ? _self.gifts : gifts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
