// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 String get query; SearchType get selectedType; AsyncState<PaginatedEntity<CollapsedFacilityEntity>> get businessesRequest; AsyncState<PaginatedEntity<SearchInstructorEntity>> get instructorsRequest; AsyncState<PaginatedEntity<SearchServiceEntity>> get servicesRequest;/// True while a follow-up page is on its way for [selectedType]. Kept apart
/// from the request's own state so the list stays on screen underneath.
 bool get isLoadingMore;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.businessesRequest, businessesRequest) || other.businessesRequest == businessesRequest)&&(identical(other.instructorsRequest, instructorsRequest) || other.instructorsRequest == instructorsRequest)&&(identical(other.servicesRequest, servicesRequest) || other.servicesRequest == servicesRequest)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,query,selectedType,businessesRequest,instructorsRequest,servicesRequest,isLoadingMore);

@override
String toString() {
  return 'SearchState(query: $query, selectedType: $selectedType, businessesRequest: $businessesRequest, instructorsRequest: $instructorsRequest, servicesRequest: $servicesRequest, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String query, SearchType selectedType, AsyncState<PaginatedEntity<CollapsedFacilityEntity>> businessesRequest, AsyncState<PaginatedEntity<SearchInstructorEntity>> instructorsRequest, AsyncState<PaginatedEntity<SearchServiceEntity>> servicesRequest, bool isLoadingMore
});


$AsyncStateCopyWith<PaginatedEntity<CollapsedFacilityEntity>, $Res> get businessesRequest;$AsyncStateCopyWith<PaginatedEntity<SearchInstructorEntity>, $Res> get instructorsRequest;$AsyncStateCopyWith<PaginatedEntity<SearchServiceEntity>, $Res> get servicesRequest;

}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? selectedType = null,Object? businessesRequest = null,Object? instructorsRequest = null,Object? servicesRequest = null,Object? isLoadingMore = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as SearchType,businessesRequest: null == businessesRequest ? _self.businessesRequest : businessesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<PaginatedEntity<CollapsedFacilityEntity>>,instructorsRequest: null == instructorsRequest ? _self.instructorsRequest : instructorsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<PaginatedEntity<SearchInstructorEntity>>,servicesRequest: null == servicesRequest ? _self.servicesRequest : servicesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<PaginatedEntity<SearchServiceEntity>>,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<PaginatedEntity<CollapsedFacilityEntity>, $Res> get businessesRequest {
  
  return $AsyncStateCopyWith<PaginatedEntity<CollapsedFacilityEntity>, $Res>(_self.businessesRequest, (value) {
    return _then(_self.copyWith(businessesRequest: value));
  });
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<PaginatedEntity<SearchInstructorEntity>, $Res> get instructorsRequest {
  
  return $AsyncStateCopyWith<PaginatedEntity<SearchInstructorEntity>, $Res>(_self.instructorsRequest, (value) {
    return _then(_self.copyWith(instructorsRequest: value));
  });
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<PaginatedEntity<SearchServiceEntity>, $Res> get servicesRequest {
  
  return $AsyncStateCopyWith<PaginatedEntity<SearchServiceEntity>, $Res>(_self.servicesRequest, (value) {
    return _then(_self.copyWith(servicesRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  SearchType selectedType,  AsyncState<PaginatedEntity<CollapsedFacilityEntity>> businessesRequest,  AsyncState<PaginatedEntity<SearchInstructorEntity>> instructorsRequest,  AsyncState<PaginatedEntity<SearchServiceEntity>> servicesRequest,  bool isLoadingMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.selectedType,_that.businessesRequest,_that.instructorsRequest,_that.servicesRequest,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  SearchType selectedType,  AsyncState<PaginatedEntity<CollapsedFacilityEntity>> businessesRequest,  AsyncState<PaginatedEntity<SearchInstructorEntity>> instructorsRequest,  AsyncState<PaginatedEntity<SearchServiceEntity>> servicesRequest,  bool isLoadingMore)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.query,_that.selectedType,_that.businessesRequest,_that.instructorsRequest,_that.servicesRequest,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  SearchType selectedType,  AsyncState<PaginatedEntity<CollapsedFacilityEntity>> businessesRequest,  AsyncState<PaginatedEntity<SearchInstructorEntity>> instructorsRequest,  AsyncState<PaginatedEntity<SearchServiceEntity>> servicesRequest,  bool isLoadingMore)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.selectedType,_that.businessesRequest,_that.instructorsRequest,_that.servicesRequest,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState extends SearchState {
  const _SearchState({this.query = '', this.selectedType = SearchType.business, this.businessesRequest = const AsyncState.idle(), this.instructorsRequest = const AsyncState.idle(), this.servicesRequest = const AsyncState.idle(), this.isLoadingMore = false}): super._();
  

@override@JsonKey() final  String query;
@override@JsonKey() final  SearchType selectedType;
@override@JsonKey() final  AsyncState<PaginatedEntity<CollapsedFacilityEntity>> businessesRequest;
@override@JsonKey() final  AsyncState<PaginatedEntity<SearchInstructorEntity>> instructorsRequest;
@override@JsonKey() final  AsyncState<PaginatedEntity<SearchServiceEntity>> servicesRequest;
/// True while a follow-up page is on its way for [selectedType]. Kept apart
/// from the request's own state so the list stays on screen underneath.
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.businessesRequest, businessesRequest) || other.businessesRequest == businessesRequest)&&(identical(other.instructorsRequest, instructorsRequest) || other.instructorsRequest == instructorsRequest)&&(identical(other.servicesRequest, servicesRequest) || other.servicesRequest == servicesRequest)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,query,selectedType,businessesRequest,instructorsRequest,servicesRequest,isLoadingMore);

@override
String toString() {
  return 'SearchState(query: $query, selectedType: $selectedType, businessesRequest: $businessesRequest, instructorsRequest: $instructorsRequest, servicesRequest: $servicesRequest, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query, SearchType selectedType, AsyncState<PaginatedEntity<CollapsedFacilityEntity>> businessesRequest, AsyncState<PaginatedEntity<SearchInstructorEntity>> instructorsRequest, AsyncState<PaginatedEntity<SearchServiceEntity>> servicesRequest, bool isLoadingMore
});


@override $AsyncStateCopyWith<PaginatedEntity<CollapsedFacilityEntity>, $Res> get businessesRequest;@override $AsyncStateCopyWith<PaginatedEntity<SearchInstructorEntity>, $Res> get instructorsRequest;@override $AsyncStateCopyWith<PaginatedEntity<SearchServiceEntity>, $Res> get servicesRequest;

}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? selectedType = null,Object? businessesRequest = null,Object? instructorsRequest = null,Object? servicesRequest = null,Object? isLoadingMore = null,}) {
  return _then(_SearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as SearchType,businessesRequest: null == businessesRequest ? _self.businessesRequest : businessesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<PaginatedEntity<CollapsedFacilityEntity>>,instructorsRequest: null == instructorsRequest ? _self.instructorsRequest : instructorsRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<PaginatedEntity<SearchInstructorEntity>>,servicesRequest: null == servicesRequest ? _self.servicesRequest : servicesRequest // ignore: cast_nullable_to_non_nullable
as AsyncState<PaginatedEntity<SearchServiceEntity>>,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<PaginatedEntity<CollapsedFacilityEntity>, $Res> get businessesRequest {
  
  return $AsyncStateCopyWith<PaginatedEntity<CollapsedFacilityEntity>, $Res>(_self.businessesRequest, (value) {
    return _then(_self.copyWith(businessesRequest: value));
  });
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<PaginatedEntity<SearchInstructorEntity>, $Res> get instructorsRequest {
  
  return $AsyncStateCopyWith<PaginatedEntity<SearchInstructorEntity>, $Res>(_self.instructorsRequest, (value) {
    return _then(_self.copyWith(instructorsRequest: value));
  });
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<PaginatedEntity<SearchServiceEntity>, $Res> get servicesRequest {
  
  return $AsyncStateCopyWith<PaginatedEntity<SearchServiceEntity>, $Res>(_self.servicesRequest, (value) {
    return _then(_self.copyWith(servicesRequest: value));
  });
}
}

// dart format on
