// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppFaqModel _$AppFaqModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AppFaqModel', json, ($checkedConvert) {
      final val = AppFaqModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        question: $checkedConvert('question', (v) => v as String),
        answer: $checkedConvert('answer', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String?),
        sort: $checkedConvert('sort', (v) => (v as num?)?.toInt()),
        status: $checkedConvert('status', (v) => v as String?),
      );
      return val;
    });
