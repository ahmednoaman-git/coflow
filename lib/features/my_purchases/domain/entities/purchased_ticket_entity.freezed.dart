// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchased_ticket_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchasedTicketEntity {

 int get id; String get name;/// How many are **left** — the API's `quantity`, which counts down as
/// tickets are used (verified 2026-11-16: bought 3, one collected →
/// `quantity: 2, used: 1`). Null when [unlimited] (or not sent).
 int? get quantity;/// How many have been reserved or used.
 int get used; bool get unlimited;/// How long the ticket lasts once bought, in days.
 int? get validityDays; DateTime? get expireDate;/// Whether the API flags this ticket itself as expired.
 bool get isExpired;/// The services it gives access to.
 List<String> get accessNames;
/// Create a copy of PurchasedTicketEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchasedTicketEntityCopyWith<PurchasedTicketEntity> get copyWith => _$PurchasedTicketEntityCopyWithImpl<PurchasedTicketEntity>(this as PurchasedTicketEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchasedTicketEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.used, used) || other.used == used)&&(identical(other.unlimited, unlimited) || other.unlimited == unlimited)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays)&&(identical(other.expireDate, expireDate) || other.expireDate == expireDate)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&const DeepCollectionEquality().equals(other.accessNames, accessNames));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,quantity,used,unlimited,validityDays,expireDate,isExpired,const DeepCollectionEquality().hash(accessNames));

@override
String toString() {
  return 'PurchasedTicketEntity(id: $id, name: $name, quantity: $quantity, used: $used, unlimited: $unlimited, validityDays: $validityDays, expireDate: $expireDate, isExpired: $isExpired, accessNames: $accessNames)';
}


}

/// @nodoc
abstract mixin class $PurchasedTicketEntityCopyWith<$Res>  {
  factory $PurchasedTicketEntityCopyWith(PurchasedTicketEntity value, $Res Function(PurchasedTicketEntity) _then) = _$PurchasedTicketEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, int? quantity, int used, bool unlimited, int? validityDays, DateTime? expireDate, bool isExpired, List<String> accessNames
});




}
/// @nodoc
class _$PurchasedTicketEntityCopyWithImpl<$Res>
    implements $PurchasedTicketEntityCopyWith<$Res> {
  _$PurchasedTicketEntityCopyWithImpl(this._self, this._then);

  final PurchasedTicketEntity _self;
  final $Res Function(PurchasedTicketEntity) _then;

/// Create a copy of PurchasedTicketEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? quantity = freezed,Object? used = null,Object? unlimited = null,Object? validityDays = freezed,Object? expireDate = freezed,Object? isExpired = null,Object? accessNames = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,unlimited: null == unlimited ? _self.unlimited : unlimited // ignore: cast_nullable_to_non_nullable
as bool,validityDays: freezed == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int?,expireDate: freezed == expireDate ? _self.expireDate : expireDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isExpired: null == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool,accessNames: null == accessNames ? _self.accessNames : accessNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchasedTicketEntity].
extension PurchasedTicketEntityPatterns on PurchasedTicketEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchasedTicketEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchasedTicketEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchasedTicketEntity value)  $default,){
final _that = this;
switch (_that) {
case _PurchasedTicketEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchasedTicketEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PurchasedTicketEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int? quantity,  int used,  bool unlimited,  int? validityDays,  DateTime? expireDate,  bool isExpired,  List<String> accessNames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchasedTicketEntity() when $default != null:
return $default(_that.id,_that.name,_that.quantity,_that.used,_that.unlimited,_that.validityDays,_that.expireDate,_that.isExpired,_that.accessNames);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int? quantity,  int used,  bool unlimited,  int? validityDays,  DateTime? expireDate,  bool isExpired,  List<String> accessNames)  $default,) {final _that = this;
switch (_that) {
case _PurchasedTicketEntity():
return $default(_that.id,_that.name,_that.quantity,_that.used,_that.unlimited,_that.validityDays,_that.expireDate,_that.isExpired,_that.accessNames);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int? quantity,  int used,  bool unlimited,  int? validityDays,  DateTime? expireDate,  bool isExpired,  List<String> accessNames)?  $default,) {final _that = this;
switch (_that) {
case _PurchasedTicketEntity() when $default != null:
return $default(_that.id,_that.name,_that.quantity,_that.used,_that.unlimited,_that.validityDays,_that.expireDate,_that.isExpired,_that.accessNames);case _:
  return null;

}
}

}

/// @nodoc


class _PurchasedTicketEntity extends PurchasedTicketEntity {
  const _PurchasedTicketEntity({required this.id, required this.name, this.quantity, this.used = 0, this.unlimited = false, this.validityDays, this.expireDate, this.isExpired = false, final  List<String> accessNames = const <String>[]}): _accessNames = accessNames,super._();
  

@override final  int id;
@override final  String name;
/// How many are **left** — the API's `quantity`, which counts down as
/// tickets are used (verified 2026-11-16: bought 3, one collected →
/// `quantity: 2, used: 1`). Null when [unlimited] (or not sent).
@override final  int? quantity;
/// How many have been reserved or used.
@override@JsonKey() final  int used;
@override@JsonKey() final  bool unlimited;
/// How long the ticket lasts once bought, in days.
@override final  int? validityDays;
@override final  DateTime? expireDate;
/// Whether the API flags this ticket itself as expired.
@override@JsonKey() final  bool isExpired;
/// The services it gives access to.
 final  List<String> _accessNames;
/// The services it gives access to.
@override@JsonKey() List<String> get accessNames {
  if (_accessNames is EqualUnmodifiableListView) return _accessNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accessNames);
}


/// Create a copy of PurchasedTicketEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchasedTicketEntityCopyWith<_PurchasedTicketEntity> get copyWith => __$PurchasedTicketEntityCopyWithImpl<_PurchasedTicketEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchasedTicketEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.used, used) || other.used == used)&&(identical(other.unlimited, unlimited) || other.unlimited == unlimited)&&(identical(other.validityDays, validityDays) || other.validityDays == validityDays)&&(identical(other.expireDate, expireDate) || other.expireDate == expireDate)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&const DeepCollectionEquality().equals(other._accessNames, _accessNames));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,quantity,used,unlimited,validityDays,expireDate,isExpired,const DeepCollectionEquality().hash(_accessNames));

@override
String toString() {
  return 'PurchasedTicketEntity(id: $id, name: $name, quantity: $quantity, used: $used, unlimited: $unlimited, validityDays: $validityDays, expireDate: $expireDate, isExpired: $isExpired, accessNames: $accessNames)';
}


}

/// @nodoc
abstract mixin class _$PurchasedTicketEntityCopyWith<$Res> implements $PurchasedTicketEntityCopyWith<$Res> {
  factory _$PurchasedTicketEntityCopyWith(_PurchasedTicketEntity value, $Res Function(_PurchasedTicketEntity) _then) = __$PurchasedTicketEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int? quantity, int used, bool unlimited, int? validityDays, DateTime? expireDate, bool isExpired, List<String> accessNames
});




}
/// @nodoc
class __$PurchasedTicketEntityCopyWithImpl<$Res>
    implements _$PurchasedTicketEntityCopyWith<$Res> {
  __$PurchasedTicketEntityCopyWithImpl(this._self, this._then);

  final _PurchasedTicketEntity _self;
  final $Res Function(_PurchasedTicketEntity) _then;

/// Create a copy of PurchasedTicketEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? quantity = freezed,Object? used = null,Object? unlimited = null,Object? validityDays = freezed,Object? expireDate = freezed,Object? isExpired = null,Object? accessNames = null,}) {
  return _then(_PurchasedTicketEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,unlimited: null == unlimited ? _self.unlimited : unlimited // ignore: cast_nullable_to_non_nullable
as bool,validityDays: freezed == validityDays ? _self.validityDays : validityDays // ignore: cast_nullable_to_non_nullable
as int?,expireDate: freezed == expireDate ? _self.expireDate : expireDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isExpired: null == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool,accessNames: null == accessNames ? _self._accessNames : accessNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
