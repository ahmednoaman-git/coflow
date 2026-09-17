import 'package:coflow_users_v2/features/account/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/account/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('profile identity does not require statistics on the profile response', () {
    final entity = ProfileMapper.toEntity(
      ProfileModel.fromJson({
        'id': 7,
        'name': 'Ahmed',
        'email': 'ahmed@example.com',
        'phone': '01000000000',
        'gender': 'male',
        'image': 'https://cdn.example.com/a.png',
      }),
    );

    expect(entity.user.id, 7);
    expect(entity.user.name, 'Ahmed');
    expect(entity.user.image, 'https://cdn.example.com/a.png');
  });

  test('maps account-statistics response without guessing from login totals', () {
    final entity = ProfileMapper.statsToEntity(
      AccountStatisticsModel.fromJson({
        'calendars': 22,
        'purchases': 23,
        'gifts': 44,
        'profiles': 0,
        // Legacy profile counters must not override the authoritative totals.
        'total_tickets': '4',
        'total_promotions': '5',
        'total_coupons': 6,
        'total_likes': '3/12',
      }),
    );

    expect(entity.calendarEntries, 22);
    expect(entity.purchases, 23);
    expect(entity.gifts, 44);
    expect(entity.businesses, 0);
  });

  test('incomplete statistics fail rather than presenting fabricated zeros', () {
    expect(
      () => AccountStatisticsModel.fromJson({'calendars': 22}),
      throwsA(isA<Exception>()),
    );
  });
}
