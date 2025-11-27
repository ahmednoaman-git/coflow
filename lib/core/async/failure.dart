abstract class Failure {
  final String message;

  const Failure(this.message);
}

/// Network-related failures (connection, timeout, no internet)
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Server-side failures (5xx errors)
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Client-side validation failures (400, 422)
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Bad request failure (malformed request, missing required fields)
class BadRequestFailure extends Failure {
  const BadRequestFailure(super.message);
}

/// Authentication failures (401 - unauthorized)
class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message);
}

/// Authorization failures (403 - forbidden)
class AuthorizationFailure extends Failure {
  const AuthorizationFailure(super.message);
}

/// Resource not found failure (404)
class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

/// Cache-related failures
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Unknown/unexpected failures
class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
