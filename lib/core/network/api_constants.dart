/// This class centralizes all API-related configuration including base URLs,
/// timeout durations, and default headers.
class ApiConstants {
  ApiConstants._();

  // Base URLs
  /// The base URL for all API endpoints
  static const String baseUrl = 'https://tm-ips.azdanapps.com/';

  // Timeout durations
  /// Connection timeout duration (time to establish connection)
  static const Duration connectTimeout = Duration(seconds: 30);

  /// Receive timeout duration (time to receive data after connection)
  static const Duration receiveTimeout = Duration(seconds: 30);

  /// Send timeout duration (time to send data after connection)
  static const Duration sendTimeout = Duration(seconds: 30);

  // Default headers
  /// Default headers sent with every request
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // HTTP status codes for reference
  /// Successful response
  static const int statusOk = 200;

  /// Resource created
  static const int statusCreated = 201;

  /// Bad request
  static const int statusBadRequest = 400;

  /// Unauthorized
  static const int statusUnauthorized = 401;

  /// Forbidden
  static const int statusForbidden = 403;

  /// Not found
  static const int statusNotFound = 404;

  /// Validation error
  static const int statusUnprocessableEntity = 422;

  /// Internal server error
  static const int statusInternalServerError = 500;
}

class ApiEndpoints {
  ApiEndpoints._();

  static const String getTenantById = 'tenant/byname';
}
