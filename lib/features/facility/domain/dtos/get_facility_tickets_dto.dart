import 'package:json_annotation/json_annotation.dart';

part 'get_facility_tickets_dto.g.dart';

/// Request DTO for getting facility tickets.
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetFacilityTicketsDto {
  const GetFacilityTicketsDto({required this.facilityId});

  final int facilityId;

  factory GetFacilityTicketsDto.fromJson(Map<String, dynamic> json) =>
      _$GetFacilityTicketsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetFacilityTicketsDtoToJson(this);
}
