import 'package:coflow_users_v2/core/network/interceptors/data_extractor_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

Dio _respondWith(Object payload) => Dio()
  ..interceptors.addAll([
    InterceptorsWrapper(
      onRequest: (options, handler) =>
          handler.resolve(Response(requestOptions: options, statusCode: 200, data: payload), true),
    ),
    DataExtractorInterceptor(),
  ]);

void main() {
  test('preserves extra_data while keeping existing data unwrapping', () async {
    final response = await _respondWith({
      'status': true,
      'data': {'current_page': 1, 'data': []},
      'extra_data': {
        'tags': [
          {'id': 40, 'facilities_count': 5},
        ],
      },
    }).get('https://example.test/facilities');
    expect(response.data, {'current_page': 1, 'data': []});
    expect(response.extra[DataExtractorInterceptor.extraDataKey], {
      'tags': [
        {'id': 40, 'facilities_count': 5},
      ],
    });
  });

  test('rejects HTTP 200 business errors without losing the server message', () async {
    final dio = _respondWith({'status': false, 'message': 'No tickets available.', 'data': null});
    await expectLater(
      dio.get('https://example.test/reserve-slot/1'),
      throwsA(
        isA<DioException>().having(
          (e) => e.response?.data['message'],
          'server message',
          'No tickets available.',
        ),
      ),
    );
  });

  test('unwraps successful purchases and successful empty mutations', () async {
    final receipt = await _respondWith({
      'status': true,
      'data': {'id': 761},
    }).get('https://example.test/purchase-ticket');
    expect(receipt.data, {'id': 761});
    final cancel = await _respondWith({
      'status': true,
      'data': null,
    }).get('https://example.test/reservations/181');
    expect(cancel.data, isNull);
  });
}
