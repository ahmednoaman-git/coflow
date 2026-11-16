import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snackbar_cubit.freezed.dart';

@freezed
abstract class SnackbarState with _$SnackbarState {
  const factory SnackbarState({
    /// The snackbar on screen, if any.
    SnackbarItem? current,

    /// Snackbars waiting their turn, oldest first.
    @Default(<SnackbarItem>[]) List<SnackbarItem> queue,
  }) = _SnackbarState;
}

/// App-wide snackbar queue: shows one snackbar at a time, in the order they
/// were raised. Provided by [SnackbarHost]; raise snackbars through the
/// `context.show*SnackBar` helpers rather than reading this directly.
class SnackbarCubit extends Cubit<SnackbarState> {
  SnackbarCubit() : super(const SnackbarState());

  static const defaultDuration = Duration(seconds: 3);

  /// Older pending snackbars are dropped past this, so a burst of failures
  /// doesn't keep the screen busy long after the user has moved on.
  static const _maxQueued = 2;

  int _nextId = 0;

  void show(String message, SnackbarType type, {Duration? duration}) {
    if (message.trim().isEmpty) return;

    // Repeating what is already showing (or about to) only stretches the queue.
    bool isSame(SnackbarItem? item) => item?.message == message && item?.type == type;
    if (isSame(state.current) || state.queue.any(isSame)) return;

    final item = SnackbarItem(
      id: _nextId++,
      message: message,
      type: type,
      duration: duration ?? defaultDuration,
    );

    if (state.current == null) {
      emit(state.copyWith(current: item));
      return;
    }

    final queue = [...state.queue, item];
    if (queue.length > _maxQueued) queue.removeAt(0);
    emit(state.copyWith(queue: queue));
  }

  /// Dismisses the snackbar with [id] if it is the one on screen, then shows
  /// the next queued one.
  void dismiss(int id) {
    if (state.current?.id != id) return;

    if (state.queue.isEmpty) {
      emit(state.copyWith(current: null));
      return;
    }

    final [next, ...rest] = state.queue;
    emit(state.copyWith(current: next, queue: rest));
  }

  void clear() => emit(const SnackbarState());
}
