import 'package:coflow_users_v2/features/authentication/data/models/models.dart';

/// Response of the `profile` endpoint.
///
/// Account counters come from `account-statistics`, independently of identity.
class ProfileModel {
  const ProfileModel({required this.user});

  final UserModel user;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(user: UserModel.fromJson(json));
  }
}
