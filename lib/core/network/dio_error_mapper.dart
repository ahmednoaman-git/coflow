import 'package:dio/dio.dart';
import 'package:coflow_users_v2/core/async/failure.dart';
import 'package:coflow_users_v2/core/network/api_constants.dart';

/// Maps [DioException] to appropriate [Failure] types.
///
/// This function provides centralized error handling for all API calls,
/// converting various Dio errors into domain-specific failure types.
///
/// Usage:
/// ```dart
/// TaskEither.tryCatch(
///   () async => await apiCall(),
///   (error, stackTrace) => mapDioErrorToFailure(error),
/// )
/// ```
Failure mapDioErrorToFailure(Object error, StackTrace stackTrace) {
  // Handle DioException specifically
  if (error is DioException) {
    switch (error.type) {
      // Connection timeout - network issue
      case DioExceptionType.connectionTimeout:
        return const NetworkFailure(
          'Connection timeout. Please check your internet connection and try again.',
        );

      // Send timeout - network issue
      case DioExceptionType.sendTimeout:
        return const NetworkFailure(
          'Request timeout. Please check your internet connection and try again.',
        );

      // Receive timeout - network issue
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure(
          'Response timeout. The server took too long to respond.',
        );

      // Bad response - HTTP error codes
      case DioExceptionType.badResponse:
        return _mapHttpError(error);

      // Request cancelled by user
      case DioExceptionType.cancel:
        return const NetworkFailure('Request was cancelled.');

      // Connection error - no internet or server unreachable
      case DioExceptionType.connectionError:
        return const NetworkFailure(
          'Connection failed. Please check your internet connection.',
        );

      // Bad certificate - SSL/TLS error
      case DioExceptionType.badCertificate:
        return const NetworkFailure(
          'Security certificate error. Please contact support.',
        );

      // Unknown Dio error
      case DioExceptionType.unknown:
        return NetworkFailure(
          'Network error: ${error.message ?? "Unknown error occurred"}',
        );
    }
  }

  // Fallback for non-Dio errors
  return UnknownFailure('Unexpected error: ${error.toString()}');
}

/// Maps HTTP response errors to appropriate [Failure] types.
///
/// Handles specific status codes and provides meaningful error messages.
Failure _mapHttpError(DioException error) {
  final statusCode = error.response?.statusCode;
  final responseData = error.response?.data;

  // Try to extract error message from response
  String? errorMessage;
  if (responseData is Map<String, dynamic>) {
    errorMessage =
        responseData['message'] as String? ??
        responseData['error'] as String? ??
        responseData['detail'] as String?;
  }

  switch (statusCode) {
    case ApiConstants.statusBadRequest:
      return BadRequestFailure(
        errorMessage ?? 'Bad request. Please check your input and try again.',
      );

    case ApiConstants.statusUnauthorized:
      return AuthenticationFailure(
        errorMessage ?? 'Unauthorized. Please log in and try again.',
      );

    case ApiConstants.statusForbidden:
      return AuthorizationFailure(
        errorMessage ??
            'Access denied. You do not have permission to access this resource.',
      );

    case ApiConstants.statusNotFound:
      return NotFoundFailure(errorMessage ?? 'Resource not found.');

    case ApiConstants.statusUnprocessableEntity:
      return ValidationFailure(
        errorMessage ?? 'Validation error. Please check your input.',
      );

    case ApiConstants.statusInternalServerError:
      return ServerFailure(
        errorMessage ?? 'Internal server error. Please try again later.',
      );

    // Handle other 5xx errors
    case int code when code >= 500:
      return ServerFailure(
        errorMessage ?? 'Server error ($code). Please try again later.',
      );

    // Handle other 4xx errors
    case int code when code >= 400 && code < 500:
      return BadRequestFailure(
        errorMessage ?? 'Client error ($code). Please check your request.',
      );

    // Fallback for other status codes
    default:
      return UnknownFailure(
        errorMessage ??
            'HTTP error (${statusCode ?? "unknown"}): ${error.message ?? "Unknown error"}',
      );
  }
}
