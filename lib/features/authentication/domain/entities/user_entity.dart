import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// Core user entity representing an authenticated user.
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String? birthdate,
    required Gender gender,
    required String? nationality,
    required String? image,
    required String totalLikes,
    required int totalTickets,
    required int totalPromotions,
    required int totalGifts,
    required int totalPurchases,
  }) = _UserEntity;
}

/// Gender enumeration for user profile.
enum Gender {
  male,
  female;

  /// Returns a localized display name for the gender.
  String displayName(BuildContext context) => switch (this) {
    Gender.male => context.l10n.genderMale,
    Gender.female => context.l10n.genderFemale,
  };
}
