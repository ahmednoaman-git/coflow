import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/entities.dart';

part 'register_response_model.g.dart';

/// Data model for registration API response.
@JsonSerializable()
class RegisterResponseModel {
  const RegisterResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.birthdate,
    required this.gender,
    this.nationality,
    this.image,
    required this.createdAt,
    required this.totalLikes,
    required this.totalTickets,
    required this.totalPromotions,
    required this.totalGifts,
    required this.totalPurchases,
    this.token,
  });

  final int id;
  final String name;
  final String email;
  final String phone;
  final String? birthdate;
  @JsonKey(fromJson: _genderFromJson, toJson: _genderToJson)
  final Gender gender;
  final String? nationality;
  final String? image;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'total_likes', fromJson: _parseTotalLikes, defaultValue: '0/0')
  final String totalLikes;
  @JsonKey(name: 'total_tickets', defaultValue: 0)
  final int totalTickets;
  @JsonKey(name: 'total_promotions', defaultValue: 0)
  final int totalPromotions;
  @JsonKey(name: 'total_gifts', defaultValue: 0)
  final int totalGifts;
  @JsonKey(name: 'total_purchases', defaultValue: 0)
  final int totalPurchases;
  final String? token;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);

  static Gender _genderFromJson(String? json) {
    return switch (json?.toLowerCase()) {
      'male' => Gender.male,
      'female' => Gender.female,
      _ => Gender.male,
    };
  }

  static String _genderToJson(Gender gender) => gender.name;

  static String _parseTotalLikes(dynamic value) {
    if (value == null) return '0/0';
    return value.toString();
  }
}
