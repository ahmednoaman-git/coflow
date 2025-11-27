import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Creates a configured PrettyDioLogger based on the current build mode.
///
/// Returns a logger with:
/// - Debug mode: Full logging (request, response, headers, body, errors)
/// - Release mode: Minimal logging (errors only)
PrettyDioLogger createDioLogger() {
  return PrettyDioLogger(
    requestHeader: kDebugMode,
    requestBody: kDebugMode,
    responseBody: kDebugMode,
    responseHeader: kDebugMode,
    error: true, // Always log errors
    compact: !kDebugMode, // Compact format in release mode
    maxWidth: 90,
  );
}
