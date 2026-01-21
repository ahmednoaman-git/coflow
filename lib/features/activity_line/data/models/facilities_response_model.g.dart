// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilities_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilitiesResponseModel _$FacilitiesResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilitiesResponseModel', json, ($checkedConvert) {
  final val = FacilitiesResponseModel(
    facilities: $checkedConvert(
      'facilities',
      (v) => (v as List<dynamic>)
          .map((e) => FacilityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    tags: $checkedConvert(
      'tags',
      (v) => (v as List<dynamic>)
          .map((e) => TagWithCountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$FacilitiesResponseModelToJson(
  FacilitiesResponseModel instance,
) => <String, dynamic>{
  'facilities': instance.facilities,
  'tags': instance.tags,
};
