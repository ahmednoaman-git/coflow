// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_session_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionAttendeeEntity {

/// 1-based position in the list — the queue order for a waitlist.
 int get position; String get displayName;/// The signed-in customer's own entry, rendered in bold.
 bool get isCurrentUser;
/// Create a copy of SessionAttendeeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionAttendeeEntityCopyWith<SessionAttendeeEntity> get copyWith => _$SessionAttendeeEntityCopyWithImpl<SessionAttendeeEntity>(this as SessionAttendeeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionAttendeeEntity&&(identical(other.position, position) || other.position == position)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.isCurrentUser, isCurrentUser) || other.isCurrentUser == isCurrentUser));
}


@override
int get hashCode => Object.hash(runtimeType,position,displayName,isCurrentUser);

@override
String toString() {
  return 'SessionAttendeeEntity(position: $position, displayName: $displayName, isCurrentUser: $isCurrentUser)';
}


}

/// @nodoc
abstract mixin class $SessionAttendeeEntityCopyWith<$Res>  {
  factory $SessionAttendeeEntityCopyWith(SessionAttendeeEntity value, $Res Function(SessionAttendeeEntity) _then) = _$SessionAttendeeEntityCopyWithImpl;
@useResult
$Res call({
 int position, String displayName, bool isCurrentUser
});




}
/// @nodoc
class _$SessionAttendeeEntityCopyWithImpl<$Res>
    implements $SessionAttendeeEntityCopyWith<$Res> {
  _$SessionAttendeeEntityCopyWithImpl(this._self, this._then);

  final SessionAttendeeEntity _self;
  final $Res Function(SessionAttendeeEntity) _then;

/// Create a copy of SessionAttendeeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? displayName = null,Object? isCurrentUser = null,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,isCurrentUser: null == isCurrentUser ? _self.isCurrentUser : isCurrentUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionAttendeeEntity].
extension SessionAttendeeEntityPatterns on SessionAttendeeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionAttendeeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionAttendeeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionAttendeeEntity value)  $default,){
final _that = this;
switch (_that) {
case _SessionAttendeeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionAttendeeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SessionAttendeeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int position,  String displayName,  bool isCurrentUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionAttendeeEntity() when $default != null:
return $default(_that.position,_that.displayName,_that.isCurrentUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int position,  String displayName,  bool isCurrentUser)  $default,) {final _that = this;
switch (_that) {
case _SessionAttendeeEntity():
return $default(_that.position,_that.displayName,_that.isCurrentUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int position,  String displayName,  bool isCurrentUser)?  $default,) {final _that = this;
switch (_that) {
case _SessionAttendeeEntity() when $default != null:
return $default(_that.position,_that.displayName,_that.isCurrentUser);case _:
  return null;

}
}

}

/// @nodoc


class _SessionAttendeeEntity implements SessionAttendeeEntity {
  const _SessionAttendeeEntity({required this.position, required this.displayName, this.isCurrentUser = false});
  

/// 1-based position in the list — the queue order for a waitlist.
@override final  int position;
@override final  String displayName;
/// The signed-in customer's own entry, rendered in bold.
@override@JsonKey() final  bool isCurrentUser;

/// Create a copy of SessionAttendeeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionAttendeeEntityCopyWith<_SessionAttendeeEntity> get copyWith => __$SessionAttendeeEntityCopyWithImpl<_SessionAttendeeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionAttendeeEntity&&(identical(other.position, position) || other.position == position)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.isCurrentUser, isCurrentUser) || other.isCurrentUser == isCurrentUser));
}


@override
int get hashCode => Object.hash(runtimeType,position,displayName,isCurrentUser);

@override
String toString() {
  return 'SessionAttendeeEntity(position: $position, displayName: $displayName, isCurrentUser: $isCurrentUser)';
}


}

/// @nodoc
abstract mixin class _$SessionAttendeeEntityCopyWith<$Res> implements $SessionAttendeeEntityCopyWith<$Res> {
  factory _$SessionAttendeeEntityCopyWith(_SessionAttendeeEntity value, $Res Function(_SessionAttendeeEntity) _then) = __$SessionAttendeeEntityCopyWithImpl;
@override @useResult
$Res call({
 int position, String displayName, bool isCurrentUser
});




}
/// @nodoc
class __$SessionAttendeeEntityCopyWithImpl<$Res>
    implements _$SessionAttendeeEntityCopyWith<$Res> {
  __$SessionAttendeeEntityCopyWithImpl(this._self, this._then);

  final _SessionAttendeeEntity _self;
  final $Res Function(_SessionAttendeeEntity) _then;

/// Create a copy of SessionAttendeeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? displayName = null,Object? isCurrentUser = null,}) {
  return _then(_SessionAttendeeEntity(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,isCurrentUser: null == isCurrentUser ? _self.isCurrentUser : isCurrentUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SessionLocationEntity {

 String get address; bool get isFacilityLocation; String? get mapUrl;
/// Create a copy of SessionLocationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionLocationEntityCopyWith<SessionLocationEntity> get copyWith => _$SessionLocationEntityCopyWithImpl<SessionLocationEntity>(this as SessionLocationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionLocationEntity&&(identical(other.address, address) || other.address == address)&&(identical(other.isFacilityLocation, isFacilityLocation) || other.isFacilityLocation == isFacilityLocation)&&(identical(other.mapUrl, mapUrl) || other.mapUrl == mapUrl));
}


@override
int get hashCode => Object.hash(runtimeType,address,isFacilityLocation,mapUrl);

@override
String toString() {
  return 'SessionLocationEntity(address: $address, isFacilityLocation: $isFacilityLocation, mapUrl: $mapUrl)';
}


}

/// @nodoc
abstract mixin class $SessionLocationEntityCopyWith<$Res>  {
  factory $SessionLocationEntityCopyWith(SessionLocationEntity value, $Res Function(SessionLocationEntity) _then) = _$SessionLocationEntityCopyWithImpl;
@useResult
$Res call({
 String address, bool isFacilityLocation, String? mapUrl
});




}
/// @nodoc
class _$SessionLocationEntityCopyWithImpl<$Res>
    implements $SessionLocationEntityCopyWith<$Res> {
  _$SessionLocationEntityCopyWithImpl(this._self, this._then);

  final SessionLocationEntity _self;
  final $Res Function(SessionLocationEntity) _then;

/// Create a copy of SessionLocationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? isFacilityLocation = null,Object? mapUrl = freezed,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,isFacilityLocation: null == isFacilityLocation ? _self.isFacilityLocation : isFacilityLocation // ignore: cast_nullable_to_non_nullable
as bool,mapUrl: freezed == mapUrl ? _self.mapUrl : mapUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionLocationEntity].
extension SessionLocationEntityPatterns on SessionLocationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionLocationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionLocationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionLocationEntity value)  $default,){
final _that = this;
switch (_that) {
case _SessionLocationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionLocationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SessionLocationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  bool isFacilityLocation,  String? mapUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionLocationEntity() when $default != null:
return $default(_that.address,_that.isFacilityLocation,_that.mapUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  bool isFacilityLocation,  String? mapUrl)  $default,) {final _that = this;
switch (_that) {
case _SessionLocationEntity():
return $default(_that.address,_that.isFacilityLocation,_that.mapUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  bool isFacilityLocation,  String? mapUrl)?  $default,) {final _that = this;
switch (_that) {
case _SessionLocationEntity() when $default != null:
return $default(_that.address,_that.isFacilityLocation,_that.mapUrl);case _:
  return null;

}
}

}

/// @nodoc


class _SessionLocationEntity implements SessionLocationEntity {
  const _SessionLocationEntity({required this.address, this.isFacilityLocation = true, this.mapUrl});
  

@override final  String address;
@override@JsonKey() final  bool isFacilityLocation;
@override final  String? mapUrl;

/// Create a copy of SessionLocationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionLocationEntityCopyWith<_SessionLocationEntity> get copyWith => __$SessionLocationEntityCopyWithImpl<_SessionLocationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionLocationEntity&&(identical(other.address, address) || other.address == address)&&(identical(other.isFacilityLocation, isFacilityLocation) || other.isFacilityLocation == isFacilityLocation)&&(identical(other.mapUrl, mapUrl) || other.mapUrl == mapUrl));
}


@override
int get hashCode => Object.hash(runtimeType,address,isFacilityLocation,mapUrl);

@override
String toString() {
  return 'SessionLocationEntity(address: $address, isFacilityLocation: $isFacilityLocation, mapUrl: $mapUrl)';
}


}

/// @nodoc
abstract mixin class _$SessionLocationEntityCopyWith<$Res> implements $SessionLocationEntityCopyWith<$Res> {
  factory _$SessionLocationEntityCopyWith(_SessionLocationEntity value, $Res Function(_SessionLocationEntity) _then) = __$SessionLocationEntityCopyWithImpl;
@override @useResult
$Res call({
 String address, bool isFacilityLocation, String? mapUrl
});




}
/// @nodoc
class __$SessionLocationEntityCopyWithImpl<$Res>
    implements _$SessionLocationEntityCopyWith<$Res> {
  __$SessionLocationEntityCopyWithImpl(this._self, this._then);

  final _SessionLocationEntity _self;
  final $Res Function(_SessionLocationEntity) _then;

/// Create a copy of SessionLocationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? isFacilityLocation = null,Object? mapUrl = freezed,}) {
  return _then(_SessionLocationEntity(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,isFacilityLocation: null == isFacilityLocation ? _self.isFacilityLocation : isFacilityLocation // ignore: cast_nullable_to_non_nullable
as bool,mapUrl: freezed == mapUrl ? _self.mapUrl : mapUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$SessionReservationTicketEntity {

 String get name;/// Remaining uses on this purchase.
 int get quantity;/// Payment is still outstanding on the purchase.
 bool get isDue; DateTime? get purchasedAt; int? get validForDays; int get addOnsCount;
/// Create a copy of SessionReservationTicketEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionReservationTicketEntityCopyWith<SessionReservationTicketEntity> get copyWith => _$SessionReservationTicketEntityCopyWithImpl<SessionReservationTicketEntity>(this as SessionReservationTicketEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionReservationTicketEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isDue, isDue) || other.isDue == isDue)&&(identical(other.purchasedAt, purchasedAt) || other.purchasedAt == purchasedAt)&&(identical(other.validForDays, validForDays) || other.validForDays == validForDays)&&(identical(other.addOnsCount, addOnsCount) || other.addOnsCount == addOnsCount));
}


@override
int get hashCode => Object.hash(runtimeType,name,quantity,isDue,purchasedAt,validForDays,addOnsCount);

@override
String toString() {
  return 'SessionReservationTicketEntity(name: $name, quantity: $quantity, isDue: $isDue, purchasedAt: $purchasedAt, validForDays: $validForDays, addOnsCount: $addOnsCount)';
}


}

/// @nodoc
abstract mixin class $SessionReservationTicketEntityCopyWith<$Res>  {
  factory $SessionReservationTicketEntityCopyWith(SessionReservationTicketEntity value, $Res Function(SessionReservationTicketEntity) _then) = _$SessionReservationTicketEntityCopyWithImpl;
@useResult
$Res call({
 String name, int quantity, bool isDue, DateTime? purchasedAt, int? validForDays, int addOnsCount
});




}
/// @nodoc
class _$SessionReservationTicketEntityCopyWithImpl<$Res>
    implements $SessionReservationTicketEntityCopyWith<$Res> {
  _$SessionReservationTicketEntityCopyWithImpl(this._self, this._then);

  final SessionReservationTicketEntity _self;
  final $Res Function(SessionReservationTicketEntity) _then;

/// Create a copy of SessionReservationTicketEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? quantity = null,Object? isDue = null,Object? purchasedAt = freezed,Object? validForDays = freezed,Object? addOnsCount = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,isDue: null == isDue ? _self.isDue : isDue // ignore: cast_nullable_to_non_nullable
as bool,purchasedAt: freezed == purchasedAt ? _self.purchasedAt : purchasedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,validForDays: freezed == validForDays ? _self.validForDays : validForDays // ignore: cast_nullable_to_non_nullable
as int?,addOnsCount: null == addOnsCount ? _self.addOnsCount : addOnsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionReservationTicketEntity].
extension SessionReservationTicketEntityPatterns on SessionReservationTicketEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionReservationTicketEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionReservationTicketEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionReservationTicketEntity value)  $default,){
final _that = this;
switch (_that) {
case _SessionReservationTicketEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionReservationTicketEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SessionReservationTicketEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int quantity,  bool isDue,  DateTime? purchasedAt,  int? validForDays,  int addOnsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionReservationTicketEntity() when $default != null:
return $default(_that.name,_that.quantity,_that.isDue,_that.purchasedAt,_that.validForDays,_that.addOnsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int quantity,  bool isDue,  DateTime? purchasedAt,  int? validForDays,  int addOnsCount)  $default,) {final _that = this;
switch (_that) {
case _SessionReservationTicketEntity():
return $default(_that.name,_that.quantity,_that.isDue,_that.purchasedAt,_that.validForDays,_that.addOnsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int quantity,  bool isDue,  DateTime? purchasedAt,  int? validForDays,  int addOnsCount)?  $default,) {final _that = this;
switch (_that) {
case _SessionReservationTicketEntity() when $default != null:
return $default(_that.name,_that.quantity,_that.isDue,_that.purchasedAt,_that.validForDays,_that.addOnsCount);case _:
  return null;

}
}

}

/// @nodoc


class _SessionReservationTicketEntity implements SessionReservationTicketEntity {
  const _SessionReservationTicketEntity({required this.name, required this.quantity, this.isDue = false, this.purchasedAt, this.validForDays, this.addOnsCount = 0});
  

@override final  String name;
/// Remaining uses on this purchase.
@override final  int quantity;
/// Payment is still outstanding on the purchase.
@override@JsonKey() final  bool isDue;
@override final  DateTime? purchasedAt;
@override final  int? validForDays;
@override@JsonKey() final  int addOnsCount;

/// Create a copy of SessionReservationTicketEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionReservationTicketEntityCopyWith<_SessionReservationTicketEntity> get copyWith => __$SessionReservationTicketEntityCopyWithImpl<_SessionReservationTicketEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionReservationTicketEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isDue, isDue) || other.isDue == isDue)&&(identical(other.purchasedAt, purchasedAt) || other.purchasedAt == purchasedAt)&&(identical(other.validForDays, validForDays) || other.validForDays == validForDays)&&(identical(other.addOnsCount, addOnsCount) || other.addOnsCount == addOnsCount));
}


@override
int get hashCode => Object.hash(runtimeType,name,quantity,isDue,purchasedAt,validForDays,addOnsCount);

@override
String toString() {
  return 'SessionReservationTicketEntity(name: $name, quantity: $quantity, isDue: $isDue, purchasedAt: $purchasedAt, validForDays: $validForDays, addOnsCount: $addOnsCount)';
}


}

/// @nodoc
abstract mixin class _$SessionReservationTicketEntityCopyWith<$Res> implements $SessionReservationTicketEntityCopyWith<$Res> {
  factory _$SessionReservationTicketEntityCopyWith(_SessionReservationTicketEntity value, $Res Function(_SessionReservationTicketEntity) _then) = __$SessionReservationTicketEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, int quantity, bool isDue, DateTime? purchasedAt, int? validForDays, int addOnsCount
});




}
/// @nodoc
class __$SessionReservationTicketEntityCopyWithImpl<$Res>
    implements _$SessionReservationTicketEntityCopyWith<$Res> {
  __$SessionReservationTicketEntityCopyWithImpl(this._self, this._then);

  final _SessionReservationTicketEntity _self;
  final $Res Function(_SessionReservationTicketEntity) _then;

/// Create a copy of SessionReservationTicketEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? quantity = null,Object? isDue = null,Object? purchasedAt = freezed,Object? validForDays = freezed,Object? addOnsCount = null,}) {
  return _then(_SessionReservationTicketEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,isDue: null == isDue ? _self.isDue : isDue // ignore: cast_nullable_to_non_nullable
as bool,purchasedAt: freezed == purchasedAt ? _self.purchasedAt : purchasedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,validForDays: freezed == validForDays ? _self.validForDays : validForDays // ignore: cast_nullable_to_non_nullable
as int?,addOnsCount: null == addOnsCount ? _self.addOnsCount : addOnsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FacilitySessionDetailsEntity {

 int get id; int get serviceId; String get name; DateTime get startsAt; DateTime get endsAt; String get colorHex; FacilityServiceLevel? get level; bool get isLadiesOnly; List<String> get instructorNames; FacilitySessionCapacityEntity get capacity;/// The facility's calendar setting. False hides the names behind an
/// aggregate capacity bar.
 bool get areCustomersVisible;/// Empty while [areCustomersVisible] is false.
 List<SessionAttendeeEntity> get customers;/// Always visible, even when customer reservations are private.
 List<SessionAttendeeEntity> get waitlist; SessionLocationEntity? get location; String? get note;/// Absolute moment after which cancelling (and leaving the waitlist) is no
/// longer allowed. The whole waitlist is dropped when it passes.
 DateTime? get cancellationDeadline;/// Hours-before-start behind [cancellationDeadline], for the policy copy.
 int? get cancellationWindowHours; SessionViewerState get viewerState;/// Remaining ticket uses the customer holds that are valid for this slot.
 int get accessibleTickets;/// The purchase a reservation would draw from. Null when [accessibleTickets]
/// is zero.
 SessionReservationTicketEntity? get reservationTicket; int? get reservationId; bool get isRecurring; bool get canReserve; bool get canJoinWaitlist; bool get canWithdraw;
/// Create a copy of FacilitySessionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilitySessionDetailsEntityCopyWith<FacilitySessionDetailsEntity> get copyWith => _$FacilitySessionDetailsEntityCopyWithImpl<FacilitySessionDetailsEntity>(this as FacilitySessionDetailsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilitySessionDetailsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.level, level) || other.level == level)&&(identical(other.isLadiesOnly, isLadiesOnly) || other.isLadiesOnly == isLadiesOnly)&&const DeepCollectionEquality().equals(other.instructorNames, instructorNames)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.areCustomersVisible, areCustomersVisible) || other.areCustomersVisible == areCustomersVisible)&&const DeepCollectionEquality().equals(other.customers, customers)&&const DeepCollectionEquality().equals(other.waitlist, waitlist)&&(identical(other.location, location) || other.location == location)&&(identical(other.note, note) || other.note == note)&&(identical(other.cancellationDeadline, cancellationDeadline) || other.cancellationDeadline == cancellationDeadline)&&(identical(other.cancellationWindowHours, cancellationWindowHours) || other.cancellationWindowHours == cancellationWindowHours)&&(identical(other.viewerState, viewerState) || other.viewerState == viewerState)&&(identical(other.accessibleTickets, accessibleTickets) || other.accessibleTickets == accessibleTickets)&&(identical(other.reservationTicket, reservationTicket) || other.reservationTicket == reservationTicket)&&(identical(other.reservationId, reservationId) || other.reservationId == reservationId)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.canReserve, canReserve) || other.canReserve == canReserve)&&(identical(other.canJoinWaitlist, canJoinWaitlist) || other.canJoinWaitlist == canJoinWaitlist)&&(identical(other.canWithdraw, canWithdraw) || other.canWithdraw == canWithdraw));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,serviceId,name,startsAt,endsAt,colorHex,level,isLadiesOnly,const DeepCollectionEquality().hash(instructorNames),capacity,areCustomersVisible,const DeepCollectionEquality().hash(customers),const DeepCollectionEquality().hash(waitlist),location,note,cancellationDeadline,cancellationWindowHours,viewerState,accessibleTickets,reservationTicket,reservationId,isRecurring,canReserve,canJoinWaitlist,canWithdraw]);

@override
String toString() {
  return 'FacilitySessionDetailsEntity(id: $id, serviceId: $serviceId, name: $name, startsAt: $startsAt, endsAt: $endsAt, colorHex: $colorHex, level: $level, isLadiesOnly: $isLadiesOnly, instructorNames: $instructorNames, capacity: $capacity, areCustomersVisible: $areCustomersVisible, customers: $customers, waitlist: $waitlist, location: $location, note: $note, cancellationDeadline: $cancellationDeadline, cancellationWindowHours: $cancellationWindowHours, viewerState: $viewerState, accessibleTickets: $accessibleTickets, reservationTicket: $reservationTicket, reservationId: $reservationId, isRecurring: $isRecurring, canReserve: $canReserve, canJoinWaitlist: $canJoinWaitlist, canWithdraw: $canWithdraw)';
}


}

/// @nodoc
abstract mixin class $FacilitySessionDetailsEntityCopyWith<$Res>  {
  factory $FacilitySessionDetailsEntityCopyWith(FacilitySessionDetailsEntity value, $Res Function(FacilitySessionDetailsEntity) _then) = _$FacilitySessionDetailsEntityCopyWithImpl;
@useResult
$Res call({
 int id, int serviceId, String name, DateTime startsAt, DateTime endsAt, String colorHex, FacilityServiceLevel? level, bool isLadiesOnly, List<String> instructorNames, FacilitySessionCapacityEntity capacity, bool areCustomersVisible, List<SessionAttendeeEntity> customers, List<SessionAttendeeEntity> waitlist, SessionLocationEntity? location, String? note, DateTime? cancellationDeadline, int? cancellationWindowHours, SessionViewerState viewerState, int accessibleTickets, SessionReservationTicketEntity? reservationTicket, int? reservationId, bool isRecurring, bool canReserve, bool canJoinWaitlist, bool canWithdraw
});


$FacilityServiceLevelCopyWith<$Res>? get level;$FacilitySessionCapacityEntityCopyWith<$Res> get capacity;$SessionLocationEntityCopyWith<$Res>? get location;$SessionReservationTicketEntityCopyWith<$Res>? get reservationTicket;

}
/// @nodoc
class _$FacilitySessionDetailsEntityCopyWithImpl<$Res>
    implements $FacilitySessionDetailsEntityCopyWith<$Res> {
  _$FacilitySessionDetailsEntityCopyWithImpl(this._self, this._then);

  final FacilitySessionDetailsEntity _self;
  final $Res Function(FacilitySessionDetailsEntity) _then;

/// Create a copy of FacilitySessionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceId = null,Object? name = null,Object? startsAt = null,Object? endsAt = null,Object? colorHex = null,Object? level = freezed,Object? isLadiesOnly = null,Object? instructorNames = null,Object? capacity = null,Object? areCustomersVisible = null,Object? customers = null,Object? waitlist = null,Object? location = freezed,Object? note = freezed,Object? cancellationDeadline = freezed,Object? cancellationWindowHours = freezed,Object? viewerState = null,Object? accessibleTickets = null,Object? reservationTicket = freezed,Object? reservationId = freezed,Object? isRecurring = null,Object? canReserve = null,Object? canJoinWaitlist = null,Object? canWithdraw = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as FacilityServiceLevel?,isLadiesOnly: null == isLadiesOnly ? _self.isLadiesOnly : isLadiesOnly // ignore: cast_nullable_to_non_nullable
as bool,instructorNames: null == instructorNames ? _self.instructorNames : instructorNames // ignore: cast_nullable_to_non_nullable
as List<String>,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as FacilitySessionCapacityEntity,areCustomersVisible: null == areCustomersVisible ? _self.areCustomersVisible : areCustomersVisible // ignore: cast_nullable_to_non_nullable
as bool,customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as List<SessionAttendeeEntity>,waitlist: null == waitlist ? _self.waitlist : waitlist // ignore: cast_nullable_to_non_nullable
as List<SessionAttendeeEntity>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as SessionLocationEntity?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,cancellationDeadline: freezed == cancellationDeadline ? _self.cancellationDeadline : cancellationDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,cancellationWindowHours: freezed == cancellationWindowHours ? _self.cancellationWindowHours : cancellationWindowHours // ignore: cast_nullable_to_non_nullable
as int?,viewerState: null == viewerState ? _self.viewerState : viewerState // ignore: cast_nullable_to_non_nullable
as SessionViewerState,accessibleTickets: null == accessibleTickets ? _self.accessibleTickets : accessibleTickets // ignore: cast_nullable_to_non_nullable
as int,reservationTicket: freezed == reservationTicket ? _self.reservationTicket : reservationTicket // ignore: cast_nullable_to_non_nullable
as SessionReservationTicketEntity?,reservationId: freezed == reservationId ? _self.reservationId : reservationId // ignore: cast_nullable_to_non_nullable
as int?,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,canReserve: null == canReserve ? _self.canReserve : canReserve // ignore: cast_nullable_to_non_nullable
as bool,canJoinWaitlist: null == canJoinWaitlist ? _self.canJoinWaitlist : canJoinWaitlist // ignore: cast_nullable_to_non_nullable
as bool,canWithdraw: null == canWithdraw ? _self.canWithdraw : canWithdraw // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of FacilitySessionDetailsEntity
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
}/// Create a copy of FacilitySessionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilitySessionCapacityEntityCopyWith<$Res> get capacity {
  
  return $FacilitySessionCapacityEntityCopyWith<$Res>(_self.capacity, (value) {
    return _then(_self.copyWith(capacity: value));
  });
}/// Create a copy of FacilitySessionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionLocationEntityCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $SessionLocationEntityCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of FacilitySessionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionReservationTicketEntityCopyWith<$Res>? get reservationTicket {
    if (_self.reservationTicket == null) {
    return null;
  }

  return $SessionReservationTicketEntityCopyWith<$Res>(_self.reservationTicket!, (value) {
    return _then(_self.copyWith(reservationTicket: value));
  });
}
}


/// Adds pattern-matching-related methods to [FacilitySessionDetailsEntity].
extension FacilitySessionDetailsEntityPatterns on FacilitySessionDetailsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilitySessionDetailsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilitySessionDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilitySessionDetailsEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilitySessionDetailsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilitySessionDetailsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilitySessionDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int serviceId,  String name,  DateTime startsAt,  DateTime endsAt,  String colorHex,  FacilityServiceLevel? level,  bool isLadiesOnly,  List<String> instructorNames,  FacilitySessionCapacityEntity capacity,  bool areCustomersVisible,  List<SessionAttendeeEntity> customers,  List<SessionAttendeeEntity> waitlist,  SessionLocationEntity? location,  String? note,  DateTime? cancellationDeadline,  int? cancellationWindowHours,  SessionViewerState viewerState,  int accessibleTickets,  SessionReservationTicketEntity? reservationTicket,  int? reservationId,  bool isRecurring,  bool canReserve,  bool canJoinWaitlist,  bool canWithdraw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilitySessionDetailsEntity() when $default != null:
return $default(_that.id,_that.serviceId,_that.name,_that.startsAt,_that.endsAt,_that.colorHex,_that.level,_that.isLadiesOnly,_that.instructorNames,_that.capacity,_that.areCustomersVisible,_that.customers,_that.waitlist,_that.location,_that.note,_that.cancellationDeadline,_that.cancellationWindowHours,_that.viewerState,_that.accessibleTickets,_that.reservationTicket,_that.reservationId,_that.isRecurring,_that.canReserve,_that.canJoinWaitlist,_that.canWithdraw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int serviceId,  String name,  DateTime startsAt,  DateTime endsAt,  String colorHex,  FacilityServiceLevel? level,  bool isLadiesOnly,  List<String> instructorNames,  FacilitySessionCapacityEntity capacity,  bool areCustomersVisible,  List<SessionAttendeeEntity> customers,  List<SessionAttendeeEntity> waitlist,  SessionLocationEntity? location,  String? note,  DateTime? cancellationDeadline,  int? cancellationWindowHours,  SessionViewerState viewerState,  int accessibleTickets,  SessionReservationTicketEntity? reservationTicket,  int? reservationId,  bool isRecurring,  bool canReserve,  bool canJoinWaitlist,  bool canWithdraw)  $default,) {final _that = this;
switch (_that) {
case _FacilitySessionDetailsEntity():
return $default(_that.id,_that.serviceId,_that.name,_that.startsAt,_that.endsAt,_that.colorHex,_that.level,_that.isLadiesOnly,_that.instructorNames,_that.capacity,_that.areCustomersVisible,_that.customers,_that.waitlist,_that.location,_that.note,_that.cancellationDeadline,_that.cancellationWindowHours,_that.viewerState,_that.accessibleTickets,_that.reservationTicket,_that.reservationId,_that.isRecurring,_that.canReserve,_that.canJoinWaitlist,_that.canWithdraw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int serviceId,  String name,  DateTime startsAt,  DateTime endsAt,  String colorHex,  FacilityServiceLevel? level,  bool isLadiesOnly,  List<String> instructorNames,  FacilitySessionCapacityEntity capacity,  bool areCustomersVisible,  List<SessionAttendeeEntity> customers,  List<SessionAttendeeEntity> waitlist,  SessionLocationEntity? location,  String? note,  DateTime? cancellationDeadline,  int? cancellationWindowHours,  SessionViewerState viewerState,  int accessibleTickets,  SessionReservationTicketEntity? reservationTicket,  int? reservationId,  bool isRecurring,  bool canReserve,  bool canJoinWaitlist,  bool canWithdraw)?  $default,) {final _that = this;
switch (_that) {
case _FacilitySessionDetailsEntity() when $default != null:
return $default(_that.id,_that.serviceId,_that.name,_that.startsAt,_that.endsAt,_that.colorHex,_that.level,_that.isLadiesOnly,_that.instructorNames,_that.capacity,_that.areCustomersVisible,_that.customers,_that.waitlist,_that.location,_that.note,_that.cancellationDeadline,_that.cancellationWindowHours,_that.viewerState,_that.accessibleTickets,_that.reservationTicket,_that.reservationId,_that.isRecurring,_that.canReserve,_that.canJoinWaitlist,_that.canWithdraw);case _:
  return null;

}
}

}

/// @nodoc


class _FacilitySessionDetailsEntity extends FacilitySessionDetailsEntity {
  const _FacilitySessionDetailsEntity({required this.id, required this.serviceId, required this.name, required this.startsAt, required this.endsAt, required this.colorHex, this.level, this.isLadiesOnly = false, final  List<String> instructorNames = const <String>[], required this.capacity, this.areCustomersVisible = false, final  List<SessionAttendeeEntity> customers = const <SessionAttendeeEntity>[], final  List<SessionAttendeeEntity> waitlist = const <SessionAttendeeEntity>[], this.location, this.note, this.cancellationDeadline, this.cancellationWindowHours, this.viewerState = SessionViewerState.none, this.accessibleTickets = 0, this.reservationTicket, this.reservationId, this.isRecurring = false, this.canReserve = true, this.canJoinWaitlist = false, this.canWithdraw = true}): _instructorNames = instructorNames,_customers = customers,_waitlist = waitlist,super._();
  

@override final  int id;
@override final  int serviceId;
@override final  String name;
@override final  DateTime startsAt;
@override final  DateTime endsAt;
@override final  String colorHex;
@override final  FacilityServiceLevel? level;
@override@JsonKey() final  bool isLadiesOnly;
 final  List<String> _instructorNames;
@override@JsonKey() List<String> get instructorNames {
  if (_instructorNames is EqualUnmodifiableListView) return _instructorNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructorNames);
}

@override final  FacilitySessionCapacityEntity capacity;
/// The facility's calendar setting. False hides the names behind an
/// aggregate capacity bar.
@override@JsonKey() final  bool areCustomersVisible;
/// Empty while [areCustomersVisible] is false.
 final  List<SessionAttendeeEntity> _customers;
/// Empty while [areCustomersVisible] is false.
@override@JsonKey() List<SessionAttendeeEntity> get customers {
  if (_customers is EqualUnmodifiableListView) return _customers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customers);
}

/// Always visible, even when customer reservations are private.
 final  List<SessionAttendeeEntity> _waitlist;
/// Always visible, even when customer reservations are private.
@override@JsonKey() List<SessionAttendeeEntity> get waitlist {
  if (_waitlist is EqualUnmodifiableListView) return _waitlist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_waitlist);
}

@override final  SessionLocationEntity? location;
@override final  String? note;
/// Absolute moment after which cancelling (and leaving the waitlist) is no
/// longer allowed. The whole waitlist is dropped when it passes.
@override final  DateTime? cancellationDeadline;
/// Hours-before-start behind [cancellationDeadline], for the policy copy.
@override final  int? cancellationWindowHours;
@override@JsonKey() final  SessionViewerState viewerState;
/// Remaining ticket uses the customer holds that are valid for this slot.
@override@JsonKey() final  int accessibleTickets;
/// The purchase a reservation would draw from. Null when [accessibleTickets]
/// is zero.
@override final  SessionReservationTicketEntity? reservationTicket;
@override final  int? reservationId;
@override@JsonKey() final  bool isRecurring;
@override@JsonKey() final  bool canReserve;
@override@JsonKey() final  bool canJoinWaitlist;
@override@JsonKey() final  bool canWithdraw;

/// Create a copy of FacilitySessionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilitySessionDetailsEntityCopyWith<_FacilitySessionDetailsEntity> get copyWith => __$FacilitySessionDetailsEntityCopyWithImpl<_FacilitySessionDetailsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilitySessionDetailsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.level, level) || other.level == level)&&(identical(other.isLadiesOnly, isLadiesOnly) || other.isLadiesOnly == isLadiesOnly)&&const DeepCollectionEquality().equals(other._instructorNames, _instructorNames)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.areCustomersVisible, areCustomersVisible) || other.areCustomersVisible == areCustomersVisible)&&const DeepCollectionEquality().equals(other._customers, _customers)&&const DeepCollectionEquality().equals(other._waitlist, _waitlist)&&(identical(other.location, location) || other.location == location)&&(identical(other.note, note) || other.note == note)&&(identical(other.cancellationDeadline, cancellationDeadline) || other.cancellationDeadline == cancellationDeadline)&&(identical(other.cancellationWindowHours, cancellationWindowHours) || other.cancellationWindowHours == cancellationWindowHours)&&(identical(other.viewerState, viewerState) || other.viewerState == viewerState)&&(identical(other.accessibleTickets, accessibleTickets) || other.accessibleTickets == accessibleTickets)&&(identical(other.reservationTicket, reservationTicket) || other.reservationTicket == reservationTicket)&&(identical(other.reservationId, reservationId) || other.reservationId == reservationId)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.canReserve, canReserve) || other.canReserve == canReserve)&&(identical(other.canJoinWaitlist, canJoinWaitlist) || other.canJoinWaitlist == canJoinWaitlist)&&(identical(other.canWithdraw, canWithdraw) || other.canWithdraw == canWithdraw));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,serviceId,name,startsAt,endsAt,colorHex,level,isLadiesOnly,const DeepCollectionEquality().hash(_instructorNames),capacity,areCustomersVisible,const DeepCollectionEquality().hash(_customers),const DeepCollectionEquality().hash(_waitlist),location,note,cancellationDeadline,cancellationWindowHours,viewerState,accessibleTickets,reservationTicket,reservationId,isRecurring,canReserve,canJoinWaitlist,canWithdraw]);

@override
String toString() {
  return 'FacilitySessionDetailsEntity(id: $id, serviceId: $serviceId, name: $name, startsAt: $startsAt, endsAt: $endsAt, colorHex: $colorHex, level: $level, isLadiesOnly: $isLadiesOnly, instructorNames: $instructorNames, capacity: $capacity, areCustomersVisible: $areCustomersVisible, customers: $customers, waitlist: $waitlist, location: $location, note: $note, cancellationDeadline: $cancellationDeadline, cancellationWindowHours: $cancellationWindowHours, viewerState: $viewerState, accessibleTickets: $accessibleTickets, reservationTicket: $reservationTicket, reservationId: $reservationId, isRecurring: $isRecurring, canReserve: $canReserve, canJoinWaitlist: $canJoinWaitlist, canWithdraw: $canWithdraw)';
}


}

/// @nodoc
abstract mixin class _$FacilitySessionDetailsEntityCopyWith<$Res> implements $FacilitySessionDetailsEntityCopyWith<$Res> {
  factory _$FacilitySessionDetailsEntityCopyWith(_FacilitySessionDetailsEntity value, $Res Function(_FacilitySessionDetailsEntity) _then) = __$FacilitySessionDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int serviceId, String name, DateTime startsAt, DateTime endsAt, String colorHex, FacilityServiceLevel? level, bool isLadiesOnly, List<String> instructorNames, FacilitySessionCapacityEntity capacity, bool areCustomersVisible, List<SessionAttendeeEntity> customers, List<SessionAttendeeEntity> waitlist, SessionLocationEntity? location, String? note, DateTime? cancellationDeadline, int? cancellationWindowHours, SessionViewerState viewerState, int accessibleTickets, SessionReservationTicketEntity? reservationTicket, int? reservationId, bool isRecurring, bool canReserve, bool canJoinWaitlist, bool canWithdraw
});


@override $FacilityServiceLevelCopyWith<$Res>? get level;@override $FacilitySessionCapacityEntityCopyWith<$Res> get capacity;@override $SessionLocationEntityCopyWith<$Res>? get location;@override $SessionReservationTicketEntityCopyWith<$Res>? get reservationTicket;

}
/// @nodoc
class __$FacilitySessionDetailsEntityCopyWithImpl<$Res>
    implements _$FacilitySessionDetailsEntityCopyWith<$Res> {
  __$FacilitySessionDetailsEntityCopyWithImpl(this._self, this._then);

  final _FacilitySessionDetailsEntity _self;
  final $Res Function(_FacilitySessionDetailsEntity) _then;

/// Create a copy of FacilitySessionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceId = null,Object? name = null,Object? startsAt = null,Object? endsAt = null,Object? colorHex = null,Object? level = freezed,Object? isLadiesOnly = null,Object? instructorNames = null,Object? capacity = null,Object? areCustomersVisible = null,Object? customers = null,Object? waitlist = null,Object? location = freezed,Object? note = freezed,Object? cancellationDeadline = freezed,Object? cancellationWindowHours = freezed,Object? viewerState = null,Object? accessibleTickets = null,Object? reservationTicket = freezed,Object? reservationId = freezed,Object? isRecurring = null,Object? canReserve = null,Object? canJoinWaitlist = null,Object? canWithdraw = null,}) {
  return _then(_FacilitySessionDetailsEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as FacilityServiceLevel?,isLadiesOnly: null == isLadiesOnly ? _self.isLadiesOnly : isLadiesOnly // ignore: cast_nullable_to_non_nullable
as bool,instructorNames: null == instructorNames ? _self._instructorNames : instructorNames // ignore: cast_nullable_to_non_nullable
as List<String>,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as FacilitySessionCapacityEntity,areCustomersVisible: null == areCustomersVisible ? _self.areCustomersVisible : areCustomersVisible // ignore: cast_nullable_to_non_nullable
as bool,customers: null == customers ? _self._customers : customers // ignore: cast_nullable_to_non_nullable
as List<SessionAttendeeEntity>,waitlist: null == waitlist ? _self._waitlist : waitlist // ignore: cast_nullable_to_non_nullable
as List<SessionAttendeeEntity>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as SessionLocationEntity?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,cancellationDeadline: freezed == cancellationDeadline ? _self.cancellationDeadline : cancellationDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,cancellationWindowHours: freezed == cancellationWindowHours ? _self.cancellationWindowHours : cancellationWindowHours // ignore: cast_nullable_to_non_nullable
as int?,viewerState: null == viewerState ? _self.viewerState : viewerState // ignore: cast_nullable_to_non_nullable
as SessionViewerState,accessibleTickets: null == accessibleTickets ? _self.accessibleTickets : accessibleTickets // ignore: cast_nullable_to_non_nullable
as int,reservationTicket: freezed == reservationTicket ? _self.reservationTicket : reservationTicket // ignore: cast_nullable_to_non_nullable
as SessionReservationTicketEntity?,reservationId: freezed == reservationId ? _self.reservationId : reservationId // ignore: cast_nullable_to_non_nullable
as int?,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,canReserve: null == canReserve ? _self.canReserve : canReserve // ignore: cast_nullable_to_non_nullable
as bool,canJoinWaitlist: null == canJoinWaitlist ? _self.canJoinWaitlist : canJoinWaitlist // ignore: cast_nullable_to_non_nullable
as bool,canWithdraw: null == canWithdraw ? _self.canWithdraw : canWithdraw // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of FacilitySessionDetailsEntity
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
}/// Create a copy of FacilitySessionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacilitySessionCapacityEntityCopyWith<$Res> get capacity {
  
  return $FacilitySessionCapacityEntityCopyWith<$Res>(_self.capacity, (value) {
    return _then(_self.copyWith(capacity: value));
  });
}/// Create a copy of FacilitySessionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionLocationEntityCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $SessionLocationEntityCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of FacilitySessionDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionReservationTicketEntityCopyWith<$Res>? get reservationTicket {
    if (_self.reservationTicket == null) {
    return null;
  }

  return $SessionReservationTicketEntityCopyWith<$Res>(_self.reservationTicket!, (value) {
    return _then(_self.copyWith(reservationTicket: value));
  });
}
}

// dart format on
