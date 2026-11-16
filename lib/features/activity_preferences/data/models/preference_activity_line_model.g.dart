// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference_activity_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferenceActivityLineModel _$PreferenceActivityLineModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PreferenceActivityLineModel', json, ($checkedConvert) {
  final val = PreferenceActivityLineModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String?),
    tags: $checkedConvert(
      'tags',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => PreferenceTagModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    ),
  );
  return val;
});

PreferenceTagModel _$PreferenceTagModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PreferenceTagModel', json, ($checkedConvert) {
      final val = PreferenceTagModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });
