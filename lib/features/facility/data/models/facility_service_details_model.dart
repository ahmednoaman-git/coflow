import 'package:json_annotation/json_annotation.dart';

import 'facility_service_model.dart';

part 'facility_service_details_model.g.dart';

/// Response model for `service/{serviceId}`.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityServiceDetailsModel {
  const FacilityServiceDetailsModel({
    required this.id,
    required this.name,
    this.duration,
    this.description,
    this.requirements,
    this.conditions,
    this.image,
    this.durationList,
    this.level,
    this.tickets = const <FacilityServiceTicketModel>[],
    this.locations = const <FacilityServiceLocationModel>[],
    this.instructors = const <FacilityServiceInstructorModel>[],
    this.images = const <FacilityServiceImageModel>[],
  });

  final int id;
  final String name;
  final String? duration;
  final String? description;
  final String? requirements;
  final String? conditions;
  final String? image;
  final FacilityServiceDurationListModel? durationList;
  final FacilityServiceLevelModel? level;

  @JsonKey(defaultValue: <FacilityServiceTicketModel>[])
  final List<FacilityServiceTicketModel> tickets;

  @JsonKey(defaultValue: <FacilityServiceLocationModel>[])
  final List<FacilityServiceLocationModel> locations;

  @JsonKey(defaultValue: <FacilityServiceInstructorModel>[])
  final List<FacilityServiceInstructorModel> instructors;

  @JsonKey(defaultValue: <FacilityServiceImageModel>[])
  final List<FacilityServiceImageModel> images;

  factory FacilityServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityServiceDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityServiceDetailsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityServiceTicketModel {
  const FacilityServiceTicketModel({
    required this.id,
    required this.name,
    required this.price,
    this.hasDiscount,
    this.discountPrice,
    this.currency,
  });

  final int id;
  final String name;
  final double price;
  final bool? hasDiscount;
  final double? discountPrice;
  final String? currency;

  factory FacilityServiceTicketModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityServiceTicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityServiceTicketModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityServiceLocationModel {
  const FacilityServiceLocationModel({required this.id, required this.name, this.link});

  final int id;
  final String name;
  final String? link;

  factory FacilityServiceLocationModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityServiceLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityServiceLocationModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityServiceInstructorModel {
  const FacilityServiceInstructorModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final int id;
  final String firstName;
  final String lastName;

  factory FacilityServiceInstructorModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityServiceInstructorModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityServiceInstructorModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityServiceImageModel {
  const FacilityServiceImageModel({required this.id, required this.file, this.sort, this.type});

  final int id;
  final String file;
  final int? sort;
  final String? type;

  factory FacilityServiceImageModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityServiceImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityServiceImageModelToJson(this);
}
