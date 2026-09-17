import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../models/models.dart';

/// Maps the profile's `reservation_contact` block onto contact channels.
abstract final class FacilityContactMapper {
  static List<FacilityContactEntity> toEntities(List<ReservationContactModel> models) {
    return models.map(toEntity).toList(growable: false);
  }

  static FacilityContactEntity toEntity(ReservationContactModel model) {
    final label = model.name.trim();

    return FacilityContactEntity(
      channel: FacilityContactChannel.fromApi(label),
      label: label,
      links: model.links
          .map(
            (link) => FacilityContactLinkEntity(
              value: link.value.trim(),
              label: _cleanLabel(link.label),
            ),
          )
          .where((link) => link.value.isNotEmpty)
          .toList(growable: false),
    );
  }

  static String? _cleanLabel(String? label) {
    final trimmed = label?.trim();
    return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
  }
}
