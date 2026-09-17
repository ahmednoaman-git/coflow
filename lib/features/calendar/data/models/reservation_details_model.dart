import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/activity_line/data/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation_details_model.g.dart';

/// Response model for a single reservation.
///
/// The slot half is the facility feature's own slot payload — same endpoint
/// family, same shape — wrapped with the facility that runs it.
///
/// Composed from account reservation, calendar preview and facility responses.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class ReservationDetailsModel {
  const ReservationDetailsModel({
    required this.facilityId,
    required this.facilityName,
    required this.slot,
    this.facilityLogo,
    this.facility,
  });

  final int facilityId;
  final String facilityName;
  final String? facilityLogo;
  final FacilitySessionDetailsModel slot;
  final FacilityModel? facility;

  factory ReservationDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationDetailsModelToJson(this);
}
