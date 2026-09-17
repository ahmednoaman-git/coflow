import 'async_request_manager.dart';
import 'async_state.dart';
import 'types.dart';

/// Coordinates a first page and subsequent pages without discarding loaded data
/// when an append fails. [TData] owns both the items and pagination metadata.
///
/// Use [firstPageManager] and [nextPageManager] with AsyncHandler, and invoke
/// request actions on this manager. A new [execute] invalidates outstanding
/// requests; pass a closure capturing immutable filters to change the query.
class PaginatedRequestManager<TWholeState, TData> {
  PaginatedRequestManager({
    required AsyncStateAccessor<TWholeState, TData> accessor,
    required AsyncStateAccessor<TWholeState, void> nextPageAccessor,
    required void Function(TWholeState) emit,
    required AsyncTask<TData> Function(int page) requestPage,
    required int? Function(TData data) nextPageOf,
    required TData Function(TData current, TData next) merge,
    bool autoExecute = false,
  }) : _accessor = accessor,
       _nextPageAccessor = nextPageAccessor,
       _emit = emit,
       _requestPage = requestPage,
       _nextPageOf = nextPageOf,
       _merge = merge {
    _createManagers();
    if (autoExecute) Future.microtask(() => execute());
  }

  final AsyncStateAccessor<TWholeState, TData> _accessor;
  final AsyncStateAccessor<TWholeState, void> _nextPageAccessor;
  final void Function(TWholeState) _emit;
  final int? Function(TData) _nextPageOf;
  final TData Function(TData, TData) _merge;
  AsyncTask<TData> Function(int) _requestPage;
  int _generation = 0;
  bool _disposed = false;
  bool _appendInFlight = false;

  late AsyncRequestManager<TWholeState, TData> _firstPageManager;
  late AsyncRequestManager<TWholeState, void> _nextPageManager;

  AsyncRequestManager<TWholeState, TData> get firstPageManager => _firstPageManager;
  AsyncRequestManager<TWholeState, void> get nextPageManager => _nextPageManager;
  AsyncState<TData> get state => _firstPageManager.state;
  TData? get data => _firstPageManager.data;
  bool get isLoadingMore => _nextPageManager.isLoading;
  bool get hasNextPage => switch (state) {
    AsyncSuccess<TData>(:final data) => _nextPageOf(data) != null,
    _ => false,
  };

  bool _isCurrent(int generation) => !_disposed && generation == _generation;

  void _createManagers() {
    final generation = _generation;
    void guardedEmit(TWholeState state) {
      if (_isCurrent(generation)) _emit(state);
    }

    _firstPageManager = AsyncRequestManager(accessor: _accessor, emit: guardedEmit);
    _nextPageManager = AsyncRequestManager(accessor: _nextPageAccessor, emit: guardedEmit);
  }

  /// Starts at page one. Omit [requestPage] to retain the current query.
  Future<void> execute({AsyncTask<TData> Function(int page)? requestPage}) async {
    if (_disposed) return;
    if (requestPage != null) _requestPage = requestPage;
    _generation++;
    _appendInFlight = false;
    _createManagers();
    _nextPageManager.reset();
    await _firstPageManager.execute(_requestPage(1));
  }

  /// Reloads page one using the same query and invalidates outstanding appends.
  Future<void> refresh() => execute();

  /// Appends the next page, or retries it after a failure. Duplicate requests,
  /// requests before page one succeeds, and requests past the end are ignored.
  Future<void> loadMore() async {
    if (_disposed || _appendInFlight) return;
    final current = state;
    if (current is! AsyncSuccess<TData>) return;
    final page = _nextPageOf(current.data);
    if (page == null) return;

    final generation = _generation;
    final requestPage = _requestPage;
    _appendInFlight = true;
    try {
      await _nextPageManager.execute(
        requestPage(page).map((next) {
          if (!_isCurrent(generation)) return;
          final merged = _merge(current.data, next);
          _emit(_accessor.setWholeState(_accessor.getWholeState(), AsyncState.success(merged)));
        }),
      );
    } finally {
      if (_isCurrent(generation)) _appendInFlight = false;
    }
  }

  /// Clears both states and invalidates outstanding requests, keeping the query.
  void reset() {
    if (_disposed) return;
    _generation++;
    _appendInFlight = false;
    _createManagers();
    _firstPageManager.reset();
    _nextPageManager.reset();
  }

  /// Prevents further requests and state emissions, including late responses.
  void dispose() {
    _disposed = true;
    _generation++;
  }
}
