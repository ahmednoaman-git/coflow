import 'package:flutter/material.dart';

/// Cross-fades between a [skeleton] and the [child] it stands for, for content
/// whose loading isn't behind an `AsyncHandler` (which fades on its own given a
/// `skeletonBuilder`) — say, a row filled in by another request's result.
///
/// Both are laid over each other from the top while they fade, so neither
/// jumps. Changes within [child] don't fade; only switching between the two.
class SkeletonSwitcher extends StatelessWidget {
  const SkeletonSwitcher({
    super.key,
    required this.loading,
    required this.skeleton,
    required this.child,
  });

  final bool loading;
  final Widget skeleton;
  final Widget child;

  static const Duration duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
    duration: duration,
    switchInCurve: Curves.easeOut,
    switchOutCurve: Curves.easeIn,
    layoutBuilder: (current, previous) => Stack(
      alignment: AlignmentDirectional.topStart,
      children: [...previous, ?current],
    ),
    child: KeyedSubtree(key: ValueKey(loading), child: loading ? skeleton : child),
  );
}
