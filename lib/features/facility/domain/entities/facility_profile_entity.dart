import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_profile_entity.freezed.dart';

/// Facility profile domain entity.
///
/// This entity is intentionally screen-oriented (Facility Details) and avoids
/// exposing data-layer models.
@freezed
abstract class FacilityProfileEntity with _$FacilityProfileEntity {
  const factory FacilityProfileEntity({
    required int id,
    required String name,
    String? title,
    String? year,
    String? bio,
    int? likesCount,
    String? logoUrl,
    String? coverUrl,
    @Default(<String>[]) List<String> tags,
  }) = _FacilityProfileEntity;
}
