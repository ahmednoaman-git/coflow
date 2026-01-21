// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagModel _$TagModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TagModel', json, ($checkedConvert) {
      final val = TagModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TagModelToJson(TagModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

TagWithCountModel _$TagWithCountModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TagWithCountModel', json, ($checkedConvert) {
      final val = TagWithCountModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        count: $checkedConvert('count', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$TagWithCountModelToJson(TagWithCountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
    };
