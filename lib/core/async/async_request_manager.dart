import 'package:flutter/foundation.dart';

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
class AsyncRequestManager<TWholeState, TPartialState> {
  final AsyncStateAccessor<TWholeState, TPartialState> _accessor;
  final void Function(TWholeState) _emit;
  final AsyncTask<TPartialState>? _defaultRequest;
  AsyncTask<TPartialState>? _lastExecutedRequest;

  AsyncRequestManager({
    required AsyncStateAccessor<TWholeState, TPartialState> accessor,
    required void Function(TWholeState) emit,
    bool autoExecute = false,
    AsyncTask<TPartialState>? defaultRequest,
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

  /// Executes an async operation and automatically manages the state transitions
  Future<void> execute([AsyncTask<TPartialState>? request]) async {
    final actualRequest = request ?? _defaultRequest;
    assert(
      actualRequest != null,
      'Either provide a request parameter or set defaultRequest in constructor',
    );

    // Track the last executed request for refresh functionality
    _lastExecutedRequest = actualRequest;

    // Set loading state
    _emitPartial(const AsyncState.loading());

    // Execute the request and handle the result
    final result = await actualRequest!.run();
    result.fold(
      (failure) {
        debugPrint('AsyncRequestManager: Error: $failure');
        _emitPartial(AsyncState.error(failure));
      },
      (data) => _emitPartial(AsyncState.success(data)),
    );
  }

  /// Resets the state to idle
  void reset() {
    _emitPartial(const AsyncState.idle());
  }

  /// Refreshes the data by re-executing the last executed request.
  /// Throws an assertion error if refresh is not available
  /// (no request has been executed yet, or state is loading/idle).
  Future<void> refresh() async {
    assert(
      canRefresh,
      'Cannot refresh: ${_lastExecutedRequest == null
          ? 'no request has been executed yet'
          : isLoading
          ? 'request is already loading'
          : 'no data to refresh (state is idle)'}',
    );

    // Re-execute the last executed request
    await execute(_lastExecutedRequest);
  }

  /// Whether the request is currently loading
  bool get isLoading => state is AsyncLoading<TPartialState>;

  /// Whether the request has completed successfully
  bool get isSuccess => state is AsyncSuccess<TPartialState>;

  /// Whether the request has failed
  bool get isError => state is AsyncError<TPartialState>;

  /// Whether the request is in idle state
  bool get isIdle => state is AsyncIdle<TPartialState>;

  /// Whether refresh is available (a request has been executed and state is not loading or idle)
  bool get canRefresh => _lastExecutedRequest != null && !isLoading && !isIdle;

  /// Gets the data if the request was successful, null otherwise
  TPartialState? get data => switch (state) {
    AsyncSuccess<TPartialState>(:final data) => data,
    _ => null,
  };

  /// Gets the failure if the request failed, null otherwise
  Failure? get failure => switch (state) {
    AsyncError<TPartialState>(:final failure) => failure,
    _ => null,
  };
}
