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
        title: $checkedConvert('title', (v) => v as String?),
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
        (v) => v == null
            ? const <ReservationContactModel>[]
            : ReservationContactModel.listFromJson(v),
      ),
      locations: $checkedConvert(
        'locations',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      FacilityCoverageModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
      locationType: $checkedConvert('location_type', (v) => v as String?),
      city: $checkedConvert(
        'city',
        (v) => v == null ? null : CityModel.fromJson(v as Map<String, dynamic>),
      ),
      area: $checkedConvert(
        'area',
        (v) => v == null ? null : AreaModel.fromJson(v as Map<String, dynamic>),
      ),
      country: $checkedConvert(
        'country',
        (v) =>
            v == null ? null : CountryModel.fromJson(v as Map<String, dynamic>),
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
      hasSave: $checkedConvert('has_save', (v) => v as bool? ?? false),
      hasTrack: $checkedConvert('has_track', (v) => v as bool? ?? false),
      updatedAt: $checkedConvert('updated_at', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'likesCount': 'likes_count',
    'reservationContact': 'reservation_contact',
    'locationType': 'location_type',
    'hasSave': 'has_save',
    'hasTrack': 'has_track',
    'updatedAt': 'updated_at',
  },
);
