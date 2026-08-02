import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility_service_level.dart';

part 'facility_service_details_entity.freezed.dart';

@freezed
abstract class FacilityServiceTicketEntity with _$FacilityServiceTicketEntity {
  const factory FacilityServiceTicketEntity({
    required int id,
    required String name,
    required double price,
    double? discountPrice,
    required String currency,
  }) = _FacilityServiceTicketEntity;
}

@freezed
abstract class FacilityServiceLocationEntity with _$FacilityServiceLocationEntity {
  const factory FacilityServiceLocationEntity({
    required int id,
    required String name,
    String? link,
  }) = _FacilityServiceLocationEntity;
}

@freezed
abstract class FacilityServiceInstructorEntity with _$FacilityServiceInstructorEntity {
  const FacilityServiceInstructorEntity._();

  const factory FacilityServiceInstructorEntity({
    required int id,
    required String firstName,
    required String lastName,
  }) = _FacilityServiceInstructorEntity;

  String get fullName => '$firstName $lastName';
}

/// Full details for a single service/flow/course.
@freezed
abstract class FacilityServiceDetailsEntity with _$FacilityServiceDetailsEntity {
  const factory FacilityServiceDetailsEntity({
    required int id,
    required String name,
    String? description,
    String? requirements,
    String? conditions,
    required List<String> imageUrls,
    String? durationLabel,
    FacilityServiceLevel? level,
    required List<FacilityServiceTicketEntity> tickets,
    required List<FacilityServiceLocationEntity> locations,
    required List<FacilityServiceInstructorEntity> instructors,
  }) = _FacilityServiceDetailsEntity;
}
