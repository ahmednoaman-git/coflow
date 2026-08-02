import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../models/models.dart';

abstract final class FacilityServiceMapper {
  static FacilityServicesEntity toEntity(
    FacilityServicesResponseModel model,
    FacilityServiceType requestedType,
  ) {
    return FacilityServicesEntity(
      folders: model.folders
          .map((folder) => _toFolderEntity(folder, requestedType))
          .toList(growable: false),
      rootServices: model.services
          .map((service) => _toCollapsedEntity(service, requestedType))
          .toList(growable: false),
    );
  }

  static FacilityServiceFolderEntity _toFolderEntity(
    FacilityServiceFolderModel model,
    FacilityServiceType requestedType,
  ) {
    return FacilityServiceFolderEntity(
      id: model.id,
      name: model.name,
      services: model.services
          .map((service) => _toCollapsedEntity(service, requestedType))
          .toList(growable: false),
    );
  }

  static CollapsedFacilityServiceEntity _toCollapsedEntity(
    CollapsedFacilityServiceModel model,
    FacilityServiceType requestedType,
  ) {
    return CollapsedFacilityServiceEntity(
      id: model.id,
      name: model.name,
      imageUrl: model.image,
      reservations: model.reservations ?? 0,
      durationLabel: composeDurationLabel(model.duration, model.durationList),
      level: mapLevel(model.level, requestedType),
    );
  }

  /// Maps the API level, falling back to [FacilityServiceLevel.allLevels]
  /// for flow/course listings when the backend returns a null level (a known
  /// bug — the level is set on the admin side but the listing endpoint drops
  /// it). Plain activities have no level, so a null stays null there.
  static FacilityServiceLevel? mapLevel(
    FacilityServiceLevelModel? level,
    FacilityServiceType type,
  ) {
    if (level != null) {
      return FacilityServiceLevel.custom(name: level.name, colorHex: level.color ?? '');
    }

    if (type == FacilityServiceType.activity) {
      return null;
    }

    return const FacilityServiceLevel.allLevels();
  }

  /// Composes a display label like `'1 Hour'` from the raw duration value
  /// and its unit. Returns null when either part is missing/empty.
  static String? composeDurationLabel(
    String? duration,
    FacilityServiceDurationListModel? unit,
  ) {
    if (duration == null || duration.isEmpty || unit == null) {
      return null;
    }

    return '$duration ${unit.name}';
  }
}
