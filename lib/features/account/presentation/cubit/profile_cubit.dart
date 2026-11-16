import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/authentication/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/authentication/domain/use_cases/use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'profile_state.dart';

/// Holds the signed-in user's profile for the authenticated part of the app.
///
/// Created once above the tab bar, so the fetch runs on login and on every cold
/// start, and the nav bar avatar and Account screen read the same instance.
@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._getProfile, this._logout, this._getAccountStatistics)
    : super(const ProfileState()) {
    profileManager = .new(
      accessor: (
        getPartialState: (state) => state.profileRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(profileRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _getProfile(),
      refreshInBackground: true,
    );

    statisticsManager = .new(
      accessor: (
        getPartialState: (state) => state.statisticsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(statisticsRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _getAccountStatistics(),
      refreshInBackground: true,
    );

    logoutManager = .new(
      accessor: (
        getPartialState: (state) => state.logoutRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(logoutRequest: partial),
      ),
      emit: _emitIfOpen,
    );
  }

  final GetProfileUseCase _getProfile;
  final LogoutUseCase _logout;
  final GetAccountStatisticsUseCase _getAccountStatistics;

  late final AsyncRequestManager<ProfileState, ProfileEntity> profileManager;
  late final AsyncRequestManager<ProfileState, ProfileStatsEntity> statisticsManager;
  late final AsyncRequestManager<ProfileState, void> logoutManager;

  /// The freshly fetched user, or null until the first fetch lands.
  ///
  /// Callers that need a user before then fall back to the one cached at login.
  UserEntity? get user => profileManager.data?.user;

  /// Re-fetches the profile and the counters, e.g. after a pull-to-refresh or
  /// a purchase that changes one of them.
  ///
  /// Both refresh in the background: once loaded, what is on screen stays
  /// there until the new data swaps in, and a failure keeps it (the Account
  /// screen reports it).
  Future<void> refresh() async {
    if (isClosed) return;
    await Future.wait([profileManager.refresh(), statisticsManager.refresh()]);
  }

  /// Refresh on entering Account and returning from its nested screens. Joins
  /// a refresh already running rather than sending another.
  Future<void> refreshStatistics() async {
    if (isClosed) return;
    await statisticsManager.refresh();
  }

  void _emitIfOpen(ProfileState nextState) {
    if (!isClosed) emit(nextState);
  }

  /// Shows a profile the server just saved (Account Information hands it
  /// over after an edit), without fetching it again.
  void replaceProfile(ProfileEntity profile) => profileManager.update((_) => profile);

  Future<void> logout() => logoutManager.execute(_logout());
}
