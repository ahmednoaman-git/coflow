import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class ActivityPreferencesMapper {
  /// Drops lines with nothing to pick (the server lists an empty "Explore").
  static List<PreferenceActivityLineEntity> toCatalog(List<PreferenceActivityLineModel> models) => [
    for (final model in models)
      if (model.tags.isNotEmpty)
        PreferenceActivityLineEntity(
          id: model.id,
          name: model.name?.trim() ?? '',
          tags: [
            for (final tag in model.tags) PreferenceTagEntity(id: tag.id, name: tag.name.trim()),
          ],
        ),
  ];
}
