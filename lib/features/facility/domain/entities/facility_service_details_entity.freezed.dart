// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_service_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityServiceTicketEntity {

 int get id; String get name; double get price; double? get discountPrice; String get currency;
/// Create a copy of FacilityServiceTicketEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityServiceTicketEntityCopyWith<FacilityServiceTicketEntity> get copyWith => _$FacilityServiceTicketEntityCopyWithImpl<FacilityServiceTicketEntity>(this as FacilityServiceTicketEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityServiceTicketEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price,discountPrice,currency);

@override
String toString() {
  return 'FacilityServiceTicketEntity(id: $id, name: $name, price: $price, discountPrice: $discountPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $FacilityServiceTicketEntityCopyWith<$Res>  {
  factory $FacilityServiceTicketEntityCopyWith(FacilityServiceTicketEntity value, $Res Function(FacilityServiceTicketEntity) _then) = _$FacilityServiceTicketEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, double price, double? discountPrice, String currency
});




}
/// @nodoc
class _$FacilityServiceTicketEntityCopyWithImpl<$Res>
    implements $FacilityServiceTicketEntityCopyWith<$Res> {
  _$FacilityServiceTicketEntityCopyWithImpl(this._self, this._then);

  final FacilityServiceTicketEntity _self;
  final $Res Function(FacilityServiceTicketEntity) _then;

/// Create a copy of FacilityServiceTicketEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? discountPrice = freezed,Object? currency = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discountPrice: freezed == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityServiceTicketEntity].
extension FacilityServiceTicketEntityPatterns on FacilityServiceTicketEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityServiceTicketEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityServiceTicketEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityServiceTicketEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityServiceTicketEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityServiceTicketEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityServiceTicketEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  double price,  double? discountPrice,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityServiceTicketEntity() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.discountPrice,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  double price,  double? discountPrice,  String currency)  $default,) {final _that = this;
switch (_that) {
case _FacilityServiceTicketEntity():
return $default(_that.id,_that.name,_that.price,_that.discountPrice,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  double price,  double? discountPrice,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _FacilityServiceTicketEntity() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.discountPrice,_that.currency);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityServiceTicketEntity implements FacilityServiceTicketEntity {
  const _FacilityServiceTicketEntity({required this.id, required this.name, required this.price, this.discountPrice, required this.currency});
  

@override final  int id;
@override final  String name;
@override final  double price;
@override final  double? discountPrice;
@override final  String currency;

/// Create a copy of FacilityServiceTicketEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityServiceTicketEntityCopyWith<_FacilityServiceTicketEntity> get copyWith => __$FacilityServiceTicketEntityCopyWithImpl<_FacilityServiceTicketEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityServiceTicketEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price,discountPrice,currency);

@override
String toString() {
  return 'FacilityServiceTicketEntity(id: $id, name: $name, price: $price, discountPrice: $discountPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$FacilityServiceTicketEntityCopyWith<$Res> implements $FacilityServiceTicketEntityCopyWith<$Res> {
  factory _$FacilityServiceTicketEntityCopyWith(_FacilityServiceTicketEntity value, $Res Function(_FacilityServiceTicketEntity) _then) = __$FacilityServiceTicketEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double price, double? discountPrice, String currency
});




}
/// @nodoc
class __$FacilityServiceTicketEntityCopyWithImpl<$Res>
    implements _$FacilityServiceTicketEntityCopyWith<$Res> {
  __$FacilityServiceTicketEntityCopyWithImpl(this._self, this._then);

  final _FacilityServiceTicketEntity _self;
  final $Res Function(_FacilityServiceTicketEntity) _then;

/// Create a copy of FacilityServiceTicketEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? discountPrice = freezed,Object? currency = null,}) {
  return _then(_FacilityServiceTicketEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discountPrice: freezed == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$FacilityServiceLocationEntity {

 int get id; String get name; String? get link;
/// Create a copy of FacilityServiceLocationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityServiceLocationEntityCopyWith<FacilityServiceLocationEntity> get copyWith => _$FacilityServiceLocationEntityCopyWithImpl<FacilityServiceLocationEntity>(this as FacilityServiceLocationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityServiceLocationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.link, link) || other.link == link));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,link);

@override
String toString() {
  return 'FacilityServiceLocationEntity(id: $id, name: $name, link: $link)';
}


}

/// @nodoc
abstract mixin class $FacilityServiceLocationEntityCopyWith<$Res>  {
  factory $FacilityServiceLocationEntityCopyWith(FacilityServiceLocationEntity value, $Res Function(FacilityServiceLocationEntity) _then) = _$FacilityServiceLocationEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? link
});




}
/// @nodoc
class _$FacilityServiceLocationEntityCopyWithImpl<$Res>
    implements $FacilityServiceLocationEntityCopyWith<$Res> {
  _$FacilityServiceLocationEntityCopyWithImpl(this._self, this._then);

  final FacilityServiceLocationEntity _self;
  final $Res Function(FacilityServiceLocationEntity) _then;

/// Create a copy of FacilityServiceLocationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? link = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityServiceLocationEntity].
extension FacilityServiceLocationEntityPatterns on FacilityServiceLocationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityServiceLocationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityServiceLocationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityServiceLocationEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityServiceLocationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityServiceLocationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityServiceLocationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityServiceLocationEntity() when $default != null:
return $default(_that.id,_that.name,_that.link);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? link)  $default,) {final _that = this;
switch (_that) {
case _FacilityServiceLocationEntity():
return $default(_that.id,_that.name,_that.link);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? link)?  $default,) {final _that = this;
switch (_that) {
case _FacilityServiceLocationEntity() when $default != null:
return $default(_that.id,_that.name,_that.link);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityServiceLocationEntity implements FacilityServiceLocationEntity {
  const _FacilityServiceLocationEntity({required this.id, required this.name, this.link});
  

@override final  int id;
@override final  String name;
@override final  String? link;

/// Create a copy of FacilityServiceLocationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityServiceLocationEntityCopyWith<_FacilityServiceLocationEntity> get copyWith => __$FacilityServiceLocationEntityCopyWithImpl<_FacilityServiceLocationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityServiceLocationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.link, link) || other.link == link));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,link);

@override
String toString() {
  return 'FacilityServiceLocationEntity(id: $id, name: $name, link: $link)';
}


}

/// @nodoc
abstract mixin class _$FacilityServiceLocationEntityCopyWith<$Res> implements $FacilityServiceLocationEntityCopyWith<$Res> {
  factory _$FacilityServiceLocationEntityCopyWith(_FacilityServiceLocationEntity value, $Res Function(_FacilityServiceLocationEntity) _then) = __$FacilityServiceLocationEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? link
});




}
/// @nodoc
class __$FacilityServiceLocationEntityCopyWithImpl<$Res>
    implements _$FacilityServiceLocationEntityCopyWith<$Res> {
  __$FacilityServiceLocationEntityCopyWithImpl(this._self, this._then);

  final _FacilityServiceLocationEntity _self;
  final $Res Function(_FacilityServiceLocationEntity) _then;

/// Create a copy of FacilityServiceLocationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? link = freezed,}) {
  return _then(_FacilityServiceLocationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$FacilityServiceInstructorEntity {

 int get id; String get firstName; String get lastName;
/// Create a copy of FacilityServiceInstructorEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityServiceInstructorEntityCopyWith<FacilityServiceInstructorEntity> get copyWith => _$FacilityServiceInstructorEntityCopyWithImpl<FacilityServiceInstructorEntity>(this as FacilityServiceInstructorEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityServiceInstructorEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}


@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName);

@override
String toString() {
  return 'FacilityServiceInstructorEntity(id: $id, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $FacilityServiceInstructorEntityCopyWith<$Res>  {
  factory $FacilityServiceInstructorEntityCopyWith(FacilityServiceInstructorEntity value, $Res Function(FacilityServiceInstructorEntity) _then) = _$FacilityServiceInstructorEntityCopyWithImpl;
@useResult
$Res call({
 int id, String firstName, String lastName
});




}
/// @nodoc
class _$FacilityServiceInstructorEntityCopyWithImpl<$Res>
    implements $FacilityServiceInstructorEntityCopyWith<$Res> {
  _$FacilityServiceInstructorEntityCopyWithImpl(this._self, this._then);

  final FacilityServiceInstructorEntity _self;
  final $Res Function(FacilityServiceInstructorEntity) _then;

/// Create a copy of FacilityServiceInstructorEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityServiceInstructorEntity].
extension FacilityServiceInstructorEntityPatterns on FacilityServiceInstructorEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityServiceInstructorEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityServiceInstructorEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityServiceInstructorEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityServiceInstructorEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityServiceInstructorEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityServiceInstructorEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityServiceInstructorEntity() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName)  $default,) {final _that = this;
switch (_that) {
case _FacilityServiceInstructorEntity():
return $default(_that.id,_that.firstName,_that.lastName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstName,  String lastName)?  $default,) {final _that = this;
switch (_that) {
case _FacilityServiceInstructorEntity() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityServiceInstructorEntity extends FacilityServiceInstructorEntity {
  const _FacilityServiceInstructorEntity({required this.id, required this.firstName, required this.lastName}): super._();
  

@override final  int id;
@override final  String firstName;
@override final  String lastName;

/// Create a copy of FacilityServiceInstructorEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityServiceInstructorEntityCopyWith<_FacilityServiceInstructorEntity> get copyWith => __$FacilityServiceInstructorEntityCopyWithImpl<_FacilityServiceInstructorEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityServiceInstructorEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}


@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName);

@override
String toString() {
  return 'FacilityServiceInstructorEntity(id: $id, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class _$FacilityServiceInstructorEntityCopyWith<$Res> implements $FacilityServiceInstructorEntityCopyWith<$Res> {
  factory _$FacilityServiceInstructorEntityCopyWith(_FacilityServiceInstructorEntity value, $Res Function(_FacilityServiceInstructorEntity) _then) = __$FacilityServiceInstructorEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstName, String lastName
});




}
/// @nodoc
class __$FacilityServiceInstructorEntityCopyWithImpl<$Res>
    implements _$FacilityServiceInstructorEntityCopyWith<$Res> {
  __$FacilityServiceInstructorEntityCopyWithImpl(this._self, this._then);

  final _FacilityServiceInstructorEntity _self;
  final $Res Function(_FacilityServiceInstructorEntity) _then;

/// Create a copy of FacilityServiceInstructorEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,}) {
  return _then(_FacilityServiceInstructorEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$FacilityServiceDetailsEntity {

 int get id; String get name; String? get description; String? get requirements; String? get conditions; List<String> get imageUrls; String? get durationLabel; FacilityServiceLevel? get level; List<FacilityServiceTicketEntity> get tickets; List<FacilityServiceLocationEntity> get locations; List<FacilityServiceInstructorEntity> get instructors;
/// Create a copy of FacilityServiceDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityServiceDetailsEntityCopyWith<FacilityServiceDetailsEntity> get copyWith => _$FacilityServiceDetailsEntityCopyWithImpl<FacilityServiceDetailsEntity>(this as FacilityServiceDetailsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityServiceDetailsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.durationLabel, durationLabel) || other.durationLabel == durationLabel)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.tickets, tickets)&&const DeepCollectionEquality().equals(other.locations, locations)&&const DeepCollectionEquality().equals(other.instructors, instructors));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,requirements,conditions,const DeepCollectionEquality().hash(imageUrls),durationLabel,level,const DeepCollectionEquality().hash(tickets),const DeepCollectionEquality().hash(locations),const DeepCollectionEquality().hash(instructors));

@override
String toString() {
  return 'FacilityServiceDetailsEntity(id: $id, name: $name, description: $description, requirements: $requirements, conditions: $conditions, imageUrls: $imageUrls, durationLabel: $durationLabel, level: $level, tickets: $tickets, locations: $locations, instructors: $instructors)';
}


}

/// @nodoc
abstract mixin class $FacilityServiceDetailsEntityCopyWith<$Res>  {
  factory $FacilityServiceDetailsEntityCopyWith(FacilityServiceDetailsEntity value, $Res Function(FacilityServiceDetailsEntity) _then) = _$FacilityServiceDetailsEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description, String? requirements, String? conditions, List<String> imageUrls, String? durationLabel, FacilityServiceLevel? level, List<FacilityServiceTicketEntity> tickets, List<FacilityServiceLocationEntity> locations, List<FacilityServiceInstructorEntity> instructors
});


$FacilityServiceLevelCopyWith<$Res>? get level;

}
/// @nodoc
class _$FacilityServiceDetailsEntityCopyWithImpl<$Res>
    implements $FacilityServiceDetailsEntityCopyWith<$Res> {
  _$FacilityServiceDetailsEntityCopyWithImpl(this._self, this._then);

  final FacilityServiceDetailsEntity _self;
  final $Res Function(FacilityServiceDetailsEntity) _then;

/// Create a copy of FacilityServiceDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? requirements = freezed,Object? conditions = freezed,Object? imageUrls = null,Object? durationLabel = freezed,Object? level = freezed,Object? tickets = null,Object? locations = null,Object? instructors = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,requirements: freezed == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String?,conditions: freezed == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String?,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,durationLabel: freezed == durationLabel ? _self.durationLabel : durationLabel // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as FacilityServiceLevel?,tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<FacilityServiceTicketEntity>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<FacilityServiceLocationEntity>,instructors: null == instructors ? _self.instructors : instructors // ignore: cast_nullable_to_non_nullable
as List<FacilityServiceInstructorEntity>,
  ));
}
/// Create a copy of FacilityServiceDetailsEntity
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
}
}


/// Adds pattern-matching-related methods to [FacilityServiceDetailsEntity].
extension FacilityServiceDetailsEntityPatterns on FacilityServiceDetailsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityServiceDetailsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityServiceDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityServiceDetailsEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityServiceDetailsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityServiceDetailsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityServiceDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? requirements,  String? conditions,  List<String> imageUrls,  String? durationLabel,  FacilityServiceLevel? level,  List<FacilityServiceTicketEntity> tickets,  List<FacilityServiceLocationEntity> locations,  List<FacilityServiceInstructorEntity> instructors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityServiceDetailsEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.requirements,_that.conditions,_that.imageUrls,_that.durationLabel,_that.level,_that.tickets,_that.locations,_that.instructors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? requirements,  String? conditions,  List<String> imageUrls,  String? durationLabel,  FacilityServiceLevel? level,  List<FacilityServiceTicketEntity> tickets,  List<FacilityServiceLocationEntity> locations,  List<FacilityServiceInstructorEntity> instructors)  $default,) {final _that = this;
switch (_that) {
case _FacilityServiceDetailsEntity():
return $default(_that.id,_that.name,_that.description,_that.requirements,_that.conditions,_that.imageUrls,_that.durationLabel,_that.level,_that.tickets,_that.locations,_that.instructors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? description,  String? requirements,  String? conditions,  List<String> imageUrls,  String? durationLabel,  FacilityServiceLevel? level,  List<FacilityServiceTicketEntity> tickets,  List<FacilityServiceLocationEntity> locations,  List<FacilityServiceInstructorEntity> instructors)?  $default,) {final _that = this;
switch (_that) {
case _FacilityServiceDetailsEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.requirements,_that.conditions,_that.imageUrls,_that.durationLabel,_that.level,_that.tickets,_that.locations,_that.instructors);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityServiceDetailsEntity implements FacilityServiceDetailsEntity {
  const _FacilityServiceDetailsEntity({required this.id, required this.name, this.description, this.requirements, this.conditions, required final  List<String> imageUrls, this.durationLabel, this.level, required final  List<FacilityServiceTicketEntity> tickets, required final  List<FacilityServiceLocationEntity> locations, required final  List<FacilityServiceInstructorEntity> instructors}): _imageUrls = imageUrls,_tickets = tickets,_locations = locations,_instructors = instructors;
  

@override final  int id;
@override final  String name;
@override final  String? description;
@override final  String? requirements;
@override final  String? conditions;
 final  List<String> _imageUrls;
@override List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

@override final  String? durationLabel;
@override final  FacilityServiceLevel? level;
 final  List<FacilityServiceTicketEntity> _tickets;
@override List<FacilityServiceTicketEntity> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}

 final  List<FacilityServiceLocationEntity> _locations;
@override List<FacilityServiceLocationEntity> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}

 final  List<FacilityServiceInstructorEntity> _instructors;
@override List<FacilityServiceInstructorEntity> get instructors {
  if (_instructors is EqualUnmodifiableListView) return _instructors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructors);
}


/// Create a copy of FacilityServiceDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityServiceDetailsEntityCopyWith<_FacilityServiceDetailsEntity> get copyWith => __$FacilityServiceDetailsEntityCopyWithImpl<_FacilityServiceDetailsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityServiceDetailsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.durationLabel, durationLabel) || other.durationLabel == durationLabel)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other._tickets, _tickets)&&const DeepCollectionEquality().equals(other._locations, _locations)&&const DeepCollectionEquality().equals(other._instructors, _instructors));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,requirements,conditions,const DeepCollectionEquality().hash(_imageUrls),durationLabel,level,const DeepCollectionEquality().hash(_tickets),const DeepCollectionEquality().hash(_locations),const DeepCollectionEquality().hash(_instructors));

@override
String toString() {
  return 'FacilityServiceDetailsEntity(id: $id, name: $name, description: $description, requirements: $requirements, conditions: $conditions, imageUrls: $imageUrls, durationLabel: $durationLabel, level: $level, tickets: $tickets, locations: $locations, instructors: $instructors)';
}


}

/// @nodoc
abstract mixin class _$FacilityServiceDetailsEntityCopyWith<$Res> implements $FacilityServiceDetailsEntityCopyWith<$Res> {
  factory _$FacilityServiceDetailsEntityCopyWith(_FacilityServiceDetailsEntity value, $Res Function(_FacilityServiceDetailsEntity) _then) = __$FacilityServiceDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description, String? requirements, String? conditions, List<String> imageUrls, String? durationLabel, FacilityServiceLevel? level, List<FacilityServiceTicketEntity> tickets, List<FacilityServiceLocationEntity> locations, List<FacilityServiceInstructorEntity> instructors
});


@override $FacilityServiceLevelCopyWith<$Res>? get level;

}
/// @nodoc
class __$FacilityServiceDetailsEntityCopyWithImpl<$Res>
    implements _$FacilityServiceDetailsEntityCopyWith<$Res> {
  __$FacilityServiceDetailsEntityCopyWithImpl(this._self, this._then);

  final _FacilityServiceDetailsEntity _self;
  final $Res Function(_FacilityServiceDetailsEntity) _then;

/// Create a copy of FacilityServiceDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? requirements = freezed,Object? conditions = freezed,Object? imageUrls = null,Object? durationLabel = freezed,Object? level = freezed,Object? tickets = null,Object? locations = null,Object? instructors = null,}) {
  return _then(_FacilityServiceDetailsEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,requirements: freezed == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String?,conditions: freezed == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String?,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,durationLabel: freezed == durationLabel ? _self.durationLabel : durationLabel // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as FacilityServiceLevel?,tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<FacilityServiceTicketEntity>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<FacilityServiceLocationEntity>,instructors: null == instructors ? _self._instructors : instructors // ignore: cast_nullable_to_non_nullable
as List<FacilityServiceInstructorEntity>,
  ));
}

/// Create a copy of FacilityServiceDetailsEntity
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
}
}

// dart format on
