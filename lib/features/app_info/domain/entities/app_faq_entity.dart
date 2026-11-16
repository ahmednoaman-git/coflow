import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_faq_entity.freezed.dart';

/// One question-and-answer pair Coflow publishes for customers.
@freezed
abstract class AppFaqEntity with _$AppFaqEntity {
  const factory AppFaqEntity({
    required int id,
    required String question,
    required String answer,
  }) = _AppFaqEntity;
}
