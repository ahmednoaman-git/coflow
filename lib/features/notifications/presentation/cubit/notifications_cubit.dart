import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'notifications_state.dart';

/// The notifications list. Whatever it shows counts as seen, which clears the
/// bell's dot.
@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._getNotifications, this._markSeen) : super(const NotificationsState()) {
    notificationsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.notificationsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(notificationsRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _getNotifications().flatMap(
        // Marking is best effort: a cache failure mustn't hide the list.
        (notifications) => _markSeen(
          notifications,
        ).map((_) => notifications).orElse((_) => TaskEither.right(notifications)),
      ),
      refreshInBackground: true,
    );
  }

  final GetNotificationsUseCase _getNotifications;
  final MarkNotificationsSeenUseCase _markSeen;

  late final AsyncRequestManager<NotificationsState, List<AppNotificationEntity>>
  notificationsManager;

  Future<void> refresh() => notificationsManager.refresh();

  void _emitIfOpen(NotificationsState state) {
    if (!isClosed) emit(state);
  }
}

/// Whether the Account bell shows its dot.
@injectable
class NotificationsBadgeCubit extends Cubit<NotificationsBadgeState> {
  NotificationsBadgeCubit(this._hasUnseen) : super(const NotificationsBadgeState()) {
    unseenManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.unseenRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(unseenRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _hasUnseen(),
      refreshInBackground: true,
    );
  }

  final HasUnseenNotificationsUseCase _hasUnseen;

  late final AsyncRequestManager<NotificationsBadgeState, bool> unseenManager;

  bool get hasUnseen => unseenManager.data ?? false;

  Future<void> refresh() => unseenManager.refresh();

  void _emitIfOpen(NotificationsBadgeState state) {
    if (!isClosed) emit(state);
  }
}
