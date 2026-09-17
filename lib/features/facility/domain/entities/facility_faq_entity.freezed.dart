// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_faq_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityFaqEntity {

 int get id; String get question; String get answer;
/// Create a copy of FacilityFaqEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityFaqEntityCopyWith<FacilityFaqEntity> get copyWith => _$FacilityFaqEntityCopyWithImpl<FacilityFaqEntity>(this as FacilityFaqEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityFaqEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,id,question,answer);

@override
String toString() {
  return 'FacilityFaqEntity(id: $id, question: $question, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $FacilityFaqEntityCopyWith<$Res>  {
  factory $FacilityFaqEntityCopyWith(FacilityFaqEntity value, $Res Function(FacilityFaqEntity) _then) = _$FacilityFaqEntityCopyWithImpl;
@useResult
$Res call({
 int id, String question, String answer
});




}
/// @nodoc
class _$FacilityFaqEntityCopyWithImpl<$Res>
    implements $FacilityFaqEntityCopyWith<$Res> {
  _$FacilityFaqEntityCopyWithImpl(this._self, this._then);

  final FacilityFaqEntity _self;
  final $Res Function(FacilityFaqEntity) _then;

/// Create a copy of FacilityFaqEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? question = null,Object? answer = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityFaqEntity].
extension FacilityFaqEntityPatterns on FacilityFaqEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityFaqEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityFaqEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityFaqEntity value)  $default,){
final _that = this;
switch (_that) {
case _FacilityFaqEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityFaqEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityFaqEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String question,  String answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityFaqEntity() when $default != null:
return $default(_that.id,_that.question,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String question,  String answer)  $default,) {final _that = this;
switch (_that) {
case _FacilityFaqEntity():
return $default(_that.id,_that.question,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String question,  String answer)?  $default,) {final _that = this;
switch (_that) {
case _FacilityFaqEntity() when $default != null:
return $default(_that.id,_that.question,_that.answer);case _:
  return null;

}
}

}

/// @nodoc


class _FacilityFaqEntity implements FacilityFaqEntity {
  const _FacilityFaqEntity({required this.id, required this.question, required this.answer});
  

@override final  int id;
@override final  String question;
@override final  String answer;

/// Create a copy of FacilityFaqEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityFaqEntityCopyWith<_FacilityFaqEntity> get copyWith => __$FacilityFaqEntityCopyWithImpl<_FacilityFaqEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityFaqEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,id,question,answer);

@override
String toString() {
  return 'FacilityFaqEntity(id: $id, question: $question, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$FacilityFaqEntityCopyWith<$Res> implements $FacilityFaqEntityCopyWith<$Res> {
  factory _$FacilityFaqEntityCopyWith(_FacilityFaqEntity value, $Res Function(_FacilityFaqEntity) _then) = __$FacilityFaqEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String question, String answer
});




}
/// @nodoc
class __$FacilityFaqEntityCopyWithImpl<$Res>
    implements _$FacilityFaqEntityCopyWith<$Res> {
  __$FacilityFaqEntityCopyWithImpl(this._self, this._then);

  final _FacilityFaqEntity _self;
  final $Res Function(_FacilityFaqEntity) _then;

/// Create a copy of FacilityFaqEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? question = null,Object? answer = null,}) {
  return _then(_FacilityFaqEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
