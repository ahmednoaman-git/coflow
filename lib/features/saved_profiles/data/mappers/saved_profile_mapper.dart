import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';

import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class SavedProfileMapper {
  static List<SavedProfileEntity> toEntities(SavedProfilesResponseModel model) =>
      model.profiles.map(toEntity).toList(growable: false);

  static SavedProfileEntity toEntity(SavedProfileModel model) {
    return SavedProfileEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      activityLine: ActivityLineEntity.fromId(model.activityLineId),
      status: FacilityStatus.fromString(model.status ?? ''),
      logoUrl: model.logo,
      likeCount: model.likesCount ?? 0,
      branchLabel: _branchLabel(model.branch),
      isTracked: model.isTracked,
    );
  }

  /// `New Cairo, Cairo` — dropping whichever half the API left out rather than
  /// rendering a stray comma.
  static String? _branchLabel(SavedProfileBranchModel? branch) {
    if (branch == null) return null;

    final parts = [
      branch.area?.trim(),
      branch.city?.trim(),
    ].whereType<String>().where((part) => part.isNotEmpty);

    return parts.isEmpty ? null : parts.join(', ');
  }
}
