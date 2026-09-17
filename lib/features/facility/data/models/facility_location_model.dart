import 'package:json_annotation/json_annotation.dart';

part 'facility_location_model.g.dart';

/// City model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class CityModel {
  const CityModel({required this.id, required this.name});

  final int id;
  final String name;

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
}

/// Area model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class AreaModel {
  const AreaModel({required this.id, required this.name});

  final int id;
  final String name;

  factory AreaModel.fromJson(Map<String, dynamic> json) => _$AreaModelFromJson(json);
}

/// Country model from API.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class CountryModel {
  const CountryModel({required this.id, required this.name});

  final int id;
  final String name;

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
}

/// A phone number attached to a facility's address.
///
/// The address block labels its numbers with `type`, unlike the newer contact
/// blocks which use `name`.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class AddressPhoneModel {
  const AddressPhoneModel({required this.number, this.type});

  final String number;
  final String? type;

  factory AddressPhoneModel.fromJson(Map<String, dynamic> json) =>
      _$AddressPhoneModelFromJson(json);
}

/// Address model from API.
///
/// `location` is the shareable maps link the facility saved (usually a
/// `maps.app.goo.gl` short link) — it is not derived from the coordinates, and
/// a remote facility may point it at a booking page instead.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class AddressModel {
  const AddressModel({
    required this.id,
    this.address,
    this.location,
    this.longitude,
    this.latitude,
    this.phones = const <AddressPhoneModel>[],
  });

  final int id;
  final String? address;
  final String? location;
  final double? longitude;
  final double? latitude;

  @JsonKey(defaultValue: <AddressPhoneModel>[])
  final List<AddressPhoneModel> phones;

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
}

/// One coverage row of a remote facility, from the profile's `locations` array.
///
/// `availability_type` decides how the rest reads:
/// * `all country` — the facility covers [country] entirely; [city] is null.
/// * `all city` — it covers [city] entirely; [areas] is null.
/// * `open` — it covers exactly the [areas] listed inside [city].
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityCoverageModel {
  const FacilityCoverageModel({
    required this.id,
    this.availabilityType,
    this.areas,
    this.city,
    this.country,
  });

  final int id;
  final String? availabilityType;
  final List<AreaModel>? areas;
  final CityModel? city;
  final CountryModel? country;

  factory FacilityCoverageModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityCoverageModelFromJson(json);
}
