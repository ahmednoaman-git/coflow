import 'package:flutter/material.dart';

import '../gen/l10n/app_localizations.dart';

/// Extension to easily access localization strings from BuildContext
extension LocalizationExtension on BuildContext {
  /// Get app localizations instance
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  /// Check if current locale is RTL
  bool get isRTL => Directionality.of(this) == TextDirection.rtl;

  /// Get current locale
  Locale get locale => Localizations.localeOf(this);

  /// Check if current locale is Arabic
  bool get isArabic => locale.languageCode == 'ar';

  /// Check if current locale is English
  bool get isEnglish => locale.languageCode == 'en';
}
