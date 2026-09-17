import 'package:json_annotation/json_annotation.dart';

import 'facility_model.dart';
import 'tag_model.dart';

part 'facilities_response_model.g.dart';

/// API response model for facilities endpoint.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilitiesResponseModel {
  const FacilitiesResponseModel({
    required this.facilities,
    required this.tags,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  final List<FacilityModel> facilities;
  final List<TagWithCountModel> tags;
  final int currentPage;
  final int lastPage;
  final int total;

  /// `data` is the unwrapped paginator; tags are siblings of that paginator.
  factory FacilitiesResponseModel.fromApi(
    Map<String, dynamic> data,
    Map<String, dynamic> extraData,
  ) => FacilitiesResponseModel.fromJson({
    'facilities': data['data'],
    'tags': [
      for (final tag in extraData['tags'] as List<dynamic>)
        {...tag as Map<String, dynamic>, 'count': tag['facilities_count']},
    ],
    'current_page': data['current_page'],
    'last_page': data['last_page'],
    'total': data['total'],
  });

  factory FacilitiesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FacilitiesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitiesResponseModelToJson(this);
}
