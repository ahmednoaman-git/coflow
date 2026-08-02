import 'package:json_annotation/json_annotation.dart';

part 'facility_service_model.g.dart';

/// Response model for `services/{facilityId}?type=<activity|flow|course>`.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityServicesResponseModel {
  const FacilityServicesResponseModel({
    this.folders = const <FacilityServiceFolderModel>[],
    this.services = const <CollapsedFacilityServiceModel>[],
  });

  @JsonKey(defaultValue: <FacilityServiceFolderModel>[])
  final List<FacilityServiceFolderModel> folders;

  @JsonKey(defaultValue: <CollapsedFacilityServiceModel>[])
  final List<CollapsedFacilityServiceModel> services;

  factory FacilityServicesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityServicesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityServicesResponseModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityServiceFolderModel {
  const FacilityServiceFolderModel({
    required this.id,
    required this.name,
    this.services = const <CollapsedFacilityServiceModel>[],
  });

  final int id;
  final String name;

  @JsonKey(defaultValue: <CollapsedFacilityServiceModel>[])
  final List<CollapsedFacilityServiceModel> services;

  factory FacilityServiceFolderModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityServiceFolderModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityServiceFolderModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class CollapsedFacilityServiceModel {
  const CollapsedFacilityServiceModel({
    required this.id,
    required this.name,
    this.duration,
    this.durationListId,
    this.image,
    this.reservations,
    this.durationList,
    this.level,
  });

  final int id;
  final String name;
  final String? duration;
  final int? durationListId;
  final String? image;
  final int? reservations;
  final FacilityServiceDurationListModel? durationList;
  final FacilityServiceLevelModel? level;

  factory CollapsedFacilityServiceModel.fromJson(Map<String, dynamic> json) =>
      _$CollapsedFacilityServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollapsedFacilityServiceModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityServiceDurationListModel {
  const FacilityServiceDurationListModel({required this.id, required this.name});

  final int id;
  final String name;

  factory FacilityServiceDurationListModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityServiceDurationListModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityServiceDurationListModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityServiceLevelModel {
  const FacilityServiceLevelModel({required this.id, required this.name, this.color});

  final int id;
  final String name;
  final String? color;

  factory FacilityServiceLevelModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityServiceLevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityServiceLevelModelToJson(this);
}
