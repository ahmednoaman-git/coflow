import 'dart:math' as math;

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// Wraps a profile card so swiping it away unsaves the facility.
///
/// The direction is end-to-start, which is a leftward swipe in English and a
/// rightward one in Arabic — the gesture mirrors with the layout rather than
/// staying pinned to one side of the screen.
///
/// [onUnsave] says whether the card may go; once it has, [onUnsaved] takes the
/// row out of the list and unsaves it, putting it back if the server refuses.
///
/// What shows under the card follows the drag ([_UnsaveBackground]): red that
/// grows from the card's trailing edge, and the "Unsave" label easing in, then
/// drifting to the middle of the red as it widens.
class SwipeToUnsave extends StatefulWidget {
  const SwipeToUnsave({
    super.key,
    required this.dismissKey,
    required this.onUnsave,
    required this.onUnsaved,
    this.radius,
    required this.child,
  });

  /// Identifies the row across rebuilds. Must be stable per profile, otherwise
  /// dismissing one card animates the wrong one out.
  final Key dismissKey;

  /// Says whether the card should go.
  final Future<bool> Function() onUnsave;

  /// Called after the dismiss animation, to drop the row from the list.
  final VoidCallback onUnsaved;

  /// The card's corner radius, which the red takes on. Defaults to the
  /// profile card's.
  final double? radius;

  final Widget child;

  @override
  State<SwipeToUnsave> createState() => _SwipeToUnsaveState();
}

class _SwipeToUnsaveState extends State<SwipeToUnsave> {
  /// How far the card has slid, as a fraction of its width.
  final _progress = ValueNotifier<double>(0);

  @override
  void didUpdateWidget(SwipeToUnsave oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Another card in this slot starts from rest.
    if (oldWidget.dismissKey != widget.dismissKey) _progress.value = 0;
  }

  @override
  void dispose() {
    _progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The red is drawn behind the Dismissible rather than given to it as its
    // background: Dismissible clips a background to the area the card has
    // uncovered, which would cut away the red reaching under the card's
    // rounded corners and leave page showing beside them.
    return Stack(
      children: [
        Positioned.fill(
          child: _UnsaveBackground(
            progress: _progress,
            radius: widget.radius ?? context.spacing.s16,
          ),
        ),
        Dismissible(
          key: widget.dismissKey,
          direction: .endToStart,
          onUpdate: (details) => _progress.value = details.progress,
          confirmDismiss: (_) => widget.onUnsave(),
          onDismissed: (_) => widget.onUnsaved(),
          child: widget.child,
        ),
      ],
    );
  }
}

/// What shows under the card as it slides away.
///
/// The red isn't a card-sized panel sitting under the card — two identical
/// rounded shapes stacked exactly show a red fringe round the card at rest,
/// and their corners part as the card moves, leaving gaps of page between
/// them. It is a strip growing from the card's trailing edge, clipped to the
/// card's shape: it starts out of sight, and reaches [radius] under the moving
/// card, so the card's own rounded corners always have red behind them.
///
/// The label eases in — fading and sliding softly from the edge — as the card
/// uncovers its spot by the edge, then keeps to the middle of the red,
/// drifting toward the centre as the strip widens, and centred when the swipe
/// completes.
class _UnsaveBackground extends StatelessWidget {
  const _UnsaveBackground({required this.progress, required this.radius});

  final ValueListenable<double> progress;
  final double radius;

  /// The label eases in while the uncovered strip grows between these
  /// fractions of its resting strip — from when the strip already clears the
  /// label, so it never shows half under the card, to a little past it.
  static const double _revealFrom = 0.85;
  static const double _revealTo = 1.4;

  /// How far the label slides in from the edge while it fades in.
  static const double _revealSlide = 16;

  /// Over how many pixels of drag the red fades in, so nothing shows at rest.
  static const double _redFadeLength = 2;

  static const double _iconSize = 20;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final edgePadding = context.spacing.s24;
    final gap = context.spacing.s8;
    final labelStyle = context.typography.medium14.inverse(context);
    final label = context.l10n.savedProfiles_unsave;

    final content = Row(
      mainAxisSize: .min,
      spacing: gap,
      children: [
        Icon(SolarIconsOutline.bookmark, color: colors.textWhite, size: _iconSize),
        Text(label, style: labelStyle, maxLines: 1),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final contentWidth = _iconSize + gap + _textWidth(context, label, labelStyle);
        // The narrowest strip the label sits centred in while keeping its
        // padding from the edge.
        final restingBox = contentWidth + 2 * edgePadding;
        final slideSign = Directionality.of(context) == TextDirection.rtl ? -1.0 : 1.0;

        return ClipRSuperellipse(
          borderRadius: BorderRadius.circular(radius),
          child: ValueListenableBuilder<double>(
            valueListenable: progress,
            builder: (context, progress, _) {
              final offset = progress * width;
              final revealStart = restingBox * _revealFrom;
              final revealEnd = restingBox * _revealTo;
              final reveal = Curves.easeOutCubic.transform(
                ((offset - revealStart) / (revealEnd - revealStart)).clamp(0.0, 1.0),
              );

              return Stack(
                children: [
                  PositionedDirectional(
                    top: 0,
                    bottom: 0,
                    end: 0,
                    width: math.min(width, offset + radius),
                    child: Opacity(
                      opacity: (offset / _redFadeLength).clamp(0.0, 1.0),
                      child: ColoredBox(color: colors.energyCherryPrimary),
                    ),
                  ),
                  PositionedDirectional(
                    top: 0,
                    bottom: 0,
                    end: 0,
                    width: math.min(width, math.max(offset, restingBox)),
                    child: Opacity(
                      opacity: reveal,
                      child: Transform.translate(
                        offset: Offset(slideSign * _revealSlide * (1 - reveal), 0),
                        // Free of the row's height, which shrinks to nothing
                        // as the dismissed card collapses.
                        // Loose, so the row keeps its own width and sits
                        // centred rather than stretched across the strip.
                        child: OverflowBox(
                          minWidth: 0,
                          minHeight: 0,
                          maxWidth: double.infinity,
                          maxHeight: double.infinity,
                          child: content,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  static double _textWidth(BuildContext context, String text, TextStyle style) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
      maxLines: 1,
    )..layout();
    final width = painter.width;
    painter.dispose();
    return width;
  }
}
