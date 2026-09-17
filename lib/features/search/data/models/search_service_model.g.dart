// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchServiceModel _$SearchServiceModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SearchServiceModel', json, ($checkedConvert) {
      final val = SearchServiceModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        facility: $checkedConvert(
          'facility',
          (v) => FacilityModel.fromJson(v as Map<String, dynamic>),
        ),
        type: $checkedConvert('type', (v) => v as String?),
        image: $checkedConvert('image', (v) => v as String?),
        duration: $checkedConvert('duration', (v) => v as String?),
        reservations: $checkedConvert(
          'reservations',
          (v) => (v as num?)?.toInt(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SearchServiceModelToJson(SearchServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'image': instance.image,
      'duration': instance.duration,
      'reservations': instance.reservations,
      'facility': instance.facility,
    };
