import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_line_entity.freezed.dart';

/// Activity line category (Sky, Sea, Earth, Energy).
@freezed
abstract class ActivityLineEntity with _$ActivityLineEntity {
  const factory ActivityLineEntity({
    required int id,
    required String name,
    required String? image,
    required String? color,
    required int facilities,
  }) = _ActivityLineEntity;
}
