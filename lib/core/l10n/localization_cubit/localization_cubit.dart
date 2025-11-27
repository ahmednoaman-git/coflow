import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../localization_manager.dart';

part 'localization_cubit.freezed.dart';
part 'localization_state.dart';

/// Cubit for managing app locale state
@singleton
class LocalizationCubit extends HydratedCubit<LocalizationState> {
  LocalizationCubit(this._manager) : super(LocalizationState(locale: _manager.getSavedLocale()));

  final LocalizationManager _manager;

  /// Change the app locale
  Future<void> setLocale(Locale locale) async {
    if (!LocalizationManager.isLocaleSupported(locale)) return;
    await _manager.setLocale(locale);
    emit(LocalizationState(locale: locale));
  }

  /// Reset to system locale
  Future<void> resetToSystemLocale() async {
    await _manager.clearLocale();
    emit(const LocalizationState(locale: null));
  }

  /// Switch between English and Arabic
  Future<void> toggleLanguage() async {
    final currentLocale = state.locale ?? LocalizationManager.defaultLocale;
    final newLocale = currentLocale.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    await setLocale(newLocale);
  }

  /// Get current text direction
  TextDirection get textDirection {
    final locale = state.locale ?? LocalizationManager.defaultLocale;
    return LocalizationManager.getTextDirection(locale);
  }

  /// Check if current locale is RTL
  bool get isRTL {
    final locale = state.locale ?? LocalizationManager.defaultLocale;
    return LocalizationManager.isRTL(locale);
  }

  @override
  LocalizationState? fromJson(Map<String, dynamic> json) {
    final code = json['locale'] as String?;
    if (code == null) return const LocalizationState(locale: null);
    final locale = LocalizationManager.getLocaleByCode(code);
    return LocalizationState(locale: locale);
  }

  @override
  Map<String, dynamic>? toJson(LocalizationState state) {
    return <String, dynamic>{
      'locale': state.locale?.languageCode,
    };
  }
}
