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
    required int totalLikes,
    required int totalTickets,
    required int totalPromotions,
  }) = _UserEntity;
}

/// Gender enumeration for user profile.
enum Gender {
  male,
  female;

  String get displayName => switch (this) {
    Gender.male => 'Male',
    Gender.female => 'Female',
  };
}
