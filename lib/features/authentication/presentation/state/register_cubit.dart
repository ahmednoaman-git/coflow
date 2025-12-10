import 'dart:io';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sealed_countries/sealed_countries.dart';

import '../../domain/domain.dart';

part 'register_cubit.freezed.dart';

/// State for the multi-step registration screen.
@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    // Current page index (0-based)
    @Default(0) int pageIndex,
    // Step 1: Basic info
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isPasswordVisible,
    // Step 2: Profile details
    DateTime? birthdate,
    @Default(Gender.male) Gender gender,
    WorldCountry? selectedCountry,
    @Default('') String phone,
    File? image,
    // Step 3: OTP verification
    @Default('') String otpCode,
    // Async request states
    @Default(AsyncState.idle()) AsyncState<void> sendOtpRequest,
    @Default(AsyncState.idle()) AsyncState<void> verifyOtpRequest,
    @Default(AsyncState.idle()) AsyncState<UserEntity> registerRequest,
  }) = _RegisterState;

  const RegisterState._();

  /// Whether step 1 is valid (name, email, password filled).
  bool get isStep1Valid =>
      name.trim().length >= 3 && _isValidEmail(email) && password.length >= 6;

  /// Whether step 2 is valid (all profile details filled).
  bool get isStep2Valid =>
      birthdate != null && selectedCountry != null && phone.length >= 10;

  /// Whether step 3 is valid (OTP filled).
  bool get isStep3Valid => otpCode.length >= 4;

  /// Whether the current step is valid.
  bool get isCurrentStepValid => switch (pageIndex) {
    0 => isStep1Valid,
    1 => isStep2Valid,
    2 => isStep3Valid,
    _ => false,
  };

  /// Total number of registration steps.
  static const int totalSteps = 3;

  static bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email.trim());
  }
}

/// Cubit managing multi-step registration form state.
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this._registerUseCase,
    this._sendOtpUseCase,
    this._verifyOtpUseCase,
  ) : super(const RegisterState());

  final RegisterUseCase _registerUseCase;
  final SendOtpUseCase _sendOtpUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;

  /// Manager for send OTP request.
  late final sendOtpManager = AsyncRequestManager<RegisterState, void>(
    accessor: (
      getPartialState: (state) => state.sendOtpRequest,
      getWholeState: () => state,
      setWholeState: (state, partial) =>
          state.copyWith(sendOtpRequest: partial),
    ),
    emit: emit,
  );

  /// Manager for verify OTP request.
  late final verifyOtpManager = AsyncRequestManager<RegisterState, void>(
    accessor: (
      getPartialState: (state) => state.verifyOtpRequest,
      getWholeState: () => state,
      setWholeState: (state, partial) =>
          state.copyWith(verifyOtpRequest: partial),
    ),
    emit: emit,
  );

  /// Manager for registration request.
  late final registerManager = AsyncRequestManager<RegisterState, UserEntity>(
    accessor: (
      getPartialState: (state) => state.registerRequest,
      getWholeState: () => state,
      setWholeState: (state, partial) =>
          state.copyWith(registerRequest: partial),
    ),
    emit: emit,
  );

  // ─────────────────────────────────────────────────────────────────────────
  // Navigation
  // ─────────────────────────────────────────────────────────────────────────

  /// Moves to the next page.
  void nextPage() {
    if (state.pageIndex < RegisterState.totalSteps - 1 &&
        state.isCurrentStepValid) {
      emit(state.copyWith(pageIndex: state.pageIndex + 1));
    }
  }

  /// Moves to the previous page.
  void previousPage() {
    if (state.pageIndex > 0) {
      emit(state.copyWith(pageIndex: state.pageIndex - 1));
    }
  }

  /// Sets the current page index directly.
  void setPage(int index) {
    if (index >= 0 && index < RegisterState.totalSteps) {
      emit(state.copyWith(pageIndex: index));
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Step 1: Basic info
  // ─────────────────────────────────────────────────────────────────────────

  void nameChanged(String value) {
    emit(state.copyWith(name: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Step 2: Profile details
  // ─────────────────────────────────────────────────────────────────────────

  void birthdateChanged(DateTime value) {
    emit(state.copyWith(birthdate: value));
  }

  void genderChanged(Gender value) {
    emit(state.copyWith(gender: value));
  }

  void countryChanged(WorldCountry value) {
    emit(state.copyWith(selectedCountry: value));
  }

  void phoneChanged(String value) {
    emit(state.copyWith(phone: value));
  }

  void imageChanged(File? value) {
    emit(state.copyWith(image: value));
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Step 3: OTP verification
  // ─────────────────────────────────────────────────────────────────────────

  void otpCodeChanged(String value) {
    emit(state.copyWith(otpCode: value));
  }

  /// Sends OTP to the user's email.
  void sendOtp() {
    if (state.email.isEmpty) return;
    sendOtpManager.execute(_sendOtpUseCase(state.email.trim()));
  }

  /// Resends OTP to the user's email.
  void resendOtp() {
    sendOtp();
  }

  /// Verifies the OTP code.
  void verifyOtp() {
    if (!state.isStep3Valid) return;
    final dto = VerifyOtpDto(email: state.email.trim(), otp: state.otpCode);
    verifyOtpManager.execute(_verifyOtpUseCase(dto));
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Submit registration
  // ─────────────────────────────────────────────────────────────────────────

  /// Submits the registration form.
  void submit() {
    if (!state.isStep1Valid || !state.isStep2Valid) return;

    final dto = RegisterDto(
      name: state.name.trim(),
      email: state.email.trim(),
      password: state.password,
      birthdate: state.birthdate!,
      gender: state.gender,
      nationality: state.selectedCountry!.code,
      phone: state.phone.trim(),
      otpCode: state.otpCode,
      image: state.image,
    );
    registerManager.execute(_registerUseCase(dto));
  }
}
