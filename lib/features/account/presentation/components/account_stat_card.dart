import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// One of the four headline counters on the Account screen.
///
/// [accent] and [accentContainer] come in as an identity pair from
/// `context.colors` (e.g. `energyCherryPrimary` / `energyCherrySecondary`), so
/// each card carries its own colour without hardcoding one.
class AccountStatCard extends StatelessWidget {
  const AccountStatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.count,
    required this.accent,
    required this.accentContainer,
    this.onTap,
  });

  final SvgGenImage icon;
  final String label;
  final int count;
  final Color accent;
  final Color accentContainer;
  final VoidCallback? onTap;

  /// 32x32 icon inside s16 padding on every side.
  static const double _iconSize = 32;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(context.spacing.s16);

    return TappableScale(
      onTap: onTap,
      borderRadius: radius,
      backgroundColor: context.colors.backgroundWhite,
      borderSide: BorderSide(color: context.colors.strokePrimary),
      child: ClipRSuperellipse(
        borderRadius: radius,
        child: Padding(
          padding: EdgeInsets.all(context.spacing.s16),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            spacing: context.spacing.s16,
            children: [
              Row(
                crossAxisAlignment: .center,
                children: [
                  _Badge(icon: icon, accent: accent, accentContainer: accentContainer),
                  const Spacer(),
                  Text('$count', style: context.typography.book36.withColor(accent)),
                ],
              ),
              Text(
                label,
                style: context.typography.bold18.primary(context),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The icon disc plus the two rings rippling out of it.
///
/// The stack is sized to the disc alone, so the rings spill outside it and are
/// trimmed by the card's own clip rather than pushing the layout around.
class _Badge extends StatelessWidget {
  const _Badge({required this.icon, required this.accent, required this.accentContainer});

  final SvgGenImage icon;
  final Color accent;
  final Color accentContainer;

  static const double _ringStroke = 1;

  @override
  Widget build(BuildContext context) {
    final discSize = AccountStatCard._iconSize + context.spacing.s16 * 2;

    return SizedBox.square(
      dimension: discSize,
      child: Stack(
        clipBehavior: .none,
        alignment: Alignment.center,
        children: [
          // Outermost first so the disc paints on top.
          _ring(context.spacing.s32, 0.5),
          _ring(context.spacing.s16, 1),
          Container(
            width: discSize,
            height: discSize,
            padding: EdgeInsets.all(context.spacing.s16),
            decoration: BoxDecoration(shape: .circle, color: accentContainer),
            child: icon.svg(
              width: AccountStatCard._iconSize,
              height: AccountStatCard._iconSize,
              colorFilter: accent.colorFilter,
            ),
          ),
        ],
      ),
    );
  }

  /// A ring sitting [inset] outside the disc on every side.
  ///
  /// Positioned rather than laid out, otherwise the stack's tight constraints
  /// would shrink it back down to the disc and hide it underneath.
  Widget _ring(double inset, double opacity) => Positioned(
    left: -inset,
    top: -inset,
    right: -inset,
    bottom: -inset,
    child: DecoratedBox(
      decoration: BoxDecoration(
        shape: .circle,
        border: Border.all(
          color: accentContainer.withValues(alpha: opacity),
          width: _ringStroke,
        ),
      ),
    ),
  );
}
