import 'package:json_annotation/json_annotation.dart';

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
    required this.title,
    this.cover,
  });

  final int id;
  final String title;
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

/// City model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class CityModel {
  const CityModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
}

/// Area model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class AreaModel {
  const AreaModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory AreaModel.fromJson(Map<String, dynamic> json) => _$AreaModelFromJson(json);
}

/// Address model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class AddressModel {
  const AddressModel({
    required this.id,
    required this.address,
    this.longitude,
    this.latitude,
  });

  final int id;
  final String address;
  final double? longitude;
  final double? latitude;

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
}

/// Reservation contact model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class ReservationContactModel {
  const ReservationContactModel({
    required this.selectSocial,
    this.link,
  });

  final String? selectSocial;

  /// Backend may return null, string, or other shapes; keep it flexible.
  final dynamic link;

  factory ReservationContactModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationContactModelFromJson(json);
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
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
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
    this.city,
    this.area,
    this.address,
    this.main,
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

  @JsonKey(defaultValue: <ReservationContactModel>[])
  final List<ReservationContactModel> reservationContact;

  final CityModel? city;
  final AreaModel? area;
  final AddressModel? address;
  final MainBranchModel? main;

  factory FacilityProfileModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityProfileModelToJson(this);
}
