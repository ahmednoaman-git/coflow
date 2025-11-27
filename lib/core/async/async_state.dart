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
}
