import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

/// State for the splash screen that handles initial auth check.
@freezed
sealed class SplashState with _$SplashState {
  /// Initial state while checking authentication.
  const factory SplashState.initial() = SplashInitial;

  /// User has valid saved token.
  const factory SplashState.authenticated() = SplashAuthenticated;

  /// No saved token found.
  const factory SplashState.unauthenticated() = SplashUnauthenticated;
}
