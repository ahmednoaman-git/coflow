import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/auth/auth_state_manager.dart';
import 'splash_state.dart';

/// Cubit responsible for checking authentication state on app startup.
@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._authStateManager) : super(const SplashState.initial()) {
    _checkAuthStatus();
  }

  final AuthStateManager _authStateManager;

  /// Checks if user has a valid saved token and emits the appropriate state.
  Future<void> _checkAuthStatus() async {
    // Small delay for splash branding visibility
    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (_authStateManager.isAuthenticated) {
      emit(const SplashState.authenticated());
    } else {
      emit(const SplashState.unauthenticated());
    }
  }
}
