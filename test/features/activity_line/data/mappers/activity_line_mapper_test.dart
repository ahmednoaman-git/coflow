import 'package:coflow_users_v2/features/activity_line/data/mappers/activity_line_mapper.dart';
import 'package:coflow_users_v2/features/activity_line/data/models/facility_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// A `POST facilities` item as the test API returns it (facility 71).
  FacilityModel facility({Map<String, dynamic>? city, Map<String, dynamic>? area}) =>
      FacilityModel.fromJson({
        'id': 71,
        'name': 'Calisthenics Club',
        'title': 'BODY WEIGHT GYM',
        'views': 302,
        'rate': '0/0',
        'facility_type': 'FLOW',
        'activity_line_id': 4,
        'status': 'visible',
        'subscription': 'basic',
        'payment_type': 'contact',
        'city_id': 13,
        'area_id': 25,
        'tags': <dynamic>[],
        if (city != null) 'city': city,
        if (area != null) 'area': area,
      });

  group('location label', () {
    test('reads area then city', () {
      final entity = ActivityLineMapper.toFacilityEntity(
        facility(city: {'id': 13, 'name': 'Cairo'}, area: {'id': 25, 'name': 'Maadi'}),
      );

      expect(entity.locationLabel, 'Maadi, Cairo');
    });

    test('drops a missing half rather than leaving a stray comma', () {
      final entity = ActivityLineMapper.toFacilityEntity(
        facility(city: {'id': 13, 'name': 'Cairo'}),
      );

      expect(entity.locationLabel, 'Cairo');
    });

    test('is absent when the payload names neither', () {
      expect(ActivityLineMapper.toFacilityEntity(facility()).locationLabel, isNull);
    });
  });
}
