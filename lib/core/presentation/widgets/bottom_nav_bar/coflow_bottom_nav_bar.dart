import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/core/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';

/// The app's bottom navigation bar, built to the Figma "Nav Bar" component.
///
/// A [CoflowNavBarShape] panel split into [slotCount] equal columns, with the
/// home button floating over the dip in its middle. Each side column is one
/// square-cornered [TappableScale] running the full width and height of its
/// fifth of the panel, the system inset included, so the hit area is as large
/// as the bar allows; the panel clips the ink to its outline, and only the
/// icon and caption shrink on press. The centre column is inert — home is the
/// floating disc alone, which shrinks as a whole.
///
/// [destinations] lists the slots **in visual order**, with the home button
/// ([CoflowNavLogoDestination]) at [centreSlot], so a slot's position is also
/// its tab index.
class CoflowBottomNavBar extends StatelessWidget {
  const CoflowBottomNavBar({
    super.key,
    required this.destinations,
    required this.currentIndex,
    required this.onDestinationSelected,
  }) : assert(destinations.length == slotCount, 'The bar lays out exactly $slotCount slots.');

  final List<CoflowNavDestination> destinations;

  /// Index into [destinations] of the active tab.
  final int currentIndex;

  final ValueChanged<int> onDestinationSelected;

  static const int slotCount = 5;

  /// Position of the floating home button within [destinations].
  static const int centreSlot = slotCount ~/ 2;

  // Measurements from the Figma component at its native 360-wide scale.

  /// Panel height from the flat top edge, above the system inset.
  static const double _panelHeight = 66;

  static const double _homeButtonSize = 54;

  /// The home button's centre sits this far below the panel's flat edge.
  static const double _homeButtonDrop = 1;

  /// How far the home button rises above the panel's flat edge.
  static const double _overhang = _homeButtonSize / 2 - _homeButtonDrop;

  @override
  Widget build(BuildContext context) {
    assert(
      destinations[centreSlot] is CoflowNavLogoDestination,
      'Slot $centreSlot is the floating home button.',
    );

    final colors = context.colors;
    final systemInset = MediaQuery.viewPaddingOf(context).bottom;
    final home = destinations[centreSlot];

    return SizedBox(
      height: _overhang + _panelHeight + systemInset,
      child: Stack(
        // The home button's shadow spills past the top of the bar.
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: _overhang,
            child: Material(
              color: colors.backgroundWhite,
              shape: CoflowNavBarShape(side: BorderSide(color: colors.borderShadowSwitch)),
              // Clips every slot's ink to the outline, bowl included.
              clipBehavior: Clip.antiAlias,
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  for (var index = 0; index < slotCount; index++)
                    Expanded(
                      child: index == centreSlot
                          // Swallows taps under the disc so they don't reach
                          // the content behind the bar.
                          ? const ColoredBox(color: Colors.transparent)
                          : _Slot(
                              destination: destinations[index],
                              isSelected: index == currentIndex,
                              systemInset: systemInset,
                              onTap: () => onDestinationSelected(index),
                            ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: _HomeButton(
                label: home.label,
                isSelected: currentIndex == centreSlot,
                onTap: () => onDestinationSelected(centreSlot),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// One fifth of the panel: a full-bleed, square-cornered tap target with the
/// icon and caption laid out in its top [CoflowBottomNavBar._panelHeight].
class _Slot extends StatelessWidget {
  const _Slot({
    required this.destination,
    required this.isSelected,
    required this.systemInset,
    required this.onTap,
  });

  final CoflowNavDestination destination;
  final bool isSelected;
  final double systemInset;
  final VoidCallback onTap;

  static const double _iconSize = 24;

  /// Gap from the panel's flat edge to the top of the icon.
  static const double _iconTop = 16;

  static const double _labelGap = 4;

  static const double _pressedScale = 0.88;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = isSelected ? colors.signatureBlue : colors.textTertiary;

    final glyph = switch (destination) {
      CoflowNavIconDestination(:final icon) => Icon(icon, size: _iconSize, color: color),
      CoflowNavAvatarDestination(:final imageUrl, :final name, :final fallback) => _Avatar(
        imageUrl: imageUrl,
        name: name,
        fallback: fallback,
        isSelected: isSelected,
      ),
      // Never built: the centre column is the floating home button.
      CoflowNavLogoDestination() => const SizedBox.shrink(),
    };

    return Semantics(
      selected: isSelected,
      button: true,
      label: destination.label,
      excludeSemantics: true,
      child: TappableScale(
        onTap: onTap,
        scaleChildOnly: true,
        scaleEnd: _pressedScale,
        borderRadius: BorderRadius.zero,
        child: Padding(
          padding: EdgeInsets.only(top: _iconTop, bottom: systemInset),
          child: Align(alignment: .topCenter, child: _content(context, glyph, color)),
        ),
      ),
    );
  }

  Widget _content(BuildContext context, Widget glyph, Color color) {
    final typography = context.typography;
    return Column(
      mainAxisSize: .min,
      spacing: _labelGap,
      children: [
        glyph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.s4),
          child: Text(
            destination.label,
            maxLines: 1,
            overflow: .ellipsis,
            style: (isSelected ? typography.medium12 : typography.book12).withColor(color),
          ),
        ),
      ],
    );
  }
}

/// The user's photo in a thin ring, sized to sit in an icon's box.
class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.imageUrl,
    required this.name,
    required this.fallback,
    required this.isSelected,
  });

  final String? imageUrl;
  final String? name;
  final IconData fallback;
  final bool isSelected;

  static const double _photoSize = 22;
  static const double _ringWidth = 1;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final ringColor = isSelected ? colors.signatureBlue : colors.textPrimary;

    return Container(
      width: _Slot._iconSize,
      height: _Slot._iconSize,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(color: ringColor, width: _ringWidth),
        ),
      ),
      alignment: .center,
      child: ClipOval(
        child: ShimmerImage(
          imageUrl: imageUrl,
          width: _photoSize,
          height: _photoSize,
          borderRadius: _photoSize / 2,
          fallback: ImageFallback.person(name, icon: fallback),
        ),
      ),
    );
  }
}

/// The floating disc with the app mark. Filled navy while home is the active
/// tab, white otherwise.
class _HomeButton extends StatelessWidget {
  const _HomeButton({required this.label, required this.isSelected, required this.onTap});

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _logoSize = 32;

  static const double _pressedScale = 0.9;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // Ink that reads on the navy fill as well as on white.
    final ink = isSelected ? colors.backgroundWhite.withValues(alpha: 0.2) : null;

    return Semantics(
      selected: isSelected,
      button: true,
      label: label,
      excludeSemantics: true,
      // The whole disc, shadow included, shrinks on press.
      child: TappableScale(
        onTap: onTap,
        scaleEnd: _pressedScale,
        // Shadows are off in dark mode; the outline takes over there.
        shape: CircleBorder(side: BorderSide(color: colors.borderShadowSwitch)),
        shadows: context.shadows.lg,
        backgroundColor: isSelected ? colors.signatureBlue : colors.backgroundWhite,
        splashColor: ink,
        highlightColor: ink,
        child: const SizedBox.square(
          dimension: CoflowBottomNavBar._homeButtonSize,
          child: Center(child: Logo(size: _logoSize)),
        ),
      ),
    );
  }
}
