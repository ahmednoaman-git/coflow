// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CityModel', json, ($checkedConvert) {
      final val = CityModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

AreaModel _$AreaModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AreaModel', json, ($checkedConvert) {
      final val = AreaModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AreaModelToJson(AreaModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CountryModel', json, ($checkedConvert) {
      final val = CountryModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

AddressPhoneModel _$AddressPhoneModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddressPhoneModel', json, ($checkedConvert) {
      final val = AddressPhoneModel(
        number: $checkedConvert('number', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$AddressPhoneModelToJson(AddressPhoneModel instance) =>
    <String, dynamic>{'number': instance.number, 'type': instance.type};

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddressModel', json, ($checkedConvert) {
      final val = AddressModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        address: $checkedConvert('address', (v) => v as String?),
        location: $checkedConvert('location', (v) => v as String?),
        longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
        latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
        phones: $checkedConvert(
          'phones',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) =>
                        AddressPhoneModel.fromJson(e as Map<String, dynamic>),
                  )
                  .toList() ??
              [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'location': instance.location,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'phones': instance.phones,
    };

FacilityCoverageModel _$FacilityCoverageModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilityCoverageModel',
  json,
  ($checkedConvert) {
    final val = FacilityCoverageModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      availabilityType: $checkedConvert(
        'availability_type',
        (v) => v as String?,
      ),
      areas: $checkedConvert(
        'areas',
        (v) => (v as List<dynamic>?)
            ?.map((e) => AreaModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      city: $checkedConvert(
        'city',
        (v) => v == null ? null : CityModel.fromJson(v as Map<String, dynamic>),
      ),
      country: $checkedConvert(
        'country',
        (v) =>
            v == null ? null : CountryModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'availabilityType': 'availability_type'},
);

Map<String, dynamic> _$FacilityCoverageModelToJson(
  FacilityCoverageModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'availability_type': instance.availabilityType,
  'areas': instance.areas,
  'city': instance.city,
  'country': instance.country,
};
