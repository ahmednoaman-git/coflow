import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_request_dto.freezed.dart';

/// Request DTO for home API.
@freezed
abstract class HomeRequestDto with _$HomeRequestDto {
  const factory HomeRequestDto({
    LocationType? locationType,
    int? cityId,
    int? areaId,
  }) = _HomeRequestDto;
}

/// Location type for home API filter.
enum LocationType {
  addressBased,
  remoteLocation
  ;

  String get value => switch (this) {
    addressBased => 'address based',
    remoteLocation => 'remote location',
  };
}
