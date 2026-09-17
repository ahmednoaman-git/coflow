import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../domain/enums/enums.dart';

/// Icon and launch behaviour for each contact channel, kept in one place so the
/// profile row and the value picker cannot disagree.
///
/// The brand glyphs in `assets/svgs/` are the official marks from Simple Icons
/// (CC0), so they are solid where the app's own `phone`/`mail`/`earth` icons are
/// stroked — which is how the design shows them too.
abstract final class ContactChannelVisuals {
  /// The SVG asset drawn inside the channel's circular button.
  ///
  /// A plain link uses `website` (a globe); note `Assets.svgs.earth` is the
  /// Earth *activity line* mark — three bars, not a globe — so it must not be
  /// used here.
  static String iconPath(FacilityContactChannel channel) => switch (channel) {
    FacilityContactChannel.contactNumber => Assets.svgs.phone.path,
    FacilityContactChannel.whatsapp => Assets.svgs.whatsapp.path,
    FacilityContactChannel.instagram => Assets.svgs.instagram.path,
    FacilityContactChannel.facebook => Assets.svgs.facebook.path,
    FacilityContactChannel.youtube => Assets.svgs.youtube.path,
    FacilityContactChannel.email => Assets.svgs.mail.path,
    FacilityContactChannel.website || FacilityContactChannel.other => Assets.svgs.website.path,
  };

  /// The channel's glyph, already tinted — callers must not wrap this in their
  /// own colour filter.
  static Widget icon(
    FacilityContactChannel channel, {
    required Color color,
    double size = 20,
  }) {
    return SvgPicture.asset(
      iconPath(channel),
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  /// Hands one of the channel's values to the platform.
  ///
  /// Phone-shaped channels dial or open WhatsApp; everything else is treated as
  /// a link, with an `@handle` on a social channel resolved to its profile URL.
  static Future<bool> launch(FacilityContactChannel channel, String value) {
    return switch (channel) {
      FacilityContactChannel.contactNumber => ExternalLauncher.call(value),
      FacilityContactChannel.whatsapp => ExternalLauncher.openWhatsApp(value),
      FacilityContactChannel.email => ExternalLauncher.sendEmail(value),
      FacilityContactChannel.instagram => ExternalLauncher.openUrl(
        _resolveHandle(value, 'https://instagram.com/'),
      ),
      FacilityContactChannel.facebook => ExternalLauncher.openUrl(
        _resolveHandle(value, 'https://facebook.com/'),
      ),
      FacilityContactChannel.youtube => ExternalLauncher.openUrl(
        _resolveHandle(value, 'https://youtube.com/'),
      ),
      FacilityContactChannel.website || FacilityContactChannel.other => ExternalLauncher.openUrl(
        value,
      ),
    };
  }

  /// Facilities often store `@thefacility` instead of a full profile URL.
  static String _resolveHandle(String value, String profileBase) {
    final trimmed = value.trim();
    if (trimmed.contains('/') || trimmed.contains('.')) return trimmed;
    return '$profileBase${trimmed.replaceFirst('@', '')}';
  }
}
