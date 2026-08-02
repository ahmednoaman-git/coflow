import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// TODO(backend): `services/{facilityId}?type=activity` always returns empty
/// data for Go accounts (confirmed with backend, fix pending). This stub
/// substitutes a canned response so the Go Activities tab can be built and
/// reviewed. Delete this class and its routing in `FacilityRepositoryImpl`
/// once the backend fix ships.
///
/// Service `572` below is a real id on the test API (see the sample Go
/// response in the facility services plan), so tapping it resolves against
/// the real `service/572` details endpoint. Other stub ids are made up and
/// may 404 on details — the details screen's error/retry state covers that.
@lazySingleton
class FacilityServicesStubDataSource {
  AsyncTask<FacilityServicesResponseModel> getFacilityServices(GetFacilityServicesDto dto) {
    return AsyncTaskExtension.tryCatchCacheFailure(
      () async => FacilityServicesResponseModel.fromJson(_stubServicesJson),
    );
  }
}

const _stubServicesJson = <String, dynamic>{
  'folders': [
    {
      'id': 1,
      'name': 'Fitness Classes',
      'services': [
        {
          'id': 572,
          'name': 'Paragliding',
          'duration': '1',
          'duration_list_id': 18,
          'image': 'https://coflow-test.s3.amazonaws.com/public/assets/uploads/1782244597-blob',
          'reservations': 12,
          'duration_list': {'id': 18, 'name': 'Hour'},
          'level': null,
        },
        {
          'id': 9001,
          'name': 'HIIT Blast',
          'duration': '45',
          'duration_list_id': 19,
          'image': 'https://coflow-test.s3.amazonaws.com/public/assets/uploads/1782558798-blob',
          'reservations': 8,
          'duration_list': {'id': 19, 'name': 'Minutes'},
          'level': null,
        },
        {
          'id': 9002,
          'name': 'Strength Circuit',
          'duration': null,
          'duration_list_id': null,
          'image': 'https://coflow-test.s3.amazonaws.com/public/assets/uploads/1782558906-blob',
          'reservations': 5,
          'duration_list': null,
          'level': null,
        },
      ],
    },
    {
      'id': 2,
      'name': 'Aquatics',
      'services': [
        {
          'id': 9003,
          'name': 'Lap Swimming',
          'duration': '1',
          'duration_list_id': 18,
          'image': 'https://coflow-test.s3.amazonaws.com/public/assets/uploads/1782558989-blob',
          'reservations': 3,
          'duration_list': {'id': 18, 'name': 'Hour'},
          'level': null,
        },
        {
          'id': 9004,
          'name': 'Aqua Aerobics',
          'duration': '30',
          'duration_list_id': 19,
          'image': 'https://coflow-test.s3.amazonaws.com/public/assets/uploads/1782559136-blob',
          'reservations': 6,
          'duration_list': {'id': 19, 'name': 'Minutes'},
          'level': null,
        },
      ],
    },
  ],
  'services': [
    {
      'id': 9005,
      'name': 'Open Gym',
      'duration': '2',
      'duration_list_id': 18,
      'image': 'https://coflow-test.s3.amazonaws.com/public/assets/uploads/1782244614-blob',
      'reservations': 20,
      'duration_list': {'id': 18, 'name': 'Hour'},
      'level': null,
    },
    {
      'id': 9006,
      'name': 'Personal Training',
      'duration': '1',
      'duration_list_id': 18,
      'image': 'https://coflow-test.s3.amazonaws.com/public/assets/uploads/1782244597-blob',
      'reservations': 4,
      'duration_list': {'id': 18, 'name': 'Hour'},
      'level': null,
    },
  ],
};
