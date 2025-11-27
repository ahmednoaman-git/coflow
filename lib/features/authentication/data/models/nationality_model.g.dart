// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nationality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NationalityModel _$NationalityModelFromJson(Map<String, dynamic> json) =>
    NationalityModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$NationalityModelToJson(NationalityModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
