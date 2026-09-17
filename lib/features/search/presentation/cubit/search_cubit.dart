import 'dart:async';

import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import 'search_state.dart';

/// Drives the search screen.
///
/// Typing is debounced, then all three result sets are requested in parallel —
/// the tab badges show every count at once, so the screen cannot wait for the
/// user to open a tab before asking for it.
@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchBusinesses, this._searchInstructors, this._searchServices)
    : super(const SearchState()) {
    businessesManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.businessesRequest,
        getWholeState: () => state,
        setWholeState: _setBusinesses,
      ),
      emit: emit,
    );

    instructorsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.instructorsRequest,
        getWholeState: () => state,
        setWholeState: _setInstructors,
      ),
      emit: emit,
    );

    servicesManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.servicesRequest,
        getWholeState: () => state,
        setWholeState: _setServices,
      ),
      emit: emit,
    );
  }

  final SearchBusinessesUseCase _searchBusinesses;
  final SearchInstructorsUseCase _searchInstructors;
  final SearchServicesUseCase _searchServices;

  late final AsyncRequestManager<SearchState, PaginatedEntity<CollapsedFacilityEntity>>
  businessesManager;
  late final AsyncRequestManager<SearchState, PaginatedEntity<SearchInstructorEntity>>
  instructorsManager;
  late final AsyncRequestManager<SearchState, PaginatedEntity<SearchServiceEntity>> servicesManager;

  Timer? _debounce;

  static SearchState _setBusinesses(
    SearchState state,
    AsyncState<PaginatedEntity<CollapsedFacilityEntity>> partial,
  ) => state.copyWith(businessesRequest: partial);

  static SearchState _setInstructors(
    SearchState state,
    AsyncState<PaginatedEntity<SearchInstructorEntity>> partial,
  ) => state.copyWith(instructorsRequest: partial);

  static SearchState _setServices(
    SearchState state,
    AsyncState<PaginatedEntity<SearchServiceEntity>> partial,
  ) => state.copyWith(servicesRequest: partial);

  /// Called on every keystroke. Requests go out once typing pauses and the
  /// query is long enough for the backend to accept it.
  void queryChanged(String rawQuery) {
    final query = rawQuery.trim();
    if (query == state.query) return;

    emit(state.copyWith(query: query, isLoadingMore: false));
    _debounce?.cancel();

    if (state.isQueryTooShort) {
      businessesManager.reset();
      instructorsManager.reset();
      servicesManager.reset();
      return;
    }

    _debounce = Timer(SearchConstants.debounce, search);
  }

  /// Runs all three searches for the current query, from the first page.
  void search() {
    if (state.isQueryTooShort) return;

    final query = state.query;
    emit(state.copyWith(isLoadingMore: false));

    businessesManager.execute(
      _searchBusinesses(SearchDto(query: query, type: SearchType.business)),
    );
    instructorsManager.execute(
      _searchInstructors(SearchDto(query: query, type: SearchType.instructor)),
    );
    servicesManager.execute(
      _searchServices(SearchDto(query: query, type: SearchType.service)),
    );
  }

  void typeSelected(SearchType type) {
    if (type == state.selectedType) return;
    emit(state.copyWith(selectedType: type, isLoadingMore: false));
  }

  /// Appends the next page of the tab currently on screen. A no-op when that
  /// tab has no more pages, is not showing results, or is already fetching.
  Future<void> loadMore() async {
    switch (state.selectedType) {
      case SearchType.business:
        await _loadMore(
          current: state.businessesRequest,
          request: (page) => _searchBusinesses(
            SearchDto(query: state.query, type: SearchType.business, page: page),
          ),
          setPartial: _setBusinesses,
        );
      case SearchType.instructor:
        await _loadMore(
          current: state.instructorsRequest,
          request: (page) => _searchInstructors(
            SearchDto(query: state.query, type: SearchType.instructor, page: page),
          ),
          setPartial: _setInstructors,
        );
      case SearchType.service:
        await _loadMore(
          current: state.servicesRequest,
          request: (page) => _searchServices(
            SearchDto(query: state.query, type: SearchType.service, page: page),
          ),
          setPartial: _setServices,
        );
    }
  }

  /// Pages are appended by writing the merged result straight into the
  /// request's slot: routing this through the manager would flip the tab to
  /// its loading state and pull the visible results out from under the user.
  Future<void> _loadMore<T>({
    required AsyncState<PaginatedEntity<T>> current,
    required AsyncTask<PaginatedEntity<T>> Function(int page) request,
    required SearchState Function(SearchState, AsyncState<PaginatedEntity<T>>) setPartial,
  }) async {
    if (state.isLoadingMore || current is! AsyncSuccess<PaginatedEntity<T>>) return;

    final loaded = current.data;
    if (!loaded.hasMore) return;

    final query = state.query;
    emit(state.copyWith(isLoadingMore: true));

    final result = await request(loaded.currentPage + 1).run();

    // The query moved on while the page was in flight — its results would no
    // longer match what is on screen.
    if (isClosed || query != state.query) return;

    result.fold(
      // A failed page leaves the list as it was; scrolling again retries.
      (_) => emit(state.copyWith(isLoadingMore: false)),
      (next) => emit(
        setPartial(
          state,
          AsyncState.success(loaded.mergedWith(next)),
        ).copyWith(isLoadingMore: false),
      ),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
