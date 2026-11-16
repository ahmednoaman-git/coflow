import 'package:coflow_users_v2/core/core.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

abstract interface class ActivityPreferencesRepository {
  /// The activity lines that have tags, each with its tags.
  AsyncTask<List<PreferenceActivityLineEntity>> getPreferenceCatalog();

  AsyncTask<void> savePreferences(SaveActivityPreferencesDto dto);
}
