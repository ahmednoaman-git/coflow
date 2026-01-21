// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityModel _$FacilityModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilityModel',
  json,
  ($checkedConvert) {
    final val = FacilityModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      logo: $checkedConvert('logo', (v) => v as String?),
      cover: $checkedConvert('cover', (v) => v as String?),
      title: $checkedConvert('title', (v) => v as String),
      views: $checkedConvert('views', (v) => (v as num).toInt()),
      rate: $checkedConvert('rate', (v) => v as String?),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>?)
            ?.map((e) => TagModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      facilityType: $checkedConvert('facility_type', (v) => v as String?),
      activityLineId: $checkedConvert(
        'activity_line_id',
        (v) => (v as num).toInt(),
      ),
      status: $checkedConvert('status', (v) => v as String),
      statusMsg: $checkedConvert('status_msg', (v) => v as String?),
      subscription: $checkedConvert('subscription', (v) => v as String),
      paymentType: $checkedConvert('payment_type', (v) => v as String),
      activitiesCount: $checkedConvert(
        'activities_count',
        (v) => (v as num?)?.toInt(),
      ),
      flowsCount: $checkedConvert('flows_count', (v) => (v as num?)?.toInt()),
      coursesCount: $checkedConvert(
        'courses_count',
        (v) => (v as num?)?.toInt(),
      ),
      reviewsCount: $checkedConvert(
        'reviews_count',
        (v) => (v as num?)?.toInt(),
      ),
      promotionsCount: $checkedConvert(
        'promotions_count',
        (v) => (v as num?)?.toInt(),
      ),
      slotsCount: $checkedConvert('slots_count', (v) => (v as num?)?.toInt()),
      activityLine: $checkedConvert(
        'activity_line',
        (v) => ActivityLineModel.fromJson(v as Map<String, dynamic>),
      ),
      city: $checkedConvert(
        'city',
        (v) => v == null ? null : CityModel.fromJson(v as Map<String, dynamic>),
      ),
      area: $checkedConvert(
        'area',
        (v) => v == null ? null : AreaModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'facilityType': 'facility_type',
    'activityLineId': 'activity_line_id',
    'statusMsg': 'status_msg',
    'paymentType': 'payment_type',
    'activitiesCount': 'activities_count',
    'flowsCount': 'flows_count',
    'coursesCount': 'courses_count',
    'reviewsCount': 'reviews_count',
    'promotionsCount': 'promotions_count',
    'slotsCount': 'slots_count',
    'activityLine': 'activity_line',
  },
);

Map<String, dynamic> _$FacilityModelToJson(FacilityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'cover': instance.cover,
      'title': instance.title,
      'views': instance.views,
      'rate': instance.rate,
      'tags': instance.tags,
      'facility_type': instance.facilityType,
      'activity_line_id': instance.activityLineId,
      'status': instance.status,
      'status_msg': instance.statusMsg,
      'subscription': instance.subscription,
      'payment_type': instance.paymentType,
      'activities_count': instance.activitiesCount,
      'flows_count': instance.flowsCount,
      'courses_count': instance.coursesCount,
      'reviews_count': instance.reviewsCount,
      'promotions_count': instance.promotionsCount,
      'slots_count': instance.slotsCount,
      'activity_line': instance.activityLine,
      'city': instance.city,
      'area': instance.area,
    };
