import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Utility helpers for formatting dates throughout the app.
///
/// Uses `intl` and the current [Locale] from the given [BuildContext]
/// so formatted strings follow the user's locale preferences.
class AppDateUtils {
  AppDateUtils._();

  /// Format a [date] as `MMM d, yyyy` (e.g. "Nov 12, 2025") using
  /// the locale from [context]. Falls back to the system locale when
  /// none is available.
  static String formatDateFromContext(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).toString();
    // Use short month name, day and full year to match previous behaviour
    final formatter = DateFormat('MMM d, y', locale);
    return formatter.format(date);
  }

  /// Returns the number of full days from now until [date]. If [date]
  /// is in the past the returned value will be negative or zero.
  static int daysUntil(DateTime date) {
    return date.difference(DateTime.now()).inDays;
  }

  /// Convenience boolean for whether [date] is strictly in the future.
  static bool isFuture(DateTime date) => date.isAfter(DateTime.now());
}
