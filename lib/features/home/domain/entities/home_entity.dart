import 'package:freezed_annotation/freezed_annotation.dart';

import 'instructor_entity.dart';
import 'profile_entity.dart';

part 'home_entity.freezed.dart';

/// Main entity containing home screen data.
@freezed
abstract class HomeEntity with _$HomeEntity {
  const factory HomeEntity({
    required List<ProfileEntity> profiles,
    required List<ProfileEntity> recentlyJoined,
    required List<InstructorEntity> instructors,
  }) = _HomeEntity;
}
