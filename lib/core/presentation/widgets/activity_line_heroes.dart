import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// An activity line's icon that flies between screens as a [Hero], e.g. from
/// its dashboard chip into the line screen's app bar.
///
/// Every instance for the same line shares a tag, so place at most one per
/// route. In flight the icon resizes with the hero's rect and blends from one
/// end's [color] to the other's.
class ActivityLineIconHero extends StatelessWidget {
  const ActivityLineIconHero({
    super.key,
    required this.activityLine,
    required this.size,
    required this.color,
  });

  final ActivityLineEntity activityLine;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ('activity-line-icon', activityLine.id),
      // Back-swipes fly it home too, instead of snapping.
      transitionOnUserGestures: true,
      flightShuttleBuilder: (_, animation, direction, fromContext, toContext) {
        final (below, above) = _ends<ActivityLineIconHero>(direction, fromContext, toContext);
        return AnimatedBuilder(
          animation: animation,
          // Unsized: the flight's rect sizes it.
          builder: (_, _) => _icon(Color.lerp(below.color, above.color, animation.value)!),
        );
      },
      child: _icon(color, size: size),
    );
  }

  Widget _icon(Color color, {double? size}) => SvgPicture.asset(
    activityLine.iconPath,
    width: size,
    height: size,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );
}

/// An activity line's name that flies between screens as a [Hero], alongside
/// [ActivityLineIconHero] — e.g. from a dashboard chip's caption into the line
/// screen's title.
///
/// In flight the text scales to fill the hero's rect, so it grows or shrinks
/// with it, while its [style] blends from one end's to the other's.
class ActivityLineNameHero extends StatelessWidget {
  const ActivityLineNameHero({
    super.key,
    required this.activityLine,
    required this.style,
    this.maxLines,
    this.overflow,
  });

  final ActivityLineEntity activityLine;
  final TextStyle style;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final name = activityLine.getName(context.l10n);

    return Hero(
      tag: ('activity-line-name', activityLine.id),
      transitionOnUserGestures: true,
      flightShuttleBuilder: (_, animation, direction, fromContext, toContext) {
        final (below, above) = _ends<ActivityLineNameHero>(direction, fromContext, toContext);
        // The flight runs in the overlay, outside any page's Material, where
        // bare text would fall back to the debug style.
        return Material(
          type: .transparency,
          child: AnimatedBuilder(
            animation: animation,
            builder: (_, _) => FittedBox(
              child: Text(
                name,
                maxLines: 1,
                style: TextStyle.lerp(below.style, above.style, animation.value),
              ),
            ),
          ),
        );
      },
      child: Text(name, maxLines: maxLines, overflow: overflow, style: style),
    );
  }
}

/// The two ends of a flight as (screen underneath, screen on top).
///
/// A flight's animation is the upper route's progress either way: 0 is the
/// screen underneath, 1 the one on top — and a pop flies from the top one.
(T, T) _ends<T extends Widget>(
  HeroFlightDirection direction,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) {
  final from = fromHeroContext.findAncestorWidgetOfExactType<T>()!;
  final to = toHeroContext.findAncestorWidgetOfExactType<T>()!;
  return direction == .push ? (from, to) : (to, from);
}
