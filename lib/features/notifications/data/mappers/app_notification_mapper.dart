import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class AppNotificationMapper {
  /// Newest first, whatever order the server used.
  static List<AppNotificationEntity> toEntities(List<AppNotificationModel> models) =>
      models.map(toEntity).toList()..sort((a, b) => b.id.compareTo(a.id));

  static AppNotificationEntity toEntity(AppNotificationModel model) {
    final facility = model.facility;

    return AppNotificationEntity(
      id: model.id,
      title: model.title?.trim() ?? '',
      content: model.content?.trim() ?? '',
      sentOn: DateTime.tryParse(model.createdAt?.trim() ?? ''),
      facility: facility == null
          ? null
          : NotificationFacilityEntity(
              id: facility.id,
              name: facility.name?.trim() ?? '',
              logoUrl: switch (facility.logo?.trim()) {
                final logo? when logo.isNotEmpty => logo,
                _ => null,
              },
              activityLineId: facility.activityLineId,
              facilityType: facility.facilityType,
            ),
    );
  }
}
