import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure.dart';

part 'async_state.freezed.dart';

/// Represents the state of an async operation
@freezed
sealed class AsyncState<T> with _$AsyncState<T> {
  const AsyncState._();

  /// Initial state - no operation has started
  const factory AsyncState.idle() = AsyncIdle<T>;

  /// Operation is in progress, with nothing to show yet
  const factory AsyncState.loading() = AsyncLoading<T>;

  /// Data is available.
  ///
  /// Data stays here while it is being revalidated or edited, so anything that
  /// renders a success keeps rendering it:
  /// - [isRefreshing]: a background refresh is running (see
  ///   `AsyncRequestManager.refreshInBackground`); the new data replaces this
  ///   when it lands.
  /// - [failure]: the last thing done to this data failed — a background
  ///   refresh, or an optimistic edit that was rolled back — and [data] is
  ///   what was on screen before it. A one-shot signal for a snackbar, cleared
  ///   by the next change.
  const factory AsyncState.success(
    T data, {
    @Default(false) bool isRefreshing,
    Failure? failure,
  }) = AsyncSuccess<T>;

  /// Operation failed with a failure, and there is no data to show
  const factory AsyncState.error(Failure failure) = AsyncError<T>;

  bool get isIdle => this is AsyncIdle<T>;
  bool get isLoading => this is AsyncLoading<T>;
  bool get isSuccess => this is AsyncSuccess<T>;
  bool get isError => this is AsyncError<T>;

  /// Whether data is on screen while a background refresh runs.
  bool get isRefreshing => switch (this) {
    AsyncSuccess(:final isRefreshing) => isRefreshing,
    _ => false,
  };

  /// Returns the data if in success state, otherwise returns null.
  T? get dataOrNull => switch (this) {
    AsyncSuccess(:final data) => data,
    _ => null,
  };

  /// Returns the data if in success state, otherwise returns the provided default.
  T dataOr(T defaultValue) => dataOrNull ?? defaultValue;

  /// Returns the failure if in error state, otherwise returns null.
  ///
  /// A failure kept beside data ([AsyncSuccess.failure]) is not included: the
  /// request still has data to show.
  Failure? get failureOrNull => switch (this) {
    AsyncError(:final failure) => failure,
    _ => null,
  };

  /// Returns the failure if in error state, otherwise returns the provided default.
  Failure failureOr(Failure defaultValue) => failureOrNull ?? defaultValue;
}
