import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// `← January 1ˢᵗ →` — the stepper above a day strip.
///
/// Direction-agnostic: the caller decides whether a step moves by a month (the
/// facility Calendar tab) or by a week (the account Calendar). Arrows follow
/// the reading direction, so previous is on the right in RTL.
class CalendarStepNavigator extends StatelessWidget {
  const CalendarStepNavigator({
    super.key,
    required this.label,
    required this.onPrevious,
    required this.onNext,
    this.canGoBack = true,
    this.canGoForward = true,
  });

  final Widget label;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  /// False while the window starts today — there is no past to browse.
  final bool canGoBack;
  final bool canGoForward;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      spacing: context.spacing.s16,
      children: [
        _StepButton(
          icon: context.isRTL ? SolarIconsOutline.arrowRight : SolarIconsOutline.arrowLeft,
          onTap: canGoBack ? onPrevious : null,
        ),
        Flexible(child: label),
        _StepButton(
          icon: context.isRTL ? SolarIconsOutline.arrowLeft : SolarIconsOutline.arrowRight,
          onTap: canGoForward ? onNext : null,
        ),
      ],
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, required this.onTap});

  final IconData icon;

  /// Null renders the button disabled.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isEnabled = onTap != null;

    return TappableScale(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 48,
        height: 48,
        decoration: ShapeDecoration(
          color: context.colors.backgroundWhite,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isEnabled ? context.colors.strokeSecondary : context.colors.strokePrimary,
            ),
          ),
        ),
        child: Icon(
          icon,
          size: 20,
          color: isEnabled ? context.colors.textPrimary : context.colors.textDisabled,
        ),
      ),
    );
  }
}
