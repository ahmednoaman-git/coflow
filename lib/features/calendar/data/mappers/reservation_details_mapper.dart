import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/activity_line/data/mappers/mappers.dart';

import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class ReservationDetailsMapper {
  static ReservationDetailsEntity toEntity(ReservationDetailsModel model) {
    return ReservationDetailsEntity(
      facilityId: model.facilityId,
      facilityName: model.facilityName,
      facilityLogoUrl: model.facilityLogo,
      facility: model.facility == null
          ? null
          : ActivityLineMapper.toFacilityEntity(model.facility!),
      slot: FacilitySessionDetailsMapper.toEntity(model.slot),
    );
  }
}
