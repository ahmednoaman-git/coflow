import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// The round track-updates toggle on a profile card.
///
/// On: solid [accent] disc with a white glyph. Off: the pale [accentContainer]
/// disc with the glyph in [accent] — so the card reads at a glance without
/// needing a label.
class SavedProfileTrackButton extends StatelessWidget {
  const SavedProfileTrackButton({
    super.key,
    required this.isTracked,
    required this.accent,
    required this.accentContainer,
    required this.onTap,
    required this.semanticLabel,
  });

  final bool isTracked;
  final Color accent;
  final Color accentContainer;
  final VoidCallback onTap;

  /// Announced by screen readers in place of the glyph, which carries the whole
  /// meaning of the control.
  final String semanticLabel;

  static const double _size = 40;
  static const double _iconSize = 20;
  static const Duration _duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final foreground = isTracked ? context.colors.textWhite : accent;

    return Semantics(
      button: true,
      toggled: isTracked,
      label: semanticLabel,
      child: SizedBox.square(
        dimension: _size,
        child: TappableScale(
          onTap: onTap,
          scaleEnd: 0.9,
          animationDuration: const Duration(milliseconds: 150),
          borderRadius: BorderRadius.circular(_size / 2),
          child: AnimatedContainer(
            duration: _duration,
            curve: Curves.easeInOut,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: isTracked ? accent : accentContainer,
            ),
            child: Center(
              child: Assets.svgs.trackUpdates.svg(
                width: _iconSize,
                height: _iconSize,
                colorFilter: foreground.colorFilter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
