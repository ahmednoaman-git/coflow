import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_profile_entity.freezed.dart';

/// Team member entity.
@freezed
abstract class TeamMemberEntity with _$TeamMemberEntity {
  const factory TeamMemberEntity({
    required int id,
    required String name,
    required String title,
    required String imageUrl,
    String? bio,
  }) = _TeamMemberEntity;
}

/// Operating hours entity.
@freezed
abstract class OperatingHoursEntity with _$OperatingHoursEntity {
  const factory OperatingHoursEntity({
    required int id,
    required List<String> days,
    required String fromTime,
    required String toTime,
  }) = _OperatingHoursEntity;
}

/// Branch entity.
@freezed
abstract class BranchEntity with _$BranchEntity {
  const factory BranchEntity({
    required int id,
    required String title,
    String? coverUrl,
  }) = _BranchEntity;
}

/// Language entity.
@freezed
abstract class LanguageEntity with _$LanguageEntity {
  const factory LanguageEntity({
    required int id,
    required String name,
  }) = _LanguageEntity;
}

/// Amenity entity.
@freezed
abstract class AmenityEntity with _$AmenityEntity {
  const factory AmenityEntity({
    required int id,
    required String name,
    required String iconUrl,
  }) = _AmenityEntity;
}

/// Location entity with address details.
@freezed
abstract class LocationEntity with _$LocationEntity {
  const factory LocationEntity({
    String? address,
    String? cityName,
    String? areaName,
    double? latitude,
    double? longitude,
  }) = _LocationEntity;
}

/// Reservation contact entity.
@freezed
abstract class ReservationContactEntity with _$ReservationContactEntity {
  const factory ReservationContactEntity({
    required String type,
    String? link,
  }) = _ReservationContactEntity;
}

/// Main branch reference entity.
@freezed
abstract class MainBranchEntity with _$MainBranchEntity {
  const factory MainBranchEntity({
    required int id,
    required String name,
  }) = _MainBranchEntity;
}

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
    @Default(<TeamMemberEntity>[]) List<TeamMemberEntity> teamMembers,
    @Default(<OperatingHoursEntity>[]) List<OperatingHoursEntity> operatingHours,
    @Default(<BranchEntity>[]) List<BranchEntity> branches,
    @Default(<LanguageEntity>[]) List<LanguageEntity> languages,
    @Default(<AmenityEntity>[]) List<AmenityEntity> amenities,
    @Default(<ReservationContactEntity>[]) List<ReservationContactEntity> reservationContacts,
    LocationEntity? location,
    MainBranchEntity? mainBranch,
  }) = _FacilityProfileEntity;
}
