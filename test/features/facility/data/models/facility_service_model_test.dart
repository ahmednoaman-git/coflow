import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CollapsedFacilityServiceModel', () {
    test('reads a reservations count sent as a string', () {
      // CLYMB's Activities tab failed to load on this on 2026-09-23.
      final model = CollapsedFacilityServiceModel.fromJson({
        'id': 588,
        'name': 'Indoor Skydiving',
        'reservations': '38',
      });

      expect(model.reservations, 38);
    });

    test('still reads a numeric or missing count', () {
      expect(
        CollapsedFacilityServiceModel.fromJson({
          'id': 1,
          'name': 'A',
          'reservations': 5,
        }).reservations,
        5,
      );
      expect(CollapsedFacilityServiceModel.fromJson({'id': 1, 'name': 'A'}).reservations, isNull);
    });
  });
}
