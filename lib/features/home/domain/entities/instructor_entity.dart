import 'package:freezed_annotation/freezed_annotation.dart';

part 'instructor_entity.freezed.dart';

/// Instructor entity (placeholder - API pending from backend).
@freezed
abstract class InstructorEntity with _$InstructorEntity {
  const factory InstructorEntity({
    required int id,
    required String name,
    required String? image,
    required String? title,
  }) = _InstructorEntity;
}
