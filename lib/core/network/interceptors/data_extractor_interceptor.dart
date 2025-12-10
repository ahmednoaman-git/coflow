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
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final responseData = response.data;

    // If the response is a Map and contains a 'data' key, extract it
    if (responseData is Map<String, dynamic> &&
        responseData.containsKey('data')) {
      response.data = responseData['data'];
    }

    handler.next(response);
  }
}
