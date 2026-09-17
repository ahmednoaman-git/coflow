import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_instructor_entity.freezed.dart';

/// An instructor row in the search results.
///
/// The endpoint returns the instructor's own profile only — it carries no
/// facilities, so the row has nothing to build the design's avatar stack from
/// yet.
@freezed
abstract class SearchInstructorEntity with _$SearchInstructorEntity {
  const factory SearchInstructorEntity({
    required int id,
    required String name,
    String? title,
    String? imageUrl,
    String? centerName,
  }) = _SearchInstructorEntity;
}
