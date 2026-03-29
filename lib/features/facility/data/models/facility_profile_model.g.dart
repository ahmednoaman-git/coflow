// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamMemberModel _$TeamMemberModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TeamMemberModel', json, ($checkedConvert) {
      final val = TeamMemberModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        image: $checkedConvert('image', (v) => v as String),
        bio: $checkedConvert('bio', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$TeamMemberModelToJson(TeamMemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'image': instance.image,
      'bio': instance.bio,
    };

OperatingHoursModel _$OperatingHoursModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OperatingHoursModel', json, ($checkedConvert) {
      final val = OperatingHoursModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        days: $checkedConvert(
          'days',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        from: $checkedConvert('from', (v) => v as String),
        to: $checkedConvert('to', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$OperatingHoursModelToJson(
  OperatingHoursModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'days': instance.days,
  'from': instance.from,
  'to': instance.to,
};

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BranchModel', json, ($checkedConvert) {
      final val = BranchModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        title: $checkedConvert('title', (v) => v as String),
        cover: $checkedConvert('cover', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
    };

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LanguageModel', json, ($checkedConvert) {
      final val = LanguageModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

AmenityModel _$AmenityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AmenityModel', json, ($checkedConvert) {
      final val = AmenityModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        icon: $checkedConvert('icon', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AmenityModelToJson(AmenityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

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

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddressModel', json, ($checkedConvert) {
      final val = AddressModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        address: $checkedConvert('address', (v) => v as String),
        longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
        latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };

ReservationContactModel _$ReservationContactModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ReservationContactModel',
  json,
  ($checkedConvert) {
    final val = ReservationContactModel(
      selectSocial: $checkedConvert('select_social', (v) => v as String?),
      link: $checkedConvert('link', (v) => v),
    );
    return val;
  },
  fieldKeyMap: const {'selectSocial': 'select_social'},
);

Map<String, dynamic> _$ReservationContactModelToJson(
  ReservationContactModel instance,
) => <String, dynamic>{
  'select_social': instance.selectSocial,
  'link': instance.link,
};

MainBranchModel _$MainBranchModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MainBranchModel', json, ($checkedConvert) {
      final val = MainBranchModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MainBranchModelToJson(MainBranchModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

FacilityProfileModel _$FacilityProfileModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilityProfileModel',
  json,
  ($checkedConvert) {
    final val = FacilityProfileModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String?),
      year: $checkedConvert('year', (v) => v as String?),
      bio: $checkedConvert('bio', (v) => v as String?),
      likesCount: $checkedConvert('likes_count', (v) => (v as num?)?.toInt()),
      logo: $checkedConvert('logo', (v) => v as String?),
      cover: $checkedConvert('cover', (v) => v as String?),
      tags: $checkedConvert(
        'tags',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilityTagModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
      teams: $checkedConvert(
        'teams',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => TeamMemberModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
      operations: $checkedConvert(
        'operations',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      OperatingHoursModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
      barcnhes: $checkedConvert(
        'barcnhes',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => BranchModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      ),
      languages: $checkedConvert(
        'languages',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      ),
      amenities: $checkedConvert(
        'amenities',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => AmenityModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      ),
      reservationContact: $checkedConvert(
        'reservation_contact',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => ReservationContactModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      city: $checkedConvert(
        'city',
        (v) => v == null ? null : CityModel.fromJson(v as Map<String, dynamic>),
      ),
      area: $checkedConvert(
        'area',
        (v) => v == null ? null : AreaModel.fromJson(v as Map<String, dynamic>),
      ),
      address: $checkedConvert(
        'address',
        (v) =>
            v == null ? null : AddressModel.fromJson(v as Map<String, dynamic>),
      ),
      main: $checkedConvert(
        'main',
        (v) => v == null
            ? null
            : MainBranchModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'likesCount': 'likes_count',
    'reservationContact': 'reservation_contact',
  },
);

Map<String, dynamic> _$FacilityProfileModelToJson(
  FacilityProfileModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'title': instance.title,
  'year': instance.year,
  'bio': instance.bio,
  'likes_count': instance.likesCount,
  'logo': instance.logo,
  'cover': instance.cover,
  'tags': instance.tags,
  'teams': instance.teams,
  'operations': instance.operations,
  'barcnhes': instance.barcnhes,
  'languages': instance.languages,
  'amenities': instance.amenities,
  'reservation_contact': instance.reservationContact,
  'city': instance.city,
  'area': instance.area,
  'address': instance.address,
  'main': instance.main,
};
