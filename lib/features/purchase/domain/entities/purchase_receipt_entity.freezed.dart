// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_receipt_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseReceiptEntity {

 int get id;
/// Create a copy of PurchaseReceiptEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseReceiptEntityCopyWith<PurchaseReceiptEntity> get copyWith => _$PurchaseReceiptEntityCopyWithImpl<PurchaseReceiptEntity>(this as PurchaseReceiptEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseReceiptEntity&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PurchaseReceiptEntity(id: $id)';
}


}

/// @nodoc
abstract mixin class $PurchaseReceiptEntityCopyWith<$Res>  {
  factory $PurchaseReceiptEntityCopyWith(PurchaseReceiptEntity value, $Res Function(PurchaseReceiptEntity) _then) = _$PurchaseReceiptEntityCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$PurchaseReceiptEntityCopyWithImpl<$Res>
    implements $PurchaseReceiptEntityCopyWith<$Res> {
  _$PurchaseReceiptEntityCopyWithImpl(this._self, this._then);

  final PurchaseReceiptEntity _self;
  final $Res Function(PurchaseReceiptEntity) _then;

/// Create a copy of PurchaseReceiptEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseReceiptEntity].
extension PurchaseReceiptEntityPatterns on PurchaseReceiptEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseReceiptEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseReceiptEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseReceiptEntity value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseReceiptEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseReceiptEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseReceiptEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseReceiptEntity() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id)  $default,) {final _that = this;
switch (_that) {
case _PurchaseReceiptEntity():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseReceiptEntity() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseReceiptEntity implements PurchaseReceiptEntity {
  const _PurchaseReceiptEntity({required this.id});
  

@override final  int id;

/// Create a copy of PurchaseReceiptEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseReceiptEntityCopyWith<_PurchaseReceiptEntity> get copyWith => __$PurchaseReceiptEntityCopyWithImpl<_PurchaseReceiptEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseReceiptEntity&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PurchaseReceiptEntity(id: $id)';
}


}

/// @nodoc
abstract mixin class _$PurchaseReceiptEntityCopyWith<$Res> implements $PurchaseReceiptEntityCopyWith<$Res> {
  factory _$PurchaseReceiptEntityCopyWith(_PurchaseReceiptEntity value, $Res Function(_PurchaseReceiptEntity) _then) = __$PurchaseReceiptEntityCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class __$PurchaseReceiptEntityCopyWithImpl<$Res>
    implements _$PurchaseReceiptEntityCopyWith<$Res> {
  __$PurchaseReceiptEntityCopyWithImpl(this._self, this._then);

  final _PurchaseReceiptEntity _self;
  final $Res Function(_PurchaseReceiptEntity) _then;

/// Create a copy of PurchaseReceiptEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_PurchaseReceiptEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
