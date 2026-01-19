import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_location.freezed.dart';

/// Represents a user-selected location (city or area).
@freezed
abstract class SelectedLocation with _$SelectedLocation {
  const SelectedLocation._();

  const factory SelectedLocation({
    int? cityId,
    String? cityName,
    int? areaId,
    String? areaName,
    @Default(false) bool isRemote,
  }) = _SelectedLocation;

  /// Whether nothing is selected (show "All").
  bool get isEmpty => cityId == null && areaId == null && !isRemote;

  /// Whether a location is selected.
  bool get isNotEmpty => !isEmpty;

  /// Display name for the selected location.
  String get displayName {
    if (isRemote) return 'Remote';
    if (areaName != null) return areaName!;
    if (cityName != null) return cityName!;
    return 'All';
  }
}
