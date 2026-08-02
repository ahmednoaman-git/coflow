// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_service_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityServiceDetailsModel _$FacilityServiceDetailsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilityServiceDetailsModel',
  json,
  ($checkedConvert) {
    final val = FacilityServiceDetailsModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      duration: $checkedConvert('duration', (v) => v as String?),
      description: $checkedConvert('description', (v) => v as String?),
      requirements: $checkedConvert('requirements', (v) => v as String?),
      conditions: $checkedConvert('conditions', (v) => v as String?),
      image: $checkedConvert('image', (v) => v as String?),
      durationList: $checkedConvert(
        'duration_list',
        (v) => v == null
            ? null
            : FacilityServiceDurationListModel.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      level: $checkedConvert(
        'level',
        (v) => v == null ? null : FacilityServiceLevelModel.fromJson(v as Map<String, dynamic>),
      ),
      tickets: $checkedConvert(
        'tickets',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilityServiceTicketModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      locations: $checkedConvert(
        'locations',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilityServiceLocationModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      instructors: $checkedConvert(
        'instructors',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilityServiceInstructorModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      images: $checkedConvert(
        'images',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilityServiceImageModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {'durationList': 'duration_list'},
);

Map<String, dynamic> _$FacilityServiceDetailsModelToJson(
  FacilityServiceDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'duration': instance.duration,
  'description': instance.description,
  'requirements': instance.requirements,
  'conditions': instance.conditions,
  'image': instance.image,
  'duration_list': instance.durationList,
  'level': instance.level,
  'tickets': instance.tickets,
  'locations': instance.locations,
  'instructors': instance.instructors,
  'images': instance.images,
};

FacilityServiceTicketModel _$FacilityServiceTicketModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilityServiceTicketModel',
  json,
  ($checkedConvert) {
    final val = FacilityServiceTicketModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      price: $checkedConvert('price', (v) => (v as num).toDouble()),
      hasDiscount: $checkedConvert('has_discount', (v) => v as bool?),
      discountPrice: $checkedConvert(
        'discount_price',
        (v) => (v as num?)?.toDouble(),
      ),
      currency: $checkedConvert('currency', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'hasDiscount': 'has_discount',
    'discountPrice': 'discount_price',
  },
);

Map<String, dynamic> _$FacilityServiceTicketModelToJson(
  FacilityServiceTicketModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'has_discount': instance.hasDiscount,
  'discount_price': instance.discountPrice,
  'currency': instance.currency,
};

FacilityServiceLocationModel _$FacilityServiceLocationModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilityServiceLocationModel', json, ($checkedConvert) {
  final val = FacilityServiceLocationModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    link: $checkedConvert('link', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$FacilityServiceLocationModelToJson(
  FacilityServiceLocationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'link': instance.link,
};

FacilityServiceInstructorModel _$FacilityServiceInstructorModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilityServiceInstructorModel',
  json,
  ($checkedConvert) {
    final val = FacilityServiceInstructorModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      firstName: $checkedConvert('first_name', (v) => v as String),
      lastName: $checkedConvert('last_name', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'firstName': 'first_name', 'lastName': 'last_name'},
);

Map<String, dynamic> _$FacilityServiceInstructorModelToJson(
  FacilityServiceInstructorModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
};

FacilityServiceImageModel _$FacilityServiceImageModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilityServiceImageModel', json, ($checkedConvert) {
  final val = FacilityServiceImageModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    file: $checkedConvert('file', (v) => v as String),
    sort: $checkedConvert('sort', (v) => (v as num?)?.toInt()),
    type: $checkedConvert('type', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$FacilityServiceImageModelToJson(
  FacilityServiceImageModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'file': instance.file,
  'sort': instance.sort,
  'type': instance.type,
};
