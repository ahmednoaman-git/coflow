// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEntity {

 int get id; String get name; String get email; String get phone; String? get birthdate; Gender get gender; String? get nationality; String? get image; int get totalLikes; int get totalTickets; int get totalPromotions;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.image, image) || other.image == image)&&(identical(other.totalLikes, totalLikes) || other.totalLikes == totalLikes)&&(identical(other.totalTickets, totalTickets) || other.totalTickets == totalTickets)&&(identical(other.totalPromotions, totalPromotions) || other.totalPromotions == totalPromotions));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,birthdate,gender,nationality,image,totalLikes,totalTickets,totalPromotions);

@override
String toString() {
  return 'UserEntity(id: $id, name: $name, email: $email, phone: $phone, birthdate: $birthdate, gender: $gender, nationality: $nationality, image: $image, totalLikes: $totalLikes, totalTickets: $totalTickets, totalPromotions: $totalPromotions)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email, String phone, String? birthdate, Gender gender, String? nationality, String? image, int totalLikes, int totalTickets, int totalPromotions
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? birthdate = freezed,Object? gender = null,Object? nationality = freezed,Object? image = freezed,Object? totalLikes = null,Object? totalTickets = null,Object? totalPromotions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,totalLikes: null == totalLikes ? _self.totalLikes : totalLikes // ignore: cast_nullable_to_non_nullable
as int,totalTickets: null == totalTickets ? _self.totalTickets : totalTickets // ignore: cast_nullable_to_non_nullable
as int,totalPromotions: null == totalPromotions ? _self.totalPromotions : totalPromotions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String email,  String phone,  String? birthdate,  Gender gender,  String? nationality,  String? image,  int totalLikes,  int totalTickets,  int totalPromotions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.birthdate,_that.gender,_that.nationality,_that.image,_that.totalLikes,_that.totalTickets,_that.totalPromotions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String email,  String phone,  String? birthdate,  Gender gender,  String? nationality,  String? image,  int totalLikes,  int totalTickets,  int totalPromotions)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.birthdate,_that.gender,_that.nationality,_that.image,_that.totalLikes,_that.totalTickets,_that.totalPromotions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String email,  String phone,  String? birthdate,  Gender gender,  String? nationality,  String? image,  int totalLikes,  int totalTickets,  int totalPromotions)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.birthdate,_that.gender,_that.nationality,_that.image,_that.totalLikes,_that.totalTickets,_that.totalPromotions);case _:
  return null;

}
}

}

/// @nodoc


class _UserEntity implements UserEntity {
  const _UserEntity({required this.id, required this.name, required this.email, required this.phone, required this.birthdate, required this.gender, required this.nationality, required this.image, required this.totalLikes, required this.totalTickets, required this.totalPromotions});
  

@override final  int id;
@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String? birthdate;
@override final  Gender gender;
@override final  String? nationality;
@override final  String? image;
@override final  int totalLikes;
@override final  int totalTickets;
@override final  int totalPromotions;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.image, image) || other.image == image)&&(identical(other.totalLikes, totalLikes) || other.totalLikes == totalLikes)&&(identical(other.totalTickets, totalTickets) || other.totalTickets == totalTickets)&&(identical(other.totalPromotions, totalPromotions) || other.totalPromotions == totalPromotions));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,birthdate,gender,nationality,image,totalLikes,totalTickets,totalPromotions);

@override
String toString() {
  return 'UserEntity(id: $id, name: $name, email: $email, phone: $phone, birthdate: $birthdate, gender: $gender, nationality: $nationality, image: $image, totalLikes: $totalLikes, totalTickets: $totalTickets, totalPromotions: $totalPromotions)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email, String phone, String? birthdate, Gender gender, String? nationality, String? image, int totalLikes, int totalTickets, int totalPromotions
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? birthdate = freezed,Object? gender = null,Object? nationality = freezed,Object? image = freezed,Object? totalLikes = null,Object? totalTickets = null,Object? totalPromotions = null,}) {
  return _then(_UserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,birthdate: freezed == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,totalLikes: null == totalLikes ? _self.totalLikes : totalLikes // ignore: cast_nullable_to_non_nullable
as int,totalTickets: null == totalTickets ? _self.totalTickets : totalTickets // ignore: cast_nullable_to_non_nullable
as int,totalPromotions: null == totalPromotions ? _self.totalPromotions : totalPromotions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
