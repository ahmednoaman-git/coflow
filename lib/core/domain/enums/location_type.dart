import 'package:json_annotation/json_annotation.dart';

/// Location type for API filters.
///
/// Used in both home and activity line features for location-based filtering.
enum LocationType {
  @JsonValue('address based')
  addressBased,
  @JsonValue('remote location')
  remoteLocation
  ;

  /// The string value to send to the API.
  String get value => switch (this) {
    addressBased => 'address based',
    remoteLocation => 'remote location',
  };
}
