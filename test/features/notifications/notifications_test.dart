import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/notifications/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/notifications/data/models/models.dart';
import 'package:coflow_users_v2/features/notifications/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/notifications/domain/repositories/repositories.dart';
import 'package:coflow_users_v2/features/notifications/domain/use_cases/use_cases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

class _FakeRepository implements NotificationsRepository {
  _FakeRepository(this.notifications, {this.lastSeen});

  final List<AppNotificationEntity> notifications;
  int? lastSeen;

  @override
  AsyncTask<List<AppNotificationEntity>> getNotifications() => TaskEither.right(notifications);

  @override
  AsyncTask<int?> getLastSeenId() => TaskEither.right(lastSeen);

  @override
  AsyncTask<void> setLastSeenId(int id) => TaskEither(() async {
    lastSeen = id;
    return const Right(null);
  });
}

void main() {
  // Rows of `GET notifications` as the test server returned them on 2026-11-16.
  final rows = <Map<String, dynamic>>[
    {
      'id': 15,
      'title': 'test',
      'content': 'test',
      'facility_id': null,
      'created_at': '2026-11-06',
      'facility': null,
    },
    {
      'id': 16,
      'title': 'Track Alert',
      'content': 'Rubye Schinner is tracking your profile',
      'facility_id': 71,
      'created_at': '2026-11-12',
      'facility': {
        'id': 71,
        'name': 'Calisthenics Club',
        'logo': 'https://coflow-test.s3.amazonaws.com/public/assets/uploads/1675941133-blob',
        'facility_type': 'FLOW',
        'activity_line_id': 4,
        'is_branch': false,
        'tags': <dynamic>[],
        'other_tags': <dynamic>[],
      },
    },
  ];

  final notifications = AppNotificationMapper.toEntities(
    rows.map(AppNotificationModel.fromJson).toList(),
  );

  group('AppNotificationMapper', () {
    test('orders newest first', () {
      expect(notifications.map((n) => n.id), [16, 15]);
    });

    test('maps a facility notification', () {
      final notification = notifications.first;
      expect(notification.title, 'Track Alert');
      expect(notification.sentOn, DateTime(2026, 11, 12));
      expect(
        notification.facility,
        const NotificationFacilityEntity(
          id: 71,
          name: 'Calisthenics Club',
          logoUrl: 'https://coflow-test.s3.amazonaws.com/public/assets/uploads/1675941133-blob',
          activityLineId: 4,
          facilityType: 'FLOW',
        ),
      );
    });

    test('maps a message from Coflow without a facility', () {
      expect(notifications.last.facility, isNull);
    });
  });

  group('unseen notifications', () {
    test('everything is unseen before the list is first opened', () async {
      final result = await HasUnseenNotificationsUseCase(
        _FakeRepository(notifications),
      ).call().run();
      expect(result, const Right<Failure, bool>(true));
    });

    test('opening the list marks the newest as seen', () async {
      final repository = _FakeRepository(notifications);
      await MarkNotificationsSeenUseCase(repository).call(notifications).run();

      expect(repository.lastSeen, 16);
      final result = await HasUnseenNotificationsUseCase(repository).call().run();
      expect(result, const Right<Failure, bool>(false));
    });

    test('the seen mark never moves back', () async {
      final repository = _FakeRepository(notifications, lastSeen: 20);
      await MarkNotificationsSeenUseCase(repository).call(notifications).run();
      expect(repository.lastSeen, 20);
    });
  });
}
