import 'dart:convert';
import 'dart:io';

import 'package:coflow_users_v2/features/activity_line/data/data.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('actual API paginator uses the complete extra_data tag catalog and counts', () {
    final json =
        jsonDecode(
              File(
                'test/features/activity_line/data/fixtures/facilities_page.json',
              ).readAsStringSync(),
            )
            as Map<String, dynamic>;
    final model = FacilitiesResponseModel.fromApi(json['data'], json['extra_data']);
    final entity = ActivityLineMapper.toFacilitiesEntity(model);
    expect(entity.facilities.map((f) => f.id), [71, 67, 66, 72, 82]);
    expect(entity.total, 23);
    expect(entity.currentPage, 1);
    expect(entity.lastPage, 5);
    expect(entity.nextPage, 2);
    expect(entity.tags, hasLength(8));
    expect(entity.tags.firstWhere((t) => t.id == 40).count, 5);
    final merged = entity.mergedWith(entity.copyWith(currentPage: 2));
    expect(merged.facilities, hasLength(5));
    expect(merged.nextPage, 3);
  });

  test('empty filtered page retains tags and stops pagination', () {
    final model = FacilitiesResponseModel.fromApi(
      {
        'data': [],
        'current_page': 1,
        'last_page': 1,
        'total': 0,
      },
      {
        'tags': [
          {'id': 40, 'name': 'Crossfit', 'facilities_count': 5},
        ],
      },
    );
    final entity = ActivityLineMapper.toFacilitiesEntity(model);
    expect(entity.facilities, isEmpty);
    expect(entity.tags.single.id, 40);
    expect(entity.nextPage, isNull);
  });

  test('request sends page/limit/tag and preserves location filters', () {
    expect(
      const GetFacilitiesDto(
        activityLineId: 4,
        page: 2,
        limit: 5,
        tagId: 40,
        cityId: 13,
        locationType: 'address based',
      ).toJson(),
      {
        'activity_line_id': 4,
        'page': 2,
        'limit': 5,
        'tag_id': 40,
        'city_id': 13,
        'location_type': 'address based',
      },
    );
    expect(const GetFacilitiesDto(activityLineId: 4).toJson().containsKey('tag_id'), isFalse);
  });
}
