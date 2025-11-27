import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../gen/l10n/app_localizations.dart';

/// Manages app localization state and persistence
@lazySingleton
class LocalizationManager {
  LocalizationManager(this._prefs);

  final SharedPreferences _prefs;
  static const String _localeKey = 'app_locale';

  /// Supported locales for the app
  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('ar'), // Arabic
  ];

  /// Get the saved locale from storage
  Locale? getSavedLocale() {
    final languageCode = _prefs.getString(_localeKey);
    if (languageCode == null) return null;
    return Locale(languageCode);
  }

  /// Save the selected locale to storage
  Future<void> setLocale(Locale locale) async {
    await _prefs.setString(_localeKey, locale.languageCode);
  }

  /// Clear the saved locale (falls back to system locale)
  Future<void> clearLocale() async {
    await _prefs.remove(_localeKey);
  }

  /// Check if a locale is supported
  static bool isLocaleSupported(Locale locale) {
    return supportedLocales.any(
      (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
    );
  }

  /// Get the default locale (English)
  static Locale get defaultLocale => supportedLocales.first;

  /// Get locale by language code
  static Locale? getLocaleByCode(String code) {
    try {
      return supportedLocales.firstWhere(
        (locale) => locale.languageCode == code,
      );
    } catch (_) {
      return null;
    }
  }

  /// Check if the locale is RTL
  static bool isRTL(Locale locale) {
    return locale.languageCode == 'ar';
  }

  /// Get text direction for locale
  static TextDirection getTextDirection(Locale locale) {
    return isRTL(locale) ? TextDirection.rtl : TextDirection.ltr;
  }

  /// Get all supported locale delegates
  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates {
    return AppLocalizations.localizationsDelegates;
  }
}
