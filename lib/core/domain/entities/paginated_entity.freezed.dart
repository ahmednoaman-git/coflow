// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginatedEntity<T> {

 List<T> get items; int get currentPage; int get lastPage; int get total;
/// Create a copy of PaginatedEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedEntityCopyWith<T, PaginatedEntity<T>> get copyWith => _$PaginatedEntityCopyWithImpl<T, PaginatedEntity<T>>(this as PaginatedEntity<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedEntity<T>&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),currentPage,lastPage,total);

@override
String toString() {
  return 'PaginatedEntity<$T>(items: $items, currentPage: $currentPage, lastPage: $lastPage, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaginatedEntityCopyWith<T,$Res>  {
  factory $PaginatedEntityCopyWith(PaginatedEntity<T> value, $Res Function(PaginatedEntity<T>) _then) = _$PaginatedEntityCopyWithImpl;
@useResult
$Res call({
 List<T> items, int currentPage, int lastPage, int total
});




}
/// @nodoc
class _$PaginatedEntityCopyWithImpl<T,$Res>
    implements $PaginatedEntityCopyWith<T, $Res> {
  _$PaginatedEntityCopyWithImpl(this._self, this._then);

  final PaginatedEntity<T> _self;
  final $Res Function(PaginatedEntity<T>) _then;

/// Create a copy of PaginatedEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? currentPage = null,Object? lastPage = null,Object? total = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedEntity].
extension PaginatedEntityPatterns<T> on PaginatedEntity<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedEntity<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedEntity<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedEntity<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> items,  int currentPage,  int lastPage,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedEntity() when $default != null:
return $default(_that.items,_that.currentPage,_that.lastPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> items,  int currentPage,  int lastPage,  int total)  $default,) {final _that = this;
switch (_that) {
case _PaginatedEntity():
return $default(_that.items,_that.currentPage,_that.lastPage,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> items,  int currentPage,  int lastPage,  int total)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedEntity() when $default != null:
return $default(_that.items,_that.currentPage,_that.lastPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _PaginatedEntity<T> extends PaginatedEntity<T> {
  const _PaginatedEntity({required final  List<T> items, required this.currentPage, required this.lastPage, required this.total}): _items = items,super._();
  

 final  List<T> _items;
@override List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int currentPage;
@override final  int lastPage;
@override final  int total;

/// Create a copy of PaginatedEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedEntityCopyWith<T, _PaginatedEntity<T>> get copyWith => __$PaginatedEntityCopyWithImpl<T, _PaginatedEntity<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedEntity<T>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),currentPage,lastPage,total);

@override
String toString() {
  return 'PaginatedEntity<$T>(items: $items, currentPage: $currentPage, lastPage: $lastPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaginatedEntityCopyWith<T,$Res> implements $PaginatedEntityCopyWith<T, $Res> {
  factory _$PaginatedEntityCopyWith(_PaginatedEntity<T> value, $Res Function(_PaginatedEntity<T>) _then) = __$PaginatedEntityCopyWithImpl;
@override @useResult
$Res call({
 List<T> items, int currentPage, int lastPage, int total
});




}
/// @nodoc
class __$PaginatedEntityCopyWithImpl<T,$Res>
    implements _$PaginatedEntityCopyWith<T, $Res> {
  __$PaginatedEntityCopyWithImpl(this._self, this._then);

  final _PaginatedEntity<T> _self;
  final $Res Function(_PaginatedEntity<T>) _then;

/// Create a copy of PaginatedEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? currentPage = null,Object? lastPage = null,Object? total = null,}) {
  return _then(_PaginatedEntity<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
