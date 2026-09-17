import 'package:coflow_users_v2/features/authentication/data/mappers/mappers.dart';

import '../../domain/entities/entities.dart';
import '../models/models.dart';

/// Maps identity and the authoritative Account counters independently.
abstract final class ProfileMapper {
  static ProfileEntity toEntity(ProfileModel model) {
    return ProfileEntity(user: AuthMapper.toUserEntity(model.user));
  }

  static ProfileStatsEntity statsToEntity(AccountStatisticsModel model) => ProfileStatsEntity(
    calendarEntries: model.calendars,
    businesses: model.profiles,
    purchases: model.purchases,
    gifts: model.gifts,
  );
}
