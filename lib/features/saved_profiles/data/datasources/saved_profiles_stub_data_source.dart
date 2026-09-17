import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// TODO(backend): the saved-facilities endpoints do not exist yet. This source
/// keeps an in-memory list for the session so the Profiles screen can be built
/// and reviewed — saving/tracking survive navigation but not a restart. Delete
/// this class and its routing in `SavedProfilesRepositoryImpl` once the real
/// endpoints ship.
///
/// The seed spans all four activity lines, mixes tracked with untracked and
/// open with temporarily closed, so the screen exercises every card variant and
/// the line filter has something to sift.
@lazySingleton
class SavedProfilesStubDataSource {
  SavedProfilesStubDataSource();

  /// Simulated network latency, so loading states are visible in review.
  static const Duration _latency = Duration(milliseconds: 400);

  late final List<SavedProfileModel> _profiles = List.of(_seed);

  AsyncTask<SavedProfilesResponseModel> getSavedProfiles() {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      await Future<void>.delayed(_latency);
      return SavedProfilesResponseModel(profiles: List.unmodifiable(_profiles));
    });
  }

  AsyncTask<void> unsaveProfile(UnsaveProfileDto dto) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      await Future<void>.delayed(_latency);
      _profiles.removeWhere((profile) => profile.id == dto.profileId);
    });
  }

  AsyncTask<void> setProfileTracking(SetProfileTrackingDto dto) {
    return AsyncTaskExtension.tryCatchCacheFailure(() async {
      await Future<void>.delayed(_latency);

      final index = _profiles.indexWhere((profile) => profile.id == dto.profileId);
      if (index == -1) return;

      _profiles[index] = _copyWithTracking(_profiles[index], dto.isTracked);
    });
  }

  static SavedProfileModel _copyWithTracking(SavedProfileModel model, bool isTracked) {
    return SavedProfileModel(
      id: model.id,
      name: model.name,
      description: model.description,
      activityLineId: model.activityLineId,
      status: model.status,
      logo: model.logo,
      likesCount: model.likesCount,
      branch: model.branch,
      isTracked: isTracked,
    );
  }

  static const List<SavedProfileModel> _seed = [
    SavedProfileModel(
      id: 1,
      name: 'Gravity',
      description: 'Aerial Silks & Flexibility',
      activityLineId: 1,
      status: 'temp_closed',
      likesCount: 250,
      branch: SavedProfileBranchModel(id: 11, area: 'New Cairo', city: 'Cairo'),
      isTracked: true,
    ),
    SavedProfileModel(
      id: 2,
      name: 'Blue Depths',
      description: 'Freediving & Open Water',
      activityLineId: 2,
      status: 'visible',
      likesCount: 132,
      branch: SavedProfileBranchModel(id: 21, area: 'Maadi', city: 'Cairo'),
    ),
    SavedProfileModel(
      id: 3,
      name: 'Terra Studio',
      description: 'Pottery & Ceramics',
      activityLineId: 3,
      status: 'visible',
      likesCount: 87,
      branch: SavedProfileBranchModel(id: 31, area: 'Zamalek', city: 'Cairo'),
      isTracked: true,
    ),
    SavedProfileModel(
      id: 4,
      name: 'Ember Athletics',
      description: 'Strength & Conditioning',
      activityLineId: 4,
      status: 'temp_closed',
      likesCount: 415,
      branch: SavedProfileBranchModel(id: 41, area: 'Sheikh Zayed', city: 'Giza'),
    ),
    SavedProfileModel(
      id: 5,
      name: 'Skyline Yoga',
      description: 'Vinyasa & Breathwork',
      activityLineId: 1,
      status: 'visible',
      likesCount: 64,
      branch: SavedProfileBranchModel(id: 51, area: 'Nasr City', city: 'Cairo'),
    ),
    SavedProfileModel(
      id: 6,
      name: 'Tide Club',
      description: 'Swimming & Water Polo',
      activityLineId: 2,
      status: 'visible',
      likesCount: 198,
      branch: SavedProfileBranchModel(id: 61, area: 'Heliopolis', city: 'Cairo'),
    ),
    SavedProfileModel(
      id: 7,
      name: 'Clay & Canvas',
      description: 'Painting Workshops',
      activityLineId: 3,
      status: 'visible',
      likesCount: 41,
      branch: SavedProfileBranchModel(id: 71, area: 'Dokki', city: 'Giza'),
    ),
    SavedProfileModel(
      id: 8,
      name: 'Pulse Boxing',
      description: 'Boxing & Kickboxing',
      activityLineId: 4,
      status: 'visible',
      likesCount: 309,
      branch: SavedProfileBranchModel(id: 81, area: 'New Cairo', city: 'Cairo'),
      isTracked: true,
    ),
  ];
}
