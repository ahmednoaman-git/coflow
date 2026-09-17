import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    @Default('') String query,
    @Default(SearchType.business) SearchType selectedType,
    @Default(AsyncState.idle())
    AsyncState<PaginatedEntity<CollapsedFacilityEntity>> businessesRequest,
    @Default(AsyncState.idle())
    AsyncState<PaginatedEntity<SearchInstructorEntity>> instructorsRequest,
    @Default(AsyncState.idle()) AsyncState<PaginatedEntity<SearchServiceEntity>> servicesRequest,

    /// True while a follow-up page is on its way for [selectedType]. Kept apart
    /// from the request's own state so the list stays on screen underneath.
    @Default(false) bool isLoadingMore,
  }) = _SearchState;

  /// Whether the query is still too short for the backend to accept.
  bool get isQueryTooShort => query.length < SearchConstants.minQueryLength;

  /// Result count for a tab's badge, or null while it is unknown (idle,
  /// loading or failed).
  int? countFor(SearchType type) => switch (type) {
    SearchType.business => _totalOf(businessesRequest),
    SearchType.instructor => _totalOf(instructorsRequest),
    SearchType.service => _totalOf(servicesRequest),
  };

  static int? _totalOf<T>(AsyncState<PaginatedEntity<T>> state) => switch (state) {
    AsyncSuccess(:final data) => data.total,
    _ => null,
  };
}
