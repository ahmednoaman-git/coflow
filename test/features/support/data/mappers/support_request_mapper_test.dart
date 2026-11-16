import 'package:coflow_users_v2/features/search/data/models/paginated_response_model.dart';
import 'package:coflow_users_v2/features/support/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/support/data/models/models.dart';
import 'package:coflow_users_v2/features/support/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Rows of `GET supports` as the test server returned them on 2026-11-16.
  final pending = {
    'id': 29,
    'image': null,
    'issue': 'She tried to go into the male toilet!',
    'notes': 'Checking the case now!',
    'status': 'pending',
    'user_id': 1,
    'admin_id': 231,
    'facility_id': 199,
    'created_at': '2026-11-15 18:51:37',
    'updated_at': '2026-11-15 18:55:34',
    'description': 'She tried to go into the male toilet!',
    'admin_response': 'Checking the case now!',
    'admin': {'id': 231, 'name': 'Fouad'},
  };
  final open = {
    'id': 3,
    'image': 'https://coflow-test.s3.amazonaws.com/public/assets/uploads/1729346587-english.jpg',
    'issue': 'issue 2',
    'notes': null,
    'status': 'new',
    'created_at': '2024-10-19 14:03:07',
    'description': 'issue 2',
    'admin_response': null,
    'admin': null,
  };

  SupportRequestEntity map(Map<String, dynamic> json) =>
      SupportRequestMapper.toEntity(SupportRequestModel.fromJson(json));

  group('SupportRequestMapper.toEntity', () {
    test('maps a request an admin answered', () {
      final request = map(pending);

      expect(request.id, 29);
      expect(request.issue, 'She tried to go into the male toilet!');
      expect(request.status, SupportRequestStatus.pending);
      expect(request.adminNote, 'Checking the case now!');
      expect(request.imageUrl, isNull);
      expect(request.createdAt, DateTime.utc(2026, 11, 15, 18, 51, 37).toLocal());
    });

    test('maps a new request with an image and no reply', () {
      final request = map(open);

      expect(request.status, SupportRequestStatus.open);
      expect(request.adminNote, isNull);
      expect(request.imageUrl, endsWith('english.jpg'));
    });

    test('falls back to description and notes when the other names are missing', () {
      final request = map({
        'id': 1,
        'description': 'From description',
        'notes': 'From notes',
        'status': 'resolved',
      });

      expect(request.issue, 'From description');
      expect(request.adminNote, 'From notes');
      expect(request.status, SupportRequestStatus.resolved);
    });

    test('keeps an unknown status as other, with its raw value', () {
      final request = map({'id': 1, 'issue': 'x', 'status': 'Closed'});

      expect(request.status, SupportRequestStatus.other);
      expect(request.rawStatus, 'closed');
    });
  });

  test('toPage maps the Laravel paginator', () {
    final page = SupportRequestMapper.toPage(
      PaginatedResponseModel.fromJson({
        'current_page': 1,
        'data': [pending, open],
        'last_page': 2,
        'per_page': 10,
        'total': 12,
      }, SupportRequestModel.fromJson),
    );

    expect(page.items.map((request) => request.id), [29, 3]);
    expect(page.hasMore, isTrue);
    expect(page.total, 12);
  });
}
