import 'package:coflow_users_v2/features/calendar/data/mappers/mappers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('flattens dated groups and excludes cancelled entries retained by the API', () {
    final rows = AccountReservationPayloadMapper.rows({
      '2026-09-19': [
        {'id': 181, 'status': 'cancelled'},
        {'id': 182, 'status': 'reserved'},
        {'id': 183, 'status': 'waiting'},
      ],
      '2026-09-20': [
        {'id': 184, 'status': 'canceled'},
      ],
    });
    expect(rows.map((row) => row['id']), [182, 183]);
    expect(AccountReservationPayloadMapper.rows([]), isEmpty);
  });

  test('combines actual facility/service context and both instructor formats', () {
    final model = AccountReservationPayloadMapper.toModel(
      {
        'id': 154,
        'status': 'reserved',
        'facility_id': 191,
        'service': 'Beginner Flow',
        'calendar': {
          'id': 755,
          'service_id': 581,
          'date': '2026-09-19',
          'from': '23:00:00',
          'to': '01:00:00',
          'capacity': 6,
          'remain': 5,
          'instructors': [
            {'id': 72, 'full_name': 'Coach One'},
          ],
          'other_instructors': [
            {'id': 784, 'first_name': 'Coach', 'last_name': 'Two'},
          ],
        },
      },
      facility: {'id': 191, 'name': 'Flow Facility', 'logo': null},
      service: {
        'id': 581,
        'name': 'Beginner Flow',
        'level': {'name': 'BEGINNER', 'color': '#2fdac2'},
      },
    );
    expect(model.facilityName, 'Flow Facility');
    expect(model.serviceName, 'Beginner Flow');
    expect(model.startsAt, DateTime(2026, 9, 19, 23));
    expect(model.endsAt, DateTime(2026, 9, 20, 1));
    expect(model.level?.name, 'BEGINNER');
    expect(model.instructors.map((i) => '${i.firstName} ${i.lastName}'.trim()), [
      'Coach One',
      'Coach Two',
    ]);
  });
}
