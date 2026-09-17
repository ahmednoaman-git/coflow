import 'package:dio/dio.dart';

/// Interceptor that extracts the 'data' field from API responses.
///
/// The API returns responses in the format:
/// ```json
/// {
///   "status": true,
///   "message": "...",
///   "data": { ... }
/// }
/// ```
///
/// This interceptor automatically unwraps the response to return only
/// the contents of the 'data' field, simplifying data source implementations.
class DataExtractorInterceptor extends Interceptor {
  /// Envelope metadata remains available after unwrapping the primary payload.
  static const extraDataKey = 'api.extra_data';

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final responseData = response.data;

    // Some API mutations report a business rejection with HTTP 200. Preserve
    // its message and reject before unwrapping, so callers never show success.
    if (responseData is Map<String, dynamic> && responseData['status'] == false) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          message: responseData['message'] as String?,
        ),
      );
      return;
    }

    // If the response is a Map and contains a 'data' key, extract it
    if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
      response.extra[extraDataKey] = responseData['extra_data'];
      response.data = responseData['data'];
    }

    handler.next(response);
  }
}
