import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:coflow_users_v2/features/saved_profiles/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/saved_profiles/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// The facility as `GET wishlist` nests it: the bare record, with no
  /// `city`/`area`/`activity_line` relations loaded.
  Map<String, dynamic> facility({
    int id = 173,
    String name = 'skywings',
    int activityLineId = 1,
    String status = 'visible',
    Map<String, dynamic>? city,
    Map<String, dynamic>? area,
  }) => {
    'id': id,
    'name': name,
    'title': 'Paragliding',
    'logo': 'https://coflow-test.s3.amazonaws.com/public/1782241138blob',
    'cover': 'https://coflow-test.s3.amazonaws.com/public/1782241138blob',
    'views': 26,
    'saves': 1,
    'tracks': 1,
    'facility_type': 'GO',
    'status': status,
    'status_msg': null,
    'rate': '0/0',
    'subscription': 'inactive',
    'payment_type': 'contact',
    'activity_line_id': activityLineId,
    'city_id': 12,
    'area_id': 23,
    'tags': [
      {
        'id': 128,
        'name': 'Paragliding',
        'activity_line_id': 1,
        'description': null,
        'photo': null,
        'pivot': {'facility_id': id, 'tag_id': 128},
      },
    ],
    if (city != null) 'city': city,
    if (area != null) 'area': area,
  };

  Map<String, dynamic> row({
    required int id,
    required String type,
    int? facilityId = 173,
    Map<String, dynamic>? facility,
  }) => {
    'id': id,
    'type': type,
    'user_id': 1,
    'facility_id': facilityId,
    'promotion_id': null,
    'created_at': '2026-09-23T15:06:30.000000Z',
    'updated_at': '2026-09-23T15:06:30.000000Z',
    'facility': facility,
  };

  /// Runs rows through the `profiles` paginator the way the data source does.
  List<SavedProfileModel> page(List<Map<String, dynamic>> rows) =>
      SavedProfilesPageModel.fromJson({'current_page': 1, 'last_page': 1, 'data': rows}).profiles;

  test('maps a saved row to the facility it points at', () {
    final profile = SavedProfileMapper.toEntities(
      page([row(id: 23, type: 'save', facility: facility())]),
    ).single;

    expect(profile.id, 173);
    expect(profile.facility.name, 'skywings');
    expect(profile.facility.description, 'Paragliding');
    expect(profile.facility.logoUrl, isNotNull);
    expect(profile.activityLine, ActivityLineEntity.sky);
    expect(profile.isTemporarilyClosed, isFalse);
    expect(profile.isTracked, isFalse);
  });

  test('folds a track row into its save as the tracked flag', () {
    // Tracking skywings on 2026-09-23 added row 24 beside save row 23.
    final profiles = SavedProfileMapper.toEntities(
      page([
        row(id: 23, type: 'save', facility: facility()),
        row(id: 24, type: 'track', facility: facility()),
      ]),
    );

    expect(profiles, hasLength(1));
    expect(profiles.single.isTracked, isTrue);
  });

  test('lists only facilities that carry a save row', () {
    final profiles = SavedProfileMapper.toEntities(
      page([row(id: 24, type: 'track', facility: facility())]),
    );

    expect(profiles, isEmpty);
  });

  test('keeps one card when a facility is saved twice', () {
    final profiles = SavedProfileMapper.toEntities(
      page([
        row(id: 23, type: 'save', facility: facility()),
        row(id: 25, type: 'save', facility: facility()),
      ]),
    );

    expect(profiles, hasLength(1));
  });

  test('drops rows with no facility behind them', () {
    final profiles = SavedProfileMapper.toEntities(
      page([
        row(id: 23, type: 'save'),
        row(id: 30, type: 'like', facilityId: null),
        row(
          id: 31,
          type: 'save',
          facility: facility(id: 64, name: 'X Wake'),
          facilityId: 64,
        ),
      ]),
    );

    expect(profiles.map((profile) => profile.id), [64]);
  });

  test('keeps the order the wishlist returns', () {
    final profiles = SavedProfileMapper.toEntities(
      page([
        row(
          id: 31,
          type: 'save',
          facilityId: 64,
          facility: facility(id: 64, name: 'X Wake'),
        ),
        row(
          id: 32,
          type: 'save',
          facilityId: 192,
          facility: facility(id: 192, name: 'GO'),
        ),
        row(
          id: 33,
          type: 'track',
          facilityId: 64,
          facility: facility(id: 64, name: 'X Wake'),
        ),
      ]),
    );

    expect(profiles.map((profile) => profile.id), [64, 192]);
    expect(profiles.map((profile) => profile.isTracked), [true, false]);
  });

  test('marks a temporarily closed facility', () {
    final profile = SavedProfileMapper.toEntities(
      page([
        row(
          id: 23,
          type: 'save',
          facility: facility(status: 'temp_closed'),
        ),
      ]),
    ).single;

    expect(profile.facility.status, FacilityStatus.temporarilyClosed);
    expect(profile.isTemporarilyClosed, isTrue);
  });

  group('branch label', () {
    test('is absent while the payload names neither area nor city', () {
      final profile = SavedProfileMapper.toEntities(
        page([row(id: 23, type: 'save', facility: facility())]),
      ).single;

      expect(profile.branchLabel, isNull);
    });

    test('reads area then city once the relations are loaded', () {
      final profile = SavedProfileMapper.toEntities(
        page([
          row(
            id: 23,
            type: 'save',
            facility: facility(
              city: {'id': 13, 'name': 'Cairo'},
              area: {'id': 25, 'name': 'New Cairo'},
            ),
          ),
        ]),
      ).single;

      expect(profile.branchLabel, 'New Cairo, Cairo');
    });

    test('drops a missing half rather than leaving a stray comma', () {
      final profile = SavedProfileMapper.toEntities(
        page([
          row(
            id: 23,
            type: 'save',
            facility: facility(city: {'id': 13, 'name': 'Cairo'}),
          ),
        ]),
      ).single;

      expect(profile.branchLabel, 'Cairo');
    });
  });
}
