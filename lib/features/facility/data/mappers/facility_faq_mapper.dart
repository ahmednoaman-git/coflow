import '../../domain/entities/entities.dart';
import '../models/models.dart';

/// Maps FAQ entries, dropping anything the facility has not published or
/// filled in on both sides.
abstract final class FacilityFaqMapper {
  static List<FacilityFaqEntity> toEntities(List<FacilityFaqModel> models) {
    final published = models.where(_isPublished).toList()
      ..sort((a, b) => (a.sort ?? 0).compareTo(b.sort ?? 0));

    return published.map(toEntity).toList(growable: false);
  }

  static FacilityFaqEntity toEntity(FacilityFaqModel model) => FacilityFaqEntity(
    id: model.id,
    question: model.question.trim(),
    answer: model.answer.trim(),
  );

  static bool _isPublished(FacilityFaqModel model) {
    if (model.question.trim().isEmpty || model.answer.trim().isEmpty) return false;
    final status = model.status?.trim().toLowerCase();
    return status == null || status == 'active';
  }
}
