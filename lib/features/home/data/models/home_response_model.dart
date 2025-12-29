import 'package:json_annotation/json_annotation.dart';

import 'profile_model.dart';

part 'home_response_model.g.dart';

/// Data model for home API response.
@JsonSerializable()
class HomeResponseModel {
  const HomeResponseModel({
    required this.profiles,
    required this.recentlyJoined,
  });

  final List<ProfileModel> profiles;
  @JsonKey(name: 'recently_joined')
  final List<ProfileModel> recentlyJoined;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseModelToJson(this);
}
