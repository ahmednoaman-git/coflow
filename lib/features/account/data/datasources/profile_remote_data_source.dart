import 'package:coflow_users_v2/core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// Profile API endpoints.
abstract final class ProfileEndpoints {
  /// GET reads the profile; POST on the same path is the update.
  static const String profile = 'profile';
  static const String changeImage = 'change-image';
  static const String changePassword = 'change-password';
  static const String accountStatistics = 'account-statistics';
  static const String nationalities = 'nationalities';
}

/// Remote data source for the signed-in user's profile.
@lazySingleton
class ProfileRemoteDataSource {
  const ProfileRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<ProfileModel> getProfile() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(ProfileEndpoints.profile);
      return ProfileModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  AsyncTask<AccountStatisticsModel> getAccountStatistics() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(ProfileEndpoints.accountStatistics);
      return AccountStatisticsModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  AsyncTask<void> updateProfile(UpdateProfileDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      await _dio.post(ProfileEndpoints.profile, data: dto.toJson());
    });
  }

  AsyncTask<void> changeProfileImage(ChangeProfileImageDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          dto.image.path,
          filename: dto.image.uri.pathSegments.last,
        ),
      });
      await _dio.post(
        ProfileEndpoints.changeImage,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
    });
  }

  AsyncTask<void> changePassword(ChangePasswordDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      await _dio.post(ProfileEndpoints.changePassword, data: dto.toJson());
    });
  }

  AsyncTask<List<NationalityModel>> getNationalities() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(ProfileEndpoints.nationalities);
      return (response.data as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map(NationalityModel.fromJson)
          .toList(growable: false);
    });
  }
}
