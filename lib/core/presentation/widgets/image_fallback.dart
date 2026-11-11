import 'dart:math' as math;

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// What a [ShimmerImage] shows in place of an image that is missing or failed
/// to load, so the gap reads as designed rather than broken.
///
/// Every variant fills the image's box exactly, so nothing moves between
/// loading, loaded and failed. [accent] tints it — pass the activity line's
/// colour when it is known; without one it falls back to the brand navy.
sealed class ImageFallback {
  const ImageFallback({this.accent});

  /// Covers, banners, branch photos and thumbnails: the brand navy with a
  /// soft glow of [accent] and a faint Coflow mark. Dark enough that white
  /// captions drawn over a cover stay legible.
  const factory ImageFallback.cover({Color? accent}) = CoverImageFallback;

  /// A person's photo: up to two initials of [name] on a tinted surface, or a
  /// person glyph ([icon] when given) when the name has no letters.
  const factory ImageFallback.person(String? name, {Color? accent, IconData? icon}) =
      PersonImageFallback;

  /// A business logo: the first initial of [name] on a tinted surface, or the
  /// Coflow mark when the name has no letters.
  const factory ImageFallback.business(String? name, {Color? accent}) = BusinessImageFallback;

  /// A small glyph on a tinted surface, for icon-like images (amenities).
  const factory ImageFallback.icon(IconData icon, {Color? accent}) = IconImageFallback;

  final Color? accent;

  /// Initials of [name] for a monogram: the first letter or digit of the
  /// first word and, when [max] allows, of the last — `'Ahmed Osama Noaman'`
  /// gives `'AN'`. Words without a letter or digit are skipped. Returns an
  /// empty string when nothing qualifies.
  ///
  /// Arabic initials are kept apart with a zero-width non-joiner so they
  /// read as separate letters instead of joining into a word.
  static String initialsOf(String? name, {int max = 2}) {
    assert(max > 0);
    if (name == null) return '';

    final initials = <String>[];
    for (final word in name.trim().split(RegExp(r'\s+'))) {
      final initial = word.characters.firstWhere(_isLetterOrDigit.hasMatch, orElse: () => '');
      if (initial.isNotEmpty) initials.add(initial.toUpperCase());
    }
    if (initials.isEmpty) return '';

    final picked = max == 1 || initials.length == 1
        ? [initials.first]
        : [initials.first, initials.last];
    return picked.join(picked.every(_isArabic.hasMatch) ? '‌' : '');
  }

  static final _isLetterOrDigit = RegExp(r'[\p{L}\p{N}]', unicode: true);
  static final _isArabic = RegExp(r'\p{Script=Arabic}', unicode: true);
}

final class CoverImageFallback extends ImageFallback {
  const CoverImageFallback({super.accent});
}

final class PersonImageFallback extends ImageFallback {
  const PersonImageFallback(this.name, {super.accent, this.icon});

  final String? name;
  final IconData? icon;
}

final class BusinessImageFallback extends ImageFallback {
  const BusinessImageFallback(this.name, {super.accent});

  final String? name;
}

final class IconImageFallback extends ImageFallback {
  const IconImageFallback(this.icon, {super.accent});

  final IconData icon;
}

/// Paints an [ImageFallback], filling the box it is given.
///
/// [ShimmerImage] builds this for you; use it directly only where an image
/// slot is drawn without a [ShimmerImage].
class ImageFallbackView extends StatelessWidget {
  const ImageFallbackView({super.key, required this.fallback, this.width, this.height});

  final ImageFallback fallback;
  final double? width;
  final double? height;

  /// Below this shortest side a monogram drops to a single initial, and a
  /// cover centres its mark instead of letting it bleed off the corner.
  static const double compactSide = 32;
  static const double _coverCompactSide = 96;

  /// Used when the box is unbounded on both axes.
  static const double _fallbackSide = 48;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final side = _shortestSide(constraints);
          return switch (fallback) {
            CoverImageFallback(:final accent) => _Cover(accent: accent, side: side),
            PersonImageFallback(:final name, :final accent, :final icon) => _Monogram(
              initials: ImageFallback.initialsOf(name, max: side < compactSide ? 1 : 2),
              accent: accent,
              side: side,
              empty: Icon(
                icon ?? SolarIconsOutline.user,
                size: side * 0.5,
                color: _MonogramColors.of(context, accent).foreground,
              ),
            ),
            BusinessImageFallback(:final name, :final accent) => _Monogram(
              initials: ImageFallback.initialsOf(name, max: 1),
              accent: accent,
              side: side,
              empty: Opacity(
                opacity: 0.8,
                child: Assets.svgs.logo.svg(width: side * 0.5, height: side * 0.5),
              ),
            ),
            IconImageFallback(:final icon, :final accent) => _Monogram(
              initials: '',
              accent: accent,
              side: side,
              empty: Icon(
                icon,
                size: side * 0.55,
                color: _MonogramColors.of(context, accent).foreground,
              ),
            ),
          };
        },
      ),
    );
  }

  static double _shortestSide(BoxConstraints constraints) {
    final sides = [constraints.maxWidth, constraints.maxHeight].where((side) => side.isFinite);
    return sides.isEmpty ? _fallbackSide : sides.reduce(math.min);
  }
}

/// The two shades a monogram is drawn in: a soft tint of the accent and a
/// deep (light, in dark mode) shade of it that reads on the tint.
class _MonogramColors {
  const _MonogramColors(this.surface, this.foreground);

  factory _MonogramColors.of(BuildContext context, Color? accent) {
    final colors = context.colors;
    final base = HSLColor.fromColor(accent ?? colors.signatureBlue);
    final saturation = math.min(base.saturation, 0.55);
    final isDark = context.isDarkMode;

    return _MonogramColors(
      base.withSaturation(saturation).withLightness(isDark ? 0.24 : 0.91).toColor(),
      base.withSaturation(saturation).withLightness(isDark ? 0.82 : 0.32).toColor(),
    );
  }

  final Color surface;
  final Color foreground;
}

class _Monogram extends StatelessWidget {
  const _Monogram({
    required this.initials,
    required this.accent,
    required this.side,
    required this.empty,
  });

  final String initials;
  final Color? accent;
  final double side;

  /// Shown when there are no initials to draw.
  final Widget empty;

  @override
  Widget build(BuildContext context) {
    final colors = _MonogramColors.of(context, accent);
    // Two letters need a little more room than one.
    final fontSize = side * (initials.characters.length > 1 ? 0.36 : 0.42);

    return ColoredBox(
      color: colors.surface,
      child: Center(
        child: initials.isEmpty
            ? empty
            : Text(
                initials,
                maxLines: 1,
                softWrap: false,
                textScaler: TextScaler.noScaling,
                style: context.typography.bold16
                    .withColor(colors.foreground)
                    .copyWith(fontSize: fontSize, height: 1),
              ),
      ),
    );
  }
}

class _Cover extends StatelessWidget {
  const _Cover({required this.accent, required this.side});

  final Color? accent;
  final double side;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // The navy of the brand pair, whichever slot the theme put it in.
    final navy = context.isDarkMode ? colors.signatureBlueSecondary : colors.signatureBlue;
    final glow = accent ?? colors.skyBluePrimary;
    final isCompact = side < ImageFallbackView._coverCompactSide;
    final markSize = isCompact ? side * 0.5 : side * 1.1;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: navy,
        gradient: RadialGradient(
          center: AlignmentDirectional.topEnd.resolve(Directionality.of(context)),
          radius: 1.2,
          colors: [
            Color.alphaBlend(glow.withValues(alpha: 0.45), navy),
            Color.alphaBlend(glow.withValues(alpha: 0.12), navy),
            navy,
          ],
          stops: const [0, 0.55, 1],
        ),
      ),
      child: isCompact
          ? Center(child: _Mark(size: markSize, opacity: 0.35))
          : Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                PositionedDirectional(
                  start: -markSize * 0.35,
                  bottom: -markSize * 0.3,
                  child: _Mark(size: markSize, opacity: 0.12),
                ),
              ],
            ),
    );
  }
}

class _Mark extends StatelessWidget {
  const _Mark({required this.size, required this.opacity});

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Assets.svgs.logo.svg(width: size, height: size),
    );
  }
}
