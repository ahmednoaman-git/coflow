import 'package:coflow_users_v2/features/authentication/domain/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

/// The signed-in user's identity, loaded separately from Account statistics.
@freezed
abstract class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required UserEntity user,
  }) = _ProfileEntity;
}

/// The four headline counters on the Account screen.
///
/// These are the backend's totals from `account-statistics`; their filtering
/// semantics are owned by that endpoint, not inferred from login counters.
@freezed
abstract class ProfileStatsEntity with _$ProfileStatsEntity {
  const factory ProfileStatsEntity({
    required int calendarEntries,
    required int businesses,
    required int purchases,
    required int gifts,
  }) = _ProfileStatsEntity;
}
