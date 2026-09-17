import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_contact_entity.dart';
import 'facility_location_entity.dart';

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
    @Default(<FacilityContactEntity>[]) List<FacilityContactEntity> contacts,
    FacilityLocationEntity? location,
    MainBranchEntity? mainBranch,

    /// Whether the signed-in user has this facility in their saved profiles.
    @Default(false) bool isSaved,

    /// Whether the signed-in user is subscribed to this facility's updates.
    @Default(false) bool isTracked,

    /// When the facility last edited its profile.
    DateTime? updatedAt,
  }) = _FacilityProfileEntity;

  const FacilityProfileEntity._();

  /// Contacts worth rendering — a channel with nothing behind it cannot be
  /// tapped, so it is dropped rather than shown as a dead button.
  List<FacilityContactEntity> get actionableContacts =>
      contacts.where((contact) => contact.isActionable).toList(growable: false);
}
