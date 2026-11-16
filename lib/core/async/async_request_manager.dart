import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import 'async_state.dart';
import 'failure.dart';
import 'types.dart';

/// Accessor for getting and setting AsyncState in a larger state object
typedef AsyncStateAccessor<TWholeState, TPartialState> = ({
  AsyncState<TPartialState> Function(TWholeState) getPartialState,
  TWholeState Function() getWholeState,
  TWholeState Function(TWholeState, AsyncState<TPartialState>) setWholeState,
});

/// Composable async request manager that can be used within Cubits/Blocs
/// to handle async operations and automatically manage loading/success/error states.
///
/// Example usage:
/// ```dart
/// late final submitManager = AsyncRequestManager<MyState, MyData>(
///   accessor: (
///     getPartialState: (state) => state.submitRequest,
///     getWholeState: () => state,
///     setWholeState: (state, partial) => state.copyWith(submitRequest: partial),
///   ),
///   emit: emit,
/// );
/// ```
///
/// **Background refresh** (stale-while-revalidate): with [refreshInBackground],
/// once there is data every later [execute]/[refresh] keeps it on screen —
/// `success(data, isRefreshing: true)` instead of `loading` — and swaps the new
/// data in when it lands. A failure keeps the old data too, as
/// `success(data, failure: ...)`, which `AsyncHandler.onBackgroundError`
/// reports.
///
/// **Optimistic updates**: [mutate] changes the data at once, sends the
/// request, and rolls the change back if it fails. [edit] is the lower-level
/// handle for changes whose request is sent some other way (a debounced
/// toggle, say). Edits still pending are re-applied to whatever a refresh
/// brings back, so a refresh can't undo a change the server hasn't taken yet.
class AsyncRequestManager<TWholeState, TPartialState> {
  final AsyncStateAccessor<TWholeState, TPartialState> _accessor;
  final void Function(TWholeState) _emit;
  final AsyncTask<TPartialState>? _defaultRequest;
  AsyncTask<TPartialState>? _lastExecutedRequest;

  /// Whether a request made while there is data runs in the background,
  /// keeping that data on screen, rather than going back to `loading`.
  ///
  /// Turn it on for data the user comes back to — a tab, a list refreshed on
  /// return or by pull-to-refresh. Leave it off when [execute] is given a
  /// request for *different* data (a new filter or query), where the old data
  /// would be wrong to show meanwhile.
  final bool refreshInBackground;

  /// Bumped by every [execute] and [reset]: a response is only applied while
  /// its request is still the latest.
  int _generation = 0;

  /// The latest [execute], while it runs.
  Future<void>? _inFlight;

  /// The data from the last fetch, which [_edits] are layered on. Only kept
  /// while there are edits; null when there's no data yet.
  (TPartialState,)? _base;

  /// Optimistic changes, in the order they were made.
  final _edits = <OptimisticEdit<TPartialState>>[];

  AsyncRequestManager({
    required AsyncStateAccessor<TWholeState, TPartialState> accessor,
    required void Function(TWholeState) emit,
    bool autoExecute = false,
    AsyncTask<TPartialState>? defaultRequest,
    this.refreshInBackground = false,
  }) : _accessor = accessor,
       _emit = emit,
       _defaultRequest = defaultRequest {
    if (autoExecute) {
      assert(
        defaultRequest != null,
        'defaultRequest must be provided when autoExecute is true',
      );
      // Execute after construction completes
      Future.microtask(() => execute());
    }
  }

  /// Gets the current async state
  AsyncState<TPartialState> get state => _accessor.getPartialState(_accessor.getWholeState());

  AsyncState<TPartialState> getPartialStateFromWhole(TWholeState state) {
    return _accessor.getPartialState(state);
  }

  void _emitPartial(AsyncState<TPartialState> partial) {
    final currentWhole = _accessor.getWholeState();
    final newWhole = _accessor.setWholeState(currentWhole, partial);
    _emit(newWhole);
  }

  /// Executes an async operation and automatically manages the state transitions.
  ///
  /// Shows `loading` — or, with [refreshInBackground] and data already there,
  /// keeps the data with `isRefreshing` set. Only the latest call's response
  /// is applied; an earlier one still out is ignored when it lands.
  Future<void> execute([AsyncTask<TPartialState>? request]) {
    final actualRequest = request ?? _defaultRequest;
    assert(
      actualRequest != null,
      'Either provide a request parameter or set defaultRequest in constructor',
    );

    // Track the last executed request for refresh functionality
    _lastExecutedRequest = actualRequest;

    final run = _run(actualRequest!, ++_generation);
    return _inFlight = run;
  }

  Future<void> _run(AsyncTask<TPartialState> request, int generation) async {
    final inBackground = refreshInBackground && state is AsyncSuccess<TPartialState>;
    switch (state) {
      case AsyncSuccess(:final data) when inBackground:
        _emitPartial(AsyncState.success(data, isRefreshing: true));
      case _:
        _emitPartial(AsyncState<TPartialState>.loading());
    }

    final result = await request.run();
    if (generation != _generation) return;
    _inFlight = null;

    switch (result) {
      case Right(value: final data):
        _land(data);
      case Left(value: final failure):
        debugPrint('AsyncRequestManager: Error: $failure');
        _bakeCommitted();
        _releaseBase();
        switch (state) {
          case AsyncSuccess(:final data) when inBackground:
            _emitPartial(AsyncState.success(data, failure: failure));
          case _:
            _emitPartial(AsyncState.error(failure));
        }
    }
  }

  /// Shows freshly fetched [data], with the edits the server hasn't taken yet
  /// laid over it.
  void _land(TPartialState data) {
    _base = (data,);
    _bakeCommitted();
    final (base,) = _base!;
    _emitPartial(AsyncState.success(_layered(base)));
    _releaseBase();
  }

  /// Resets the state to idle, ignoring any response still out.
  void reset() {
    _generation++;
    _inFlight = null;
    _base = null;
    _edits.removeWhere((edit) => edit._settleIf(edit._committed));
    _emitPartial(AsyncState<TPartialState>.idle());
  }

  /// Re-executes the last executed request (or the default one, if nothing
  /// has run yet) — or joins it, if it is still running.
  Future<void> refresh() {
    assert(canRefresh, 'Cannot refresh: no request has been executed and no default is set');
    return _inFlight ?? execute(_lastExecutedRequest);
  }

  // ---------------------------------------------------------------------------
  // Optimistic updates
  // ---------------------------------------------------------------------------

  /// Applies [apply] to the data at once, sends [request], and rolls the
  /// change back if it fails — reporting the failure beside the data
  /// (see [reportFailure]) unless [reportFailure] is false.
  ///
  /// [apply] must be idempotent and describe the *result* ("remove id 3",
  /// "set isTracked to true"), never a flip: it is re-applied to every
  /// refresh that lands while the request is out. Rolling back simply drops
  /// it, so concurrent mutations on the same data compose.
  ///
  /// Returns the request's result, for callers that want to react further.
  Future<Result<R>> mutate<R>(
    AsyncTask<R> request, {
    required TPartialState Function(TPartialState data) apply,
    bool reportFailure = true,
  }) async {
    final change = edit(apply);
    final result = await request.run();
    switch (result) {
      case Right():
        change.commit();
      case Left(value: final failure):
        change.revert();
        if (reportFailure) this.reportFailure(failure);
    }
    return result;
  }

  /// Starts an optimistic change to the data and shows it at once; the caller
  /// sends the request and then [OptimisticEdit.commit]s or
  /// [OptimisticEdit.revert]s it. Prefer [mutate] when the request is a single
  /// call made right away.
  ///
  /// Made before there is data, the change waits for the data to land.
  OptimisticEdit<TPartialState> edit(TPartialState Function(TPartialState data) apply) {
    if (_edits.isEmpty) {
      _base = switch (state) {
        AsyncSuccess(:final data) => (data,),
        _ => null,
      };
    }
    final edit = OptimisticEdit<TPartialState>._(this, apply);
    _edits.add(edit);
    _republish();
    return edit;
  }

  /// Changes the data in place, as a confirmed change rather than an
  /// optimistic one — e.g. to fold in an entity a mutation returned. Does
  /// nothing without data.
  void update(TPartialState Function(TPartialState data) change) {
    final current = state;
    if (current is! AsyncSuccess<TPartialState>) return;
    if (_base case (final base,)) {
      _base = (change(base),);
      _republish();
    } else {
      _emitPartial(AsyncState.success(change(current.data), isRefreshing: current.isRefreshing));
    }
  }

  /// Reports [failure] beside the data on screen, as
  /// `success(data, failure: failure)`, for `AsyncHandler.onBackgroundError` to surface
  /// without replacing the data. Does nothing without data.
  void reportFailure(Failure failure) {
    final current = state;
    if (current is! AsyncSuccess<TPartialState>) return;
    final AsyncSuccess(:data, :isRefreshing) = current;
    // Through a clean state first, so a listener hears a failure equal to the
    // one already reported.
    if (current.failure != null) {
      _emitPartial(AsyncState.success(data, isRefreshing: isRefreshing));
    }
    _emitPartial(AsyncState.success(data, isRefreshing: isRefreshing, failure: failure));
  }

  TPartialState _layered(TPartialState base) =>
      _edits.fold(base, (data, edit) => edit._apply(data));

  /// Shows the edits over the base again, if there is data on screen.
  void _republish() {
    final current = state;
    if (_base case (final base,) when current is AsyncSuccess<TPartialState>) {
      _emitPartial(AsyncState.success(_layered(base), isRefreshing: current.isRefreshing));
    }
    _releaseBase();
  }

  /// The base is only needed under edits.
  void _releaseBase() {
    if (_edits.isEmpty) _base = null;
  }

  void _commit(OptimisticEdit<TPartialState> edit) {
    if (edit._settled || edit._committed) return;
    edit._committed = true;
    // A fetch still out may have been answered before the server took this,
    // so it stays layered over that fetch's data. Otherwise any later fetch
    // includes it.
    if (_inFlight == null) {
      _bakeCommitted();
      _releaseBase();
    }
  }

  void _revert(OptimisticEdit<TPartialState> edit) {
    if (edit._settled) return;
    edit._settled = true;
    _edits.remove(edit);
    _republish();
  }

  /// Folds committed edits into the base for good, once no fetch that could
  /// have missed them is out.
  void _bakeCommitted() {
    if (_base case (final base,)) {
      var data = base;
      for (final edit in _edits) {
        if (edit._committed) data = edit._apply(data);
      }
      _base = (data,);
    }
    _edits.removeWhere((edit) => edit._settleIf(edit._committed));
  }

  // ---------------------------------------------------------------------------
  // Getters
  // ---------------------------------------------------------------------------

  /// Whether the request is loading with nothing to show yet
  bool get isLoading => state is AsyncLoading<TPartialState>;

  /// Whether data is on screen while a background refresh runs
  bool get isRefreshing => state.isRefreshing;

  /// Whether there is data — including while it refreshes in the background
  bool get isSuccess => state is AsyncSuccess<TPartialState>;

  /// Whether the request has failed with no data to show
  bool get isError => state is AsyncError<TPartialState>;

  /// Whether the request is in idle state
  bool get isIdle => state is AsyncIdle<TPartialState>;

  /// Whether [refresh] has a request to re-run.
  bool get canRefresh => _lastExecutedRequest != null || _defaultRequest != null;

  /// Gets the data if there is any, null otherwise
  TPartialState? get data => state.dataOrNull;

  /// Gets the failure if the request failed with no data to show, null otherwise
  Failure? get failure => state.failureOrNull;
}

/// An optimistic change to an [AsyncRequestManager]'s data, from
/// [AsyncRequestManager.edit]: shown at once, and layered over every fetch
/// that lands until it is settled.
final class OptimisticEdit<T> {
  OptimisticEdit._(this._manager, this._apply);

  final AsyncRequestManager<Object?, T> _manager;
  T Function(T data) _apply;
  bool _committed = false;
  bool _settled = false;

  /// Whether the server's answer is still awaited.
  bool get isPending => !_committed && !_settled;

  /// Replaces the change while it is pending, and shows the new one.
  void update(T Function(T data) apply) {
    if (!isPending) return;
    _apply = apply;
    _manager._republish();
  }

  /// The server took the change: it stays, and stops being re-applied once
  /// no fetch that could have missed it is out.
  void commit() => _manager._commit(this);

  /// The server refused the change: it is dropped, and the data shows what it
  /// would have without it.
  void revert() => _manager._revert(this);

  bool _settleIf(bool condition) {
    if (condition) _settled = true;
    return condition;
  }
}
