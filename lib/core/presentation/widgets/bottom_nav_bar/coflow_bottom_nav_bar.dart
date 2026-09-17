import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/core/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';

/// The app's bottom navigation bar.
///
/// Two pieces stacked, both explicitly sized:
/// - a square-edged panel of [barHeight] (plus the system inset) holding four
///   destinations, each given exactly a quarter of the width
/// - a perfectly circular CTA of [ctaSize] centred over it, floating clear of
///   the panel with [ctaClearance] of bar surface visible around it
///
/// The panel's U-shaped dip is derived from those two numbers: the notch is an
/// arc concentric with the CTA of radius `ctaSize / 2 + ctaClearance`, so the
/// clearance ring is even the whole way round. [ctaRise] decides how much of
/// the CTA floats above the bar versus settling into the dip.
///
/// [destinations] holds all [slotCount] slots **in visual order, left to
/// right**, with the CTA as the [centreSlot] entry — so a slot's position in
/// the list is also its tab index, and [currentIndex] needs no translating.
class CoflowBottomNavBar extends StatelessWidget {
  const CoflowBottomNavBar({
    super.key,
    required this.destinations,
    required this.currentIndex,
    required this.onDestinationSelected,
  }) : assert(
         destinations.length == slotCount,
         'The bar lays out exactly $slotCount slots: two destinations per side '
         'around the centre CTA.',
       );

  final List<CoflowNavDestination> destinations;

  /// Index into [destinations] of the active tab.
  final int currentIndex;

  final ValueChanged<int> onDestinationSelected;

  /// Slots the bar lays out, the centre CTA included.
  static const int slotCount = 5;

  /// Position of the floating CTA within [destinations].
  static const int centreSlot = slotCount ~/ 2;

  /// Height of the panel holding the destinations, above the system inset.
  static const double barHeight = 72;

  /// Diameter of the white disc the logo sits on.
  static const double ctaSize = 62;

  /// Ring of bar surface left visible around the CTA inside the notch.
  static const double ctaClearance = 10;

  /// How far the CTA's centre sits above the flat part of the bar's top edge.
  ///
  /// The lower this sits the deeper the notch cuts, since the notch is the part
  /// of the CTA's circle that falls below the flat edge.
  static const double ctaRise = 8;

  /// Box given to the logo mark. The artwork runs to the edge of its own box,
  /// so this is inset from the disc to leave the mark a white margin.
  static const double _logoSize = 42;

  static const double _notchRadius = ctaSize / 2 + ctaClearance;

  /// Wide enough that the notch releases back to the flat edge over a long
  /// shallow shoulder rather than kinking away from the disc.
  static const double _filletRadius = 20;

  /// Headroom the overhanging CTA needs above the panel.
  static const double _ctaOverhang = ctaSize / 2 + ctaRise;

  /// Dead space held open at the centre of the row so the notch and its fillets
  /// have somewhere to cut without crowding the two inner destinations. Sized
  /// past the notch's own span, which is ~53 for the constants above.
  static const double _centreGap = 64;

  @override
  Widget build(BuildContext context) {
    // Not a constructor assert: indexing a list is not a constant expression,
    // and the constructor stays const.
    assert(
      destinations[centreSlot] is CoflowNavLogoDestination,
      'Slot $centreSlot is the floating CTA, so it has to be a '
      'CoflowNavLogoDestination.',
    );

    final systemInset = MediaQuery.viewPaddingOf(context).bottom;

    return SizedBox(
      height: _ctaOverhang + barHeight + systemInset,
      // The CTA and its shadow spill past the top of the panel.
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: _ctaOverhang,
            left: 0,
            right: 0,
            bottom: 0,
            child: _Panel(bottomInset: systemInset, children: _items()),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: _CtaButton(
                label: destinations[centreSlot].label,
                isSelected: currentIndex == centreSlot,
                onTap: () => onDestinationSelected(centreSlot),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Two destinations, the gap the CTA floats over, then two more. Each
  /// destination takes an equal share of whatever the gap leaves.
  List<Widget> _items() => [
    for (var index = 0; index < slotCount; index++)
      if (index == centreSlot)
        const SizedBox(width: _centreGap)
      else
        Expanded(
          child: _NavItem(
            destination: destinations[index],
            isSelected: index == currentIndex,
            onTap: () => onDestinationSelected(index),
          ),
        ),
  ];
}

/// The panel itself: notched silhouette, four equal slots, safe-area padded.
class _Panel extends StatelessWidget {
  const _Panel({required this.bottomInset, required this.children});

  final double bottomInset;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final shape = NotchedBarShape(
      notchRadius: CoflowBottomNavBar._notchRadius,
      notchRise: CoflowBottomNavBar.ctaRise,
      filletRadius: CoflowBottomNavBar._filletRadius,
      side: BorderSide(color: context.colors.strokePrimary),
    );

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: shape,
        // The bar casts upward onto the content it overlaps, so the token's
        // downward offset is mirrored.
        //
        // A shape decoration draws a shadow by stamping the whole silhouette,
        // offset and blurred — so a token whose offset outruns its blur prints
        // a second, visibly notched bar above this one. `md` keeps the offset
        // well inside the blur, which reads as a soft edge instead.
        shadows: [
          for (final shadow in context.shadows.md)
            BoxShadow(
              color: shadow.color,
              offset: Offset(shadow.offset.dx, -shadow.offset.dy),
              blurRadius: shadow.blurRadius,
              spreadRadius: shadow.spreadRadius,
            ),
        ],
      ),
      // Destination press feedback runs to the edge of its slot, so it is held
      // inside the silhouette rather than spilling across the notch.
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: shape),
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Row(children: children),
        ),
      ),
    );
  }
}

/// The centre disc. Perfectly circular and carrying its own shadow, so it reads
/// as a button resting over the bar rather than as part of it.
///
/// Selected, the disc fills with the signature navy — the same read as a side
/// destination swapping tertiary grey for navy, scaled up to the CTA.
class _CtaButton extends StatelessWidget {
  const _CtaButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const size = CoflowBottomNavBar.ctaSize;
    final colors = context.colors;

    return Semantics(
      label: label,
      button: true,
      selected: isSelected,
      child: TappableScale(
        onTap: onTap,
        scaleEnd: 0.9,
        borderRadius: BorderRadius.circular(size / 2),
        child: Container(
          width: size,
          height: size,
          decoration: ShapeDecoration(
            color: isSelected ? colors.signatureBlue : colors.backgroundWhite,
            // Shadows go transparent in dark mode; the outline takes over there.
            shape: CircleBorder(side: BorderSide(color: colors.borderShadowSwitch)),
            shadows: context.shadows.md,
          ),
          // The mark keeps its own gradients either way — they carry enough
          // contrast against the navy fill.
          child: const Center(child: Logo(size: CoflowBottomNavBar._logoSize)),
        ),
      ),
    );
  }
}

/// One destination: icon (or avatar) over its label, centred in its quarter.
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.isSelected,
    required this.onTap,
  });

  final CoflowNavDestination destination;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _iconSize = 26;
  static const double _avatarSize = 28;
  static const double _labelGap = 6;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? context.colors.signatureBlue : context.colors.textTertiary;

    return TappableScale(
      onTap: onTap,
      scaleEnd: 0.92,
      borderRadius: BorderRadius.circular(context.spacing.s12),
      // A slot runs the full height of the bar and butts against the notch, so
      // an ink rectangle over it reads as a block sitting on top of the
      // silhouette however tightly it is clipped. The press feedback here is
      // the scale alone.
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        height: CoflowBottomNavBar.barHeight,
        child: Column(
          mainAxisAlignment: .center,
          spacing: _labelGap,
          children: [
            switch (destination) {
              CoflowNavIconDestination(:final icon) => Icon(icon, size: _iconSize, color: color),
              CoflowNavAvatarDestination(:final imageUrl, :final fallback) => _Avatar(
                imageUrl: imageUrl,
                fallback: fallback,
                ringColor: color,
              ),
              // The centre slot is lifted out into the floating CTA before it
              // ever reaches a panel slot.
              CoflowNavLogoDestination() => const SizedBox.shrink(),
            },
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing.s4),
              child: Text(
                destination.label,
                maxLines: 1,
                overflow: .ellipsis,
                style: isSelected
                    ? context.typography.medium13.withColor(color)
                    : context.typography.book13.withColor(color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.imageUrl,
    required this.fallback,
    required this.ringColor,
  });

  final String? imageUrl;
  final IconData fallback;
  final Color ringColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _NavItem._avatarSize,
      height: _NavItem._avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ringColor, width: 1.5),
      ),
      child: ClipOval(
        child: ShimmerImage(
          imageUrl: imageUrl,
          width: _NavItem._avatarSize,
          height: _NavItem._avatarSize,
          errorWidget: Icon(fallback, size: 18, color: ringColor),
        ),
      ),
    );
  }
}
