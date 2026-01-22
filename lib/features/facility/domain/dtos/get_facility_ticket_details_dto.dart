import 'package:json_annotation/json_annotation.dart';

part 'get_facility_ticket_details_dto.g.dart';

/// Request DTO for getting facility ticket details.
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetFacilityTicketDetailsDto {
  const GetFacilityTicketDetailsDto({required this.ticketId});

  final int ticketId;

  factory GetFacilityTicketDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$GetFacilityTicketDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetFacilityTicketDetailsDtoToJson(this);
}
