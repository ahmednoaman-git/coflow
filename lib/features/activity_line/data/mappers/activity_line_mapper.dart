import 'package:coflow_users_v2/core/core.dart';

import '../../domain/entities/entities.dart';
import '../models/models.dart';

/// Mapper for converting activity line data models to entities.
abstract final class ActivityLineMapper {
  /// Maps [FacilitiesResponseModel] to [ActivityLineFacilitiesEntity].
  static ActivityLineFacilitiesEntity toFacilitiesEntity(
    FacilitiesResponseModel model,
  ) {
    return ActivityLineFacilitiesEntity(
      facilities: model.facilities.map(toFacilityEntity).toList(),
      tags: model.tags.map(toTagWithCountEntity).toList(),
    );
  }

  /// Maps [FacilityModel] to [CollapsedFacilityEntity].
  static CollapsedFacilityEntity toFacilityEntity(FacilityModel model) {
    return CollapsedFacilityEntity(
      id: model.id,
      name: model.name,
      description: model.title,
      statusMessage: model.statusMsg,
      logoUrl: model.logo,
      coverUrl: model.cover,
      likeCount: model.reviewsCount,
      activityLine: ActivityLineEntity.fromId(model.activityLine.id),
      tags: model.tags?.map(toTagEntity).toList() ?? [],
      type: FacilityType.fromString(model.facilityType ?? ''),
      status: FacilityStatus.fromString(model.status),
      subscriptionStatus: SubscriptionStatus.fromString(model.subscription),
      paymentType: PaymentType.fromString(model.paymentType),
      views: model.views,
    );
  }

  /// Maps [TagModel] to [TagEntity].
  static TagEntity toTagEntity(TagModel model) {
    return TagEntity(id: model.id, name: model.name);
  }

  /// Maps [TagWithCountModel] to [TagWithCountEntity].
  static TagWithCountEntity toTagWithCountEntity(TagWithCountModel model) {
    return TagWithCountEntity(
      id: model.id,
      name: model.name,
      count: model.count,
    );
  }
}
