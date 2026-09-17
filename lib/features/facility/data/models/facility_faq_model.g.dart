// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityFaqModel _$FacilityFaqModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FacilityFaqModel', json, ($checkedConvert) {
      final val = FacilityFaqModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        question: $checkedConvert('question', (v) => v as String),
        answer: $checkedConvert('answer', (v) => v as String),
        sort: $checkedConvert('sort', (v) => (v as num?)?.toInt()),
        status: $checkedConvert('status', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$FacilityFaqModelToJson(FacilityFaqModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'sort': instance.sort,
      'status': instance.status,
    };
