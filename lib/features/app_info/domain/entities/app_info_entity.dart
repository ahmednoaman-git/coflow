import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info_entity.freezed.dart';

/// Coflow's legal texts and contact details, from `GET info`.
@freezed
abstract class AppInfoEntity with _$AppInfoEntity {
  const factory AppInfoEntity({
    /// Plain text: paragraphs separated by line breaks. Null when unset.
    String? terms,

    /// Plain text, like [terms]. Null when unset.
    String? privacyPolicy,
    String? email,
    String? phone,
  }) = _AppInfoEntity;
}
