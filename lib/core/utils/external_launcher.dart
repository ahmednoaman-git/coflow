import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens links the app hands off to the platform — maps, dialer, social apps.
///
/// Every entry point returns whether the hand-off succeeded so callers can show
/// a message instead of silently doing nothing; nothing here throws.
abstract final class ExternalLauncher {
  /// Opens a web link, adding `https://` when the facility saved a bare host.
  static Future<bool> openUrl(String url) {
    final normalized = normalizeUrl(url);
    if (normalized == null) return Future.value(false);
    return _launch(normalized, LaunchMode.externalApplication);
  }

  /// Opens the dialer pre-filled with [number].
  static Future<bool> call(String number) {
    final digits = normalizePhone(number);
    if (digits == null) return Future.value(false);
    return _launch(Uri(scheme: 'tel', path: digits), LaunchMode.externalApplication);
  }

  /// Opens a WhatsApp chat. `wa.me` resolves to the app when installed and to
  /// the web client otherwise, so it needs no separate fallback.
  static Future<bool> openWhatsApp(String number) {
    final digits = normalizePhone(number)?.replaceAll('+', '');
    if (digits == null || digits.isEmpty) return Future.value(false);
    return _launch(Uri.parse('https://wa.me/$digits'), LaunchMode.externalApplication);
  }

  /// Opens a mail composer addressed to [address].
  static Future<bool> sendEmail(String address) {
    final trimmed = address.trim();
    if (trimmed.isEmpty) return Future.value(false);
    return _launch(Uri(scheme: 'mailto', path: trimmed), LaunchMode.externalApplication);
  }

  /// Parses a link into something launchable, or null when it is unusable.
  ///
  /// Facilities save these by hand, so bare hosts (`instagram.com/x`) and
  /// stray whitespace are both common.
  static Uri? normalizeUrl(String url) {
    final trimmed = url.trim();
    if (trimmed.isEmpty) return null;

    final withScheme = trimmed.contains('://') ? trimmed : 'https://$trimmed';
    final uri = Uri.tryParse(withScheme);
    if (uri == null || uri.host.isEmpty) return null;
    return uri;
  }

  /// Strips formatting from a phone number, keeping a leading `+`.
  static String? normalizePhone(String number) {
    final trimmed = number.trim();
    if (trimmed.isEmpty) return null;

    final hasPlus = trimmed.startsWith('+');
    final digits = trimmed.replaceAll(RegExp('[^0-9]'), '');
    if (digits.isEmpty) return null;
    return hasPlus ? '+$digits' : digits;
  }

  static Future<bool> _launch(Uri uri, LaunchMode mode) async {
    try {
      return await launchUrl(uri, mode: mode);
    } on Object catch (error) {
      debugPrint('ExternalLauncher failed to open $uri: $error');
      return false;
    }
  }
}
