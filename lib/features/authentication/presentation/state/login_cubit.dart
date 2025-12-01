import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

part 'login_cubit.freezed.dart';

/// State for the login screen.
@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    // Form fields
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isPasswordVisible,
    // Async request state
    @Default(AsyncState.idle()) AsyncState<UserEntity> loginRequest,
  }) = _LoginState;

  const LoginState._();

  /// Whether the form is valid (all fields are filled).
  bool get isFormValid => email.trim().isNotEmpty && password.trim().isNotEmpty;
}

/// Cubit managing login form state and authentication.
@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState());

  final LoginUseCase _loginUseCase;

  /// Manager for the login request.
  late final loginManager = AsyncRequestManager<LoginState, UserEntity>(
    accessor: (
      getPartialState: (state) => state.loginRequest,
      getWholeState: () => state,
      setWholeState: (state, partial) => state.copyWith(loginRequest: partial),
    ),
    emit: emit,
  );

  /// Updates the email field.
  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  /// Updates the password field.
  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  /// Toggles password visibility.
  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  /// Submits the login form.
  void submit() {
    if (!state.isFormValid) return;

    final dto = LoginDto(email: state.email.trim(), password: state.password);
    loginManager.execute(_loginUseCase(dto));
  }
}
