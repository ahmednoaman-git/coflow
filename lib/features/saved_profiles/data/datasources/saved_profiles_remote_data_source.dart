import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../models/models.dart';

/// Saved-profiles API endpoints.
abstract final class SavedProfilesEndpoints {
  /// Every facility the signed-in user has saved, paginated.
  static const String wishlist = 'wishlist';
}

/// Remote data source for the user's saved facilities.
@lazySingleton
class SavedProfilesRemoteDataSource {
  const SavedProfilesRemoteDataSource(this._dio);
  final DioClient _dio;

  /// Page size asked of the wishlist, which otherwise serves ten rows at a
  /// time. It honours `limit`; `per_page` is ignored.
  static const int _pageSize = 50;

  /// Hard stop on the page walk, so a paginator that never reports a last page
  /// cannot spin forever.
  static const int _maxPages = 20;

  /// Every saved row, across all pages.
  ///
  /// The whole list is pulled in one go because the Profiles screen filters it
  /// by activity line client-side, and a filter over a partly loaded list
  /// would pass off saves that had not loaded yet as missing.
  AsyncTask<List<SavedProfileModel>> getSavedProfiles() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final profiles = <SavedProfileModel>[];
      var page = 1;
      var lastPage = 1;

      do {
        final response = await _dio.get(
          SavedProfilesEndpoints.wishlist,
          queryParameters: {'page': page, 'limit': _pageSize},
        );
        final data = response.data as Map<String, dynamic>;
        final pageModel = SavedProfilesPageModel.fromJson(
          data['profiles'] as Map<String, dynamic>,
        );

        profiles.addAll(pageModel.profiles);
        lastPage = pageModel.lastPage;
        page++;
      } while (page <= lastPage && page <= _maxPages);

      return List.unmodifiable(profiles);
    });
  }
}
