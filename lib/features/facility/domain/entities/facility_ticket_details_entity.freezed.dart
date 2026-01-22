// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_ticket_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddOnEntity {

 int get id; String get name; double get price;
/// Create a copy of AddOnEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddOnEntityCopyWith<AddOnEntity> get copyWith => _$AddOnEntityCopyWithImpl<AddOnEntity>(this as AddOnEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddOnEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price);

@override
String toString() {
  return 'AddOnEntity(id: $id, name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class $AddOnEntityCopyWith<$Res>  {
  factory $AddOnEntityCopyWith(AddOnEntity value, $Res Function(AddOnEntity) _then) = _$AddOnEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, double price
});




}
/// @nodoc
class _$AddOnEntityCopyWithImpl<$Res>
    implements $AddOnEntityCopyWith<$Res> {
  _$AddOnEntityCopyWithImpl(this._self, this._then);

  final AddOnEntity _self;
  final $Res Function(AddOnEntity) _then;

/// Create a copy of AddOnEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AddOnEntity].
extension AddOnEntityPatterns on AddOnEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddOnEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddOnEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddOnEntity value)  $default,){
final _that = this;
switch (_that) {
case _AddOnEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddOnEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AddOnEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  double price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddOnEntity() when $default != null:
return $default(_that.id,_that.name,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  double price)  $default,) {final _that = this;
switch (_that) {
case _AddOnEntity():
return $default(_that.id,_that.name,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  double price)?  $default,) {final _that = this;
switch (_that) {
case _AddOnEntity() when $default != null:
return $default(_that.id,_that.name,_that.price);case _:
  return null;

}
}

}

/// @nodoc


class _AddOnEntity implements AddOnEntity {
  const _AddOnEntity({required this.id, required this.name, required this.price});
  

@override final  int id;
@override final  String name;
@override final  double price;

/// Create a copy of AddOnEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddOnEntityCopyWith<_AddOnEntity> get copyWith => __$AddOnEntityCopyWithImpl<_AddOnEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddOnEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price);

@override
String toString() {
  return 'AddOnEntity(id: $id, name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class _$AddOnEntityCopyWith<$Res> implements $AddOnEntityCopyWith<$Res> {
  factory _$AddOnEntityCopyWith(_AddOnEntity value, $Res Function(_AddOnEntity) _then) = __$AddOnEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double price
});




}
/// @nodoc
class __$AddOnEntityCopyWithImpl<$Res>
    implements _$AddOnEntityCopyWith<$Res> {
  __$AddOnEntityCopyWithImpl(this._self, this._then);

  final _AddOnEntity _self;
  final $Res Function(_AddOnEntity) _then;

/// Create a copy of AddOnEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,}) {
  return _then(_AddOnEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ServiceEntity {

 int get id; String get name; String? get imageUrl;
/// Create a copy of ServiceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceEntityCopyWith<ServiceEntity> get copyWith => _$ServiceEntityCopyWithImpl<ServiceEntity>(this as ServiceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl);

@override
String toString() {
  return 'ServiceEntity(id: $id, name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $ServiceEntityCopyWith<$Res>  {
  factory $ServiceEntityCopyWith(ServiceEntity value, $Res Function(ServiceEntity) _then) = _$ServiceEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? imageUrl
});




}
/// @nodoc
class _$ServiceEntityCopyWithImpl<$Res>
    implements $ServiceEntityCopyWith<$Res> {
  _$ServiceEntityCopyWithImpl(this._self, this._then);

  final ServiceEntity _self;
  final $Res Function(ServiceEntity) _then;

/// Create a copy of ServiceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceEntity].
extension ServiceEntityPatterns on ServiceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceEntity value)  $default,){
final _that = this;
switch (_that) {
case _ServiceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceEntity() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _ServiceEntity():
return $default(_that.id,_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _ServiceEntity() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _ServiceEntity implements ServiceEntity {
  const _ServiceEntity({required this.id, required this.name, required this.imageUrl});
  

@override final  int id;
@override final  String name;
@override final  String? imageUrl;

/// Create a copy of ServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceEntityCopyWith<_ServiceEntity> get copyWith => __$ServiceEntityCopyWithImpl<_ServiceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl);

@override
String toString() {
  return 'ServiceEntity(id: $id, name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$ServiceEntityCopyWith<$Res> implements $ServiceEntityCopyWith<$Res> {
  factory _$ServiceEntityCopyWith(_ServiceEntity value, $Res Function(_ServiceEntity) _then) = __$ServiceEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? imageUrl
});




}
/// @nodoc
class __$ServiceEntityCopyWithImpl<$Res>
    implements _$ServiceEntityCopyWith<$Res> {
  __$ServiceEntityCopyWithImpl(this._self, this._then);

  final _ServiceEntity _self;
  final $Res Function(_ServiceEntity) _then;

/// Create a copy of ServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,}) {
  return _then(_ServiceEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$FacilityTicketDetailsEntity {

 int get id; String get name; double get price; double? get discountPrice; String get currency; bool get unlimited; int? get validityDays; List<AddOnEntity> get addOns; List<ServiceEntity> get services; String get conditions; String get requirements;
/// Create a copy of FacilityTicketDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityTicketDetailsEntityCopyWith<FacilityTicketDetailsEntity> get copyWith => _$FacilityTicketDetailsEntityCopyWithImpl<FacilityTicketDetailsEntity>(this as FacilityTicketDetailsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityTicketDetailsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.unlimited, unlimited) || other.unlimited == unlimited)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays)&&const DeepCollectionEquality().equals(other.addOns, addOns)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&(identical(other.requirements, requirements) || other.requirements == requirements));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price,discountPrice,currency,unlimited,validityDays,const DeepCollectionEquality().hash(addOns),const DeepCollectionEquality().hash(services),conditions,requirements);

@override
String toString() {
  return 'FacilityTicketDetailsEntity(id: $id, name: $name, price: $price, discountPrice: $discountPrice, currency: $currency, unlimited: $unlimited, validityDays: $validityDays, addOns: $addOns, services: $services, conditions: $conditions, requirements: $requirements)';
}


}

/// @nodoc
abstract mixin class $FacilityTicketDetailsEntityCopyWith<$Res>  {
  factory $FacilityTicketDetailsEntityCopyWith(FacilityTicketDetailsEntity value, $Res Function(FacilityTicketDetailsEntity) _then) = _$FacilityTicketDetailsEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, double price, double? discountPrice, String currency, bool unlimited, int? validityDays, List<AddOnEntity> addOns, List<ServiceEntity> services, String conditions, String requirements
});




}
/// @nodoc
class _$FacilityTicketDetailsEntityCopyWithImpl<$Res>
    implements $FacilityTicketDetailsEntityCopyWith<$Res> {
  _$FacilityTicketDetailsEntityCopyWithImpl(this._self, this._then);

  final FacilityTicketDetailsEntity _self;
  final $Res Function(FacilityTicketDetailsEntity) _then;

/// Create a copy of FacilityTicketDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? discountPrice = freezed,Object? currency = null,Object? unlimited = null,Object? validityDays = freezed,Object? addOns = null,Object? services = null,Object? conditions = null,Object? requirements = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discountPrice: freezed == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,unlimited: null == unlimited ? _self.unlimited : unlimited // ignore: cast_nullable_to_non_nullable
as bool,validityDays: freezed == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int?,addOns: null == addOns ? _self.addOns : addOns // ignore: cast_nullable_to_non_nullable
as List<AddOnEntity>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityTicketDetailsEntity].
extension FacilityTicketDetailsEntityPatterns on FacilityTicketDetailsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityTicketDetailsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityTicketDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityTicketDetailsEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityTicketDetailsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityTicketDetailsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityTicketDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  double price,  double? discountPrice,  String currency,  bool unlimited,  int? validityDays,  List<AddOnEntity> addOns,  List<ServiceEntity> services,  String conditions,  String requirements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityTicketDetailsEntity() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.discountPrice,_that.currency,_that.unlimited,_that.validityDays,_that.addOns,_that.services,_that.conditions,_that.requirements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  double price,  double? discountPrice,  String currency,  bool unlimited,  int? validityDays,  List<AddOnEntity> addOns,  List<ServiceEntity> services,  String conditions,  String requirements)  $default,) {final _that = this;
switch (_that) {
case _FacilityTicketDetailsEntity():
return $default(_that.id,_that.name,_that.price,_that.discountPrice,_that.currency,_that.unlimited,_that.validityDays,_that.addOns,_that.services,_that.conditions,_that.requirements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  double price,  double? discountPrice,  String currency,  bool unlimited,  int? validityDays,  List<AddOnEntity> addOns,  List<ServiceEntity> services,  String conditions,  String requirements)?  $default,) {final _that = this;
switch (_that) {
case _FacilityTicketDetailsEntity() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.discountPrice,_that.currency,_that.unlimited,_that.validityDays,_that.addOns,_that.services,_that.conditions,_that.requirements);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityTicketDetailsEntity extends FacilityTicketDetailsEntity {
  const _FacilityTicketDetailsEntity({required this.id, required this.name, required this.price, this.discountPrice, required this.currency, required this.unlimited, this.validityDays, final  List<AddOnEntity> addOns = const <AddOnEntity>[], final  List<ServiceEntity> services = const <ServiceEntity>[], this.conditions = '', this.requirements = ''}): _addOns = addOns,_services = services,super._();
  

@override final  int id;
@override final  String name;
@override final  double price;
@override final  double? discountPrice;
@override final  String currency;
@override final  bool unlimited;
@override final  int? validityDays;
 final  List<AddOnEntity> _addOns;
@override@JsonKey() List<AddOnEntity> get addOns {
  if (_addOns is EqualUnmodifiableListView) return _addOns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addOns);
}

 final  List<ServiceEntity> _services;
@override@JsonKey() List<ServiceEntity> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

@override@JsonKey() final  String conditions;
@override@JsonKey() final  String requirements;

/// Create a copy of FacilityTicketDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityTicketDetailsEntityCopyWith<_FacilityTicketDetailsEntity> get copyWith => __$FacilityTicketDetailsEntityCopyWithImpl<_FacilityTicketDetailsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityTicketDetailsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.unlimited, unlimited) || other.unlimited == unlimited)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays)&&const DeepCollectionEquality().equals(other._addOns, _addOns)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&(identical(other.requirements, requirements) || other.requirements == requirements));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price,discountPrice,currency,unlimited,validityDays,const DeepCollectionEquality().hash(_addOns),const DeepCollectionEquality().hash(_services),conditions,requirements);

@override
String toString() {
  return 'FacilityTicketDetailsEntity(id: $id, name: $name, price: $price, discountPrice: $discountPrice, currency: $currency, unlimited: $unlimited, validityDays: $validityDays, addOns: $addOns, services: $services, conditions: $conditions, requirements: $requirements)';
}


}

/// @nodoc
abstract mixin class _$FacilityTicketDetailsEntityCopyWith<$Res> implements $FacilityTicketDetailsEntityCopyWith<$Res> {
  factory _$FacilityTicketDetailsEntityCopyWith(_FacilityTicketDetailsEntity value, $Res Function(_FacilityTicketDetailsEntity) _then) = __$FacilityTicketDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double price, double? discountPrice, String currency, bool unlimited, int? validityDays, List<AddOnEntity> addOns, List<ServiceEntity> services, String conditions, String requirements
});




}
/// @nodoc
class __$FacilityTicketDetailsEntityCopyWithImpl<$Res>
    implements _$FacilityTicketDetailsEntityCopyWith<$Res> {
  __$FacilityTicketDetailsEntityCopyWithImpl(this._self, this._then);

  final _FacilityTicketDetailsEntity _self;
  final $Res Function(_FacilityTicketDetailsEntity) _then;

/// Create a copy of FacilityTicketDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? discountPrice = freezed,Object? currency = null,Object? unlimited = null,Object? validityDays = freezed,Object? addOns = null,Object? services = null,Object? conditions = null,Object? requirements = null,}) {
  return _then(_FacilityTicketDetailsEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discountPrice: freezed == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,unlimited: null == unlimited ? _self.unlimited : unlimited // ignore: cast_nullable_to_non_nullable
as bool,validityDays: freezed == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int?,addOns: null == addOns ? _self._addOns : addOns // ignore: cast_nullable_to_non_nullable
as List<AddOnEntity>,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
