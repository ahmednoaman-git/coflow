import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure.dart';

part 'async_state.freezed.dart';

/// Represents the state of an async operation
@freezed
sealed class AsyncState<T> with _$AsyncState<T> {
  const AsyncState._();

  /// Initial state - no operation has started
  const factory AsyncState.idle() = AsyncIdle<T>;

  /// Operation is in progress
  const factory AsyncState.loading() = AsyncLoading<T>;

  /// Operation completed successfully with data
  const factory AsyncState.success(T data) = AsyncSuccess<T>;

  /// Operation failed with a failure
  const factory AsyncState.error(Failure failure) = AsyncError<T>;

  bool get isIdle => this is AsyncIdle<T>;
  bool get isLoading => this is AsyncLoading<T>;
  bool get isSuccess => this is AsyncSuccess<T>;
  bool get isError => this is AsyncError<T>;

  /// Returns the data if in success state, otherwise returns null.
  T? get dataOrNull => switch (this) {
    AsyncSuccess(:final data) => data,
    _ => null,
  };

  /// Returns the data if in success state, otherwise returns the provided default.
  T dataOr(T defaultValue) => dataOrNull ?? defaultValue;

  /// Returns the failure if in error state, otherwise returns null.
  Failure? get failureOrNull => switch (this) {
    AsyncError(:final failure) => failure,
    _ => null,
  };

  /// Returns the failure if in error state, otherwise returns the provided default.
  Failure failureOr(Failure defaultValue) => failureOrNull ?? defaultValue;
}
