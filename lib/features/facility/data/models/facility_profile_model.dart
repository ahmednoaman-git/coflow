import 'package:json_annotation/json_annotation.dart';

import 'facility_contact_model.dart';
import 'facility_location_model.dart';
import 'facility_tag_model.dart';

part 'facility_profile_model.g.dart';

/// Team member model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class TeamMemberModel {
  const TeamMemberModel({
    required this.id,
    required this.name,
    required this.title,
    required this.image,
    this.bio,
  });

  final int id;
  final String name;
  final String title;
  final String image;
  final String? bio;

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) => _$TeamMemberModelFromJson(json);
}

/// Operating hours model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class OperatingHoursModel {
  const OperatingHoursModel({
    required this.id,
    required this.days,
    required this.from,
    required this.to,
  });

  final int id;
  final List<String> days;
  final String from;
  final String to;

  factory OperatingHoursModel.fromJson(Map<String, dynamic> json) =>
      _$OperatingHoursModelFromJson(json);
}

/// Branch model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class BranchModel {
  const BranchModel({
    required this.id,
    this.title,
    this.cover,
  });

  final int id;
  final String? title;
  final String? cover;

  factory BranchModel.fromJson(Map<String, dynamic> json) => _$BranchModelFromJson(json);
}

/// Language model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class LanguageModel {
  const LanguageModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory LanguageModel.fromJson(Map<String, dynamic> json) => _$LanguageModelFromJson(json);
}

/// Amenity model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class AmenityModel {
  const AmenityModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  final int id;
  final String name;
  final String icon;

  factory AmenityModel.fromJson(Map<String, dynamic> json) => _$AmenityModelFromJson(json);
}

/// Main branch model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class MainBranchModel {
  const MainBranchModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory MainBranchModel.fromJson(Map<String, dynamic> json) => _$MainBranchModelFromJson(json);
}

/// Facility profile model from API.
///
/// Note: The Dio client in v2 already extracts the top-level `data` field.
/// `createToJson` is off: the profile is only ever read, and
/// [ReservationContactModel] is hand-parsed and has no serializer to emit.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class FacilityProfileModel {
  const FacilityProfileModel({
    required this.id,
    required this.name,
    this.title,
    this.year,
    this.bio,
    this.likesCount,
    this.logo,
    this.cover,
    this.tags = const <FacilityTagModel>[],
    this.teams = const <TeamMemberModel>[],
    this.operations = const <OperatingHoursModel>[],
    this.barcnhes = const <BranchModel>[], // Note: API has typo
    this.languages = const <LanguageModel>[],
    this.amenities = const <AmenityModel>[],
    this.reservationContact = const <ReservationContactModel>[],
    this.locations = const <FacilityCoverageModel>[],
    this.locationType,
    this.city,
    this.area,
    this.country,
    this.address,
    this.main,
    this.hasSave = false,
    this.hasTrack = false,
    this.updatedAt,
  });

  final int id;
  final String name;
  final String? title;
  final String? year;
  final String? bio;

  @JsonKey(name: 'likes_count')
  final int? likesCount;

  final String? logo;
  final String? cover;

  @JsonKey(defaultValue: <FacilityTagModel>[])
  final List<FacilityTagModel> tags;

  @JsonKey(defaultValue: <TeamMemberModel>[])
  final List<TeamMemberModel> teams;

  @JsonKey(defaultValue: <OperatingHoursModel>[])
  final List<OperatingHoursModel> operations;

  @JsonKey(defaultValue: <BranchModel>[])
  final List<BranchModel> barcnhes; // Note: API has typo "barcnhes" instead of "branches"

  @JsonKey(defaultValue: <LanguageModel>[])
  final List<LanguageModel> languages;

  @JsonKey(defaultValue: <AmenityModel>[])
  final List<AmenityModel> amenities;

  /// Hand-parsed: the backend ships this field in six mutually incompatible
  /// shapes. See [ReservationContactModel].
  @JsonKey(fromJson: ReservationContactModel.listFromJson)
  final List<ReservationContactModel> reservationContact;

  /// Coverage rows for a remote facility. Always empty for an address-based
  /// one.
  @JsonKey(defaultValue: <FacilityCoverageModel>[])
  final List<FacilityCoverageModel> locations;

  /// `address based` or `remote location`.
  final String? locationType;

  final CityModel? city;
  final AreaModel? area;
  final CountryModel? country;
  final AddressModel? address;
  final MainBranchModel? main;

  /// Whether the signed-in user saved this facility. Absent for anonymous
  /// requests, so it defaults to false.
  @JsonKey(name: 'has_save', defaultValue: false)
  final bool hasSave;

  /// Whether the signed-in user tracks this facility's updates.
  @JsonKey(name: 'has_track', defaultValue: false)
  final bool hasTrack;

  /// Date the facility last edited its profile, as `yyyy-MM-dd`.
  final String? updatedAt;

  factory FacilityProfileModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityProfileModelFromJson(json);
}
