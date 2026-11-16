import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_support_requests_dto.freezed.dart';

/// One page of the customer's support requests.
@freezed
abstract class GetSupportRequestsDto with _$GetSupportRequestsDto {
  const GetSupportRequestsDto._();

  const factory GetSupportRequestsDto({
    required int page,
    @Default(GetSupportRequestsDto.pageSize) int limit,
  }) = _GetSupportRequestsDto;

  static const int pageSize = 10;

  Map<String, dynamic> toQuery() => {'page': page, 'limit': limit};
}
