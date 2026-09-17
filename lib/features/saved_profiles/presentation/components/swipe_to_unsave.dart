import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// Wraps a profile card so swiping it away unsaves the facility.
///
/// The direction is end-to-start, which is a leftward swipe in English and a
/// rightward one in Arabic — the gesture mirrors with the layout rather than
/// staying pinned to one side of the screen.
///
/// The request runs from [onUnsave] *before* the card leaves, so a failure
/// springs the card back under the user's finger instead of dropping it and
/// putting it back a moment later. Only once the request sticks does
/// [onUnsaved] take the row out of the list.
class SwipeToUnsave extends StatelessWidget {
  const SwipeToUnsave({
    super.key,
    required this.dismissKey,
    required this.onUnsave,
    required this.onUnsaved,
    required this.child,
  });

  /// Identifies the row across rebuilds. Must be stable per profile, otherwise
  /// dismissing one card animates the wrong one out.
  final Key dismissKey;

  /// Runs the unsave; returns whether the card should go.
  final Future<bool> Function() onUnsave;

  /// Called after the dismiss animation, to drop the row from the list.
  final VoidCallback onUnsaved;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: dismissKey,
      direction: .endToStart,
      background: const _UnsaveBackground(),
      confirmDismiss: (_) => onUnsave(),
      onDismissed: (_) => onUnsaved(),
      child: child,
    );
  }
}

/// What shows under the card as it slides away.
class _UnsaveBackground extends StatelessWidget {
  const _UnsaveBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      padding: EdgeInsetsDirectional.only(end: context.spacing.s24),
      decoration: ShapeDecoration(
        color: context.colors.energyCherryPrimary,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s16),
        ),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: context.spacing.s8,
        children: [
          Icon(SolarIconsOutline.bookmark, color: context.colors.textWhite, size: 20),
          Text(
            context.l10n.savedProfiles_unsave,
            style: context.typography.medium14.inverse(context),
          ),
        ],
      ),
    );
  }
}
