import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/account/data/models/models.dart';
import 'package:coflow_users_v2/features/activity_preferences/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/activity_preferences/data/models/models.dart';
import 'package:coflow_users_v2/features/activity_preferences/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/activity_preferences/presentation/cubit/activity_preferences_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ActivityPreferencesMapper.toCatalog', () {
    // Trimmed from `GET account-tags` on 2026-11-16.
    final rows = <Map<String, dynamic>>[
      {
        'id': 1,
        'name': 'Sky',
        'image': 'https://example.com/sky.png',
        'color': '#2F9BE8',
        'facilities': 2,
        'tags': [
          {'id': 115, 'name': 'Skydiving', 'activity_line_id': 1},
          {'id': 127, 'name': ' Parachuting ', 'activity_line_id': 1},
        ],
      },
      {'id': 5, 'name': 'Explore', 'image': null, 'color': null, 'facilities': 0, 'tags': []},
    ];

    final catalog = ActivityPreferencesMapper.toCatalog(
      rows.map(PreferenceActivityLineModel.fromJson).toList(),
    );

    test('drops lines without tags', () {
      expect(catalog.map((line) => line.id), [1]);
    });

    test('maps the tags, trimmed', () {
      expect(catalog.single.tags, const [
        PreferenceTagEntity(id: 115, name: 'Skydiving'),
        PreferenceTagEntity(id: 127, name: 'Parachuting'),
      ]);
    });
  });

  group('ProfileModel tag ids', () {
    Map<String, dynamic> profile(Object? tags) => {
      'id': 1,
      'name': 'Rubye Schinner',
      'email': 'sa@sa.com',
      'phone': '01154760185',
      'tags': tags,
    };

    test('reads tag objects and bare ids', () {
      expect(
        ProfileModel.fromJson(
          profile([
            {'id': 115, 'name': 'Skydiving'},
            '127',
            128,
          ]),
        ).tagIds,
        [115, 127, 128],
      );
    });

    test('reads an empty or missing list as no picks', () {
      expect(ProfileModel.fromJson(profile(<dynamic>[])).tagIds, isEmpty);
      expect(ProfileModel.fromJson(profile(null)).tagIds, isEmpty);
    });
  });

  group('ActivityPreferencesState', () {
    const loaded = ActivityPreferencesState(
      preferencesRequest: AsyncState.success(
        ActivityPreferencesEntity(lines: [], selectedTagIds: {115}),
      ),
    );

    test('shows the saved picks until edited', () {
      expect(loaded.selectedTagIds, {115});
      expect(loaded.hasChanges, isFalse);
      expect(loaded.canSave, isFalse);
    });

    test('can save a changed, non-empty selection', () {
      final edited = loaded.copyWith(draft: {115, 127});
      expect(edited.hasChanges, isTrue);
      expect(edited.canSave, isTrue);
    });

    test('a draft equal to the saved picks is not a change', () {
      expect(loaded.copyWith(draft: {115}).hasChanges, isFalse);
    });

    test('unpicking back to an empty saved selection asks for nothing', () {
      const empty = ActivityPreferencesState(
        preferencesRequest: AsyncState.success(
          ActivityPreferencesEntity(lines: [], selectedTagIds: {}),
        ),
        draft: {},
      );
      expect(empty.hasChanges, isFalse);
      expect(empty.needsAPick, isFalse);
    });

    test('never saves an empty selection, which the server refuses', () {
      final cleared = loaded.copyWith(draft: <int>{});
      expect(cleared.hasChanges, isTrue);
      expect(cleared.canSave, isFalse);
      expect(cleared.needsAPick, isTrue);
    });
  });
}
