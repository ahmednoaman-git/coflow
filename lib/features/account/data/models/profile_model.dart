import 'package:coflow_users_v2/features/authentication/data/models/models.dart';

/// Response of the `profile` endpoint.
///
/// Account counters come from `account-statistics`, independently of identity.
class ProfileModel {
  const ProfileModel({required this.user, this.tagIds = const []});

  final UserModel user;

  /// Ids of the activity tags the user picked as preferences (`tags`). Read
  /// leniently: rows may be tag objects or bare ids.
  final List<int> tagIds;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(user: UserModel.fromJson(json), tagIds: _tagIds(json['tags']));
  }

  static List<int> _tagIds(Object? raw) {
    if (raw is! List) return const [];
    return [
      for (final tag in raw) ?_asInt(tag is Map ? tag['id'] : tag),
    ];
  }

  static int? _asInt(Object? value) => switch (value) {
    final int value => value,
    final String value => int.tryParse(value),
    _ => null,
  };
}
