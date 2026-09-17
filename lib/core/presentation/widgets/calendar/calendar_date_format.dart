import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Locale-aware date/time formatting for day-strip timelines (the facility
/// Schedule/Calendar tabs and the account Calendar).
abstract final class CalendarDateFormat {
  /// `SUN` — day strip chip label.
  static String weekdayAbbreviation(BuildContext context, DateTime day) =>
      DateFormat('EEE', _locale(context)).format(day).toUpperCase();

  /// `1` — day strip chip number.
  static String dayNumber(BuildContext context, DateTime day) =>
      DateFormat('d', _locale(context)).format(day);

  /// `Sunday` — day summary prefix.
  static String weekdayName(BuildContext context, DateTime day) =>
      DateFormat('EEEE', _locale(context)).format(day);

  /// `January` — month/week navigator prefix.
  static String monthName(BuildContext context, DateTime day) =>
      DateFormat('MMMM', _locale(context)).format(day);

  /// `6:00 PM` — timeline gutter.
  static String time(BuildContext context, DateTime time) =>
      DateFormat.jm(_locale(context)).format(time);

  /// English ordinal suffix (`st`/`nd`/`rd`/`th`) for a day number, or an
  /// empty string in locales that do not use one.
  static String ordinalSuffix(BuildContext context, DateTime day) {
    if (!context.isEnglish) return '';

    final dayOfMonth = day.day;
    if (dayOfMonth >= 11 && dayOfMonth <= 13) return 'th';

    return switch (dayOfMonth % 10) {
      1 => 'st',
      2 => 'nd',
      3 => 'rd',
      _ => 'th',
    };
  }

  static String _locale(BuildContext context) => Localizations.localeOf(context).toString();
}

/// A label like `Sunday 1ˢᵗ` / `January 1ˢᵗ` — a prefix followed by the day
/// number with a superscript ordinal suffix.
class CalendarDateLabel extends StatelessWidget {
  const CalendarDateLabel({
    super.key,
    required this.prefix,
    required this.day,
    required this.style,
  });

  final String prefix;
  final DateTime day;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final suffix = CalendarDateFormat.ordinalSuffix(context, day);

    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(text: '$prefix ${CalendarDateFormat.dayNumber(context, day)}'),
          if (suffix.isNotEmpty)
            WidgetSpan(
              alignment: PlaceholderAlignment.top,
              child: Text(
                suffix,
                style: style.copyWith(fontSize: (style.fontSize ?? 16) * 0.6),
              ),
            ),
        ],
      ),
    );
  }
}
