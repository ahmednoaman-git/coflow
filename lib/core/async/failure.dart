abstract class Failure {
  final String message;
  final Exception? exception;

  const Failure(this.message, {this.exception});
}

/// Network-related failures (connection, timeout, no internet)
class NetworkFailure extends Failure {
  const NetworkFailure(super.message, {super.exception});
}

/// Server-side failures (5xx errors)
class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.exception});
}

/// Client-side validation failures (400, 422)
class ValidationFailure extends Failure {
  const ValidationFailure(super.message, {super.exception});
}

/// Bad request failure (malformed request, missing required fields)
class BadRequestFailure extends Failure {
  const BadRequestFailure(super.message, {super.exception});
}

/// Authentication failures (401 - unauthorized)
class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message, {super.exception});
}

/// Authorization failures (403 - forbidden)
class AuthorizationFailure extends Failure {
  const AuthorizationFailure(super.message, {super.exception});
}

/// Resource not found failure (404)
class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message, {super.exception});
}

/// Cache-related failures
class CacheFailure extends Failure {
  const CacheFailure(super.message, {super.exception});
}

/// Unknown/unexpected failures
class UnknownFailure extends Failure {
  const UnknownFailure(super.message, {super.exception});
}
