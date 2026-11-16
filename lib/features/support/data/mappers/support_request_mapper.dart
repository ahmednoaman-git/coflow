import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/search/data/models/paginated_response_model.dart';

import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class SupportRequestMapper {
  static SupportRequestEntity toEntity(SupportRequestModel model) {
    final rawStatus = model.status?.trim().toLowerCase() ?? '';

    return SupportRequestEntity(
      id: model.id,
      issue: _text(model.issue) ?? _text(model.description) ?? '',
      status: statusOf(rawStatus),
      rawStatus: rawStatus,
      adminNote: _text(model.adminResponse) ?? _text(model.notes),
      imageUrl: _text(model.image),
      createdAt: serverTime(model.createdAt),
    );
  }

  static PaginatedEntity<SupportRequestEntity> toPage(
    PaginatedResponseModel<SupportRequestModel> page,
  ) => PaginatedEntity(
    items: page.items.map(toEntity).toList(growable: false),
    currentPage: page.currentPage,
    lastPage: page.lastPage,
    total: page.total,
  );

  static SupportRequestStatus statusOf(String raw) => switch (raw) {
    'new' => SupportRequestStatus.open,
    'pending' => SupportRequestStatus.pending,
    'resolved' => SupportRequestStatus.resolved,
    _ => SupportRequestStatus.other,
  };

  /// The server writes `yyyy-MM-dd HH:mm:ss` in UTC with no zone marker (it
  /// matches the response's GMT `Date` header), so it is read as UTC and
  /// shown in the device's time zone.
  static final RegExp _zone = RegExp(r'(Z|[+-]\d{2}:?\d{2})$');

  static DateTime? serverTime(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return null;
    final hasZone = _zone.hasMatch(trimmed);
    return DateTime.tryParse(hasZone ? trimmed : '${trimmed}Z')?.toLocal();
  }

  static String? _text(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }
}
