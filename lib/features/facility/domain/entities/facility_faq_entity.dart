import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_faq_entity.freezed.dart';

/// One question-and-answer pair published by a facility.
@freezed
abstract class FacilityFaqEntity with _$FacilityFaqEntity {
  const factory FacilityFaqEntity({
    required int id,
    required String question,
    required String answer,
  }) = _FacilityFaqEntity;
}
