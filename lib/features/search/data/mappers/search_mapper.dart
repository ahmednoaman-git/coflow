import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/data/data.dart';
import 'package:coflow_users_v2/features/facility/domain/domain.dart';

import '../../domain/domain.dart';
import '../models/models.dart';

/// Maps search payloads to the entities the results list renders.
abstract final class SearchMapper {
  /// Maps a paginator page, applying [itemMapper] to each entry.
  static PaginatedEntity<TEntity> toPaginatedEntity<TModel, TEntity>(
    PaginatedResponseModel<TModel> model,
    TEntity Function(TModel model) itemMapper,
  ) {
    return PaginatedEntity<TEntity>(
      items: model.items.map(itemMapper).toList(growable: false),
      currentPage: model.currentPage,
      lastPage: model.lastPage,
      total: model.total,
    );
  }

  static SearchInstructorEntity toInstructorEntity(SearchInstructorModel model) {
    return SearchInstructorEntity(
      id: model.id,
      name: model.fullName,
      title: model.title,
      imageUrl: model.image,
      centerName: model.centerName,
    );
  }

  static SearchServiceEntity toServiceEntity(SearchServiceModel model) {
    return SearchServiceEntity(
      service: CollapsedFacilityServiceEntity(
        id: model.id,
        name: model.name,
        imageUrl: model.image,
        reservations: model.reservations ?? 0,
      ),
      facility: ActivityLineMapper.toFacilityEntity(model.facility),
      type: FacilityServiceType.fromApi(model.type),
    );
  }
}
