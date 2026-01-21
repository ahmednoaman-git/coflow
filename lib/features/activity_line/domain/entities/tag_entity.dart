import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_entity.freezed.dart';

/// Tag entity for facilities.
@freezed
abstract class TagEntity with _$TagEntity {
  const factory TagEntity({
    required int id,
    required String name,
  }) = _TagEntity;
}

/// Tag entity with count for filtering display.
@freezed
abstract class TagWithCountEntity with _$TagWithCountEntity {
  const factory TagWithCountEntity({
    required int id,
    required String name,
    required int count,
  }) = _TagWithCountEntity;
}
