import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/account/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// The tags on offer (`GET account-tags`) together with the customer's picks,
/// which only `GET profile` carries.
@lazySingleton
class GetActivityPreferencesUseCase {
  const GetActivityPreferencesUseCase(this._repository, this._getProfile);
  final ActivityPreferencesRepository _repository;
  final GetProfileUseCase _getProfile;

  AsyncTask<ActivityPreferencesEntity> call() => _repository.getPreferenceCatalog().flatMap(
    (lines) => _getProfile().map((profile) {
      final offered = {for (final line in lines) ...line.tags.map((tag) => tag.id)};
      return ActivityPreferencesEntity(
        lines: lines,
        // A pick whose tag is no longer offered can't be shown or unpicked.
        selectedTagIds: profile.preferredTagIds.where(offered.contains).toSet(),
      );
    }),
  );
}
