// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_service_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacilityServiceLevel {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityServiceLevel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FacilityServiceLevel()';
}


}

/// @nodoc
class $FacilityServiceLevelCopyWith<$Res>  {
$FacilityServiceLevelCopyWith(FacilityServiceLevel _, $Res Function(FacilityServiceLevel) __);
}


/// Adds pattern-matching-related methods to [FacilityServiceLevel].
extension FacilityServiceLevelPatterns on FacilityServiceLevel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FacilityServiceLevelCustom value)?  custom,TResult Function( FacilityServiceLevelAll value)?  allLevels,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FacilityServiceLevelCustom() when custom != null:
return custom(_that);case FacilityServiceLevelAll() when allLevels != null:
return allLevels(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FacilityServiceLevelCustom value)  custom,required TResult Function( FacilityServiceLevelAll value)  allLevels,}){
final _that = this;
switch (_that) {
case FacilityServiceLevelCustom():
return custom(_that);case FacilityServiceLevelAll():
return allLevels(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FacilityServiceLevelCustom value)?  custom,TResult? Function( FacilityServiceLevelAll value)?  allLevels,}){
final _that = this;
switch (_that) {
case FacilityServiceLevelCustom() when custom != null:
return custom(_that);case FacilityServiceLevelAll() when allLevels != null:
return allLevels(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String colorHex)?  custom,TResult Function()?  allLevels,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FacilityServiceLevelCustom() when custom != null:
return custom(_that.name,_that.colorHex);case FacilityServiceLevelAll() when allLevels != null:
return allLevels();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String colorHex)  custom,required TResult Function()  allLevels,}) {final _that = this;
switch (_that) {
case FacilityServiceLevelCustom():
return custom(_that.name,_that.colorHex);case FacilityServiceLevelAll():
return allLevels();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String colorHex)?  custom,TResult? Function()?  allLevels,}) {final _that = this;
switch (_that) {
case FacilityServiceLevelCustom() when custom != null:
return custom(_that.name,_that.colorHex);case FacilityServiceLevelAll() when allLevels != null:
return allLevels();case _:
  return null;

}
}

}

/// @nodoc


class FacilityServiceLevelCustom implements FacilityServiceLevel {
  const FacilityServiceLevelCustom({required this.name, required this.colorHex});
  

 final  String name;
 final  String colorHex;

/// Create a copy of FacilityServiceLevel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityServiceLevelCustomCopyWith<FacilityServiceLevelCustom> get copyWith => _$FacilityServiceLevelCustomCopyWithImpl<FacilityServiceLevelCustom>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityServiceLevelCustom&&(identical(other.name, name) || other.name == name)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex));
}


@override
int get hashCode => Object.hash(runtimeType,name,colorHex);

@override
String toString() {
  return 'FacilityServiceLevel.custom(name: $name, colorHex: $colorHex)';
}


}

/// @nodoc
abstract mixin class $FacilityServiceLevelCustomCopyWith<$Res> implements $FacilityServiceLevelCopyWith<$Res> {
  factory $FacilityServiceLevelCustomCopyWith(FacilityServiceLevelCustom value, $Res Function(FacilityServiceLevelCustom) _then) = _$FacilityServiceLevelCustomCopyWithImpl;
@useResult
$Res call({
 String name, String colorHex
});




}
/// @nodoc
class _$FacilityServiceLevelCustomCopyWithImpl<$Res>
    implements $FacilityServiceLevelCustomCopyWith<$Res> {
  _$FacilityServiceLevelCustomCopyWithImpl(this._self, this._then);

  final FacilityServiceLevelCustom _self;
  final $Res Function(FacilityServiceLevelCustom) _then;

/// Create a copy of FacilityServiceLevel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? colorHex = null,}) {
  return _then(FacilityServiceLevelCustom(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FacilityServiceLevelAll implements FacilityServiceLevel {
  const FacilityServiceLevelAll();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityServiceLevelAll);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FacilityServiceLevel.allLevels()';
}


}




// dart format on
