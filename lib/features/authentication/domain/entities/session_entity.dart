import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_entity.dart';

part 'session_entity.freezed.dart';

/// Entity representing an authenticated user session.
/// Contains the user data and the access token for API authentication.
@freezed
abstract class SessionEntity with _$SessionEntity {
  const factory SessionEntity({
    required UserEntity user,
    required String accessToken,
  }) = _SessionEntity;
}
