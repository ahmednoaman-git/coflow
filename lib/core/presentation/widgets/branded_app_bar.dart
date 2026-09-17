import 'dart:math';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Dark brand header used by the account-side screens: signature blue panel,
/// rounded bottom corners, oversized logo arcs bleeding out of the top-left,
/// and a centered title.
///
/// Pairs with `AnnotatedRegion<SystemUiOverlayStyle>(value: .light)` on the
/// screen so the status bar stays legible against it.
class BrandedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BrandedAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions = const [],
  });

  final String title;

  /// Shows a back control at the start edge. Screens that sit at the root of a
  /// tab leave this off.
  final bool showBackButton;

  /// Trailing controls, rendered at the end edge.
  final List<Widget> actions;

  static const double borderRadius = 32.0;
  static const double contentHeight = 108.0;

  @override
  Size get preferredSize => const Size.fromHeight(contentHeight);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return Container(
      height: contentHeight + topPadding,
      decoration: ShapeDecoration(
        color: context.colors.signatureBlue,
        shape: const RoundedSuperellipseBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(borderRadius)),
        ),
      ),
      child: ClipRSuperellipse(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(borderRadius)),
        child: Stack(
          children: [
            Positioned(
              left: -150,
              top: -190,
              child: Transform.rotate(
                angle: -pi,
                child: Opacity(
                  opacity: 0.5,
                  child: Assets.svgs.logo.svg(width: 360, height: 360),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: context.spacing.s24,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
                child: _Bar(title: title, showBackButton: showBackButton, actions: actions),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.title, required this.showBackButton, required this.actions});

  final String title;
  final bool showBackButton;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Centred independently of the controls so the title does not shift
        // when only one side has them.
        Text(
          title,
          style: context.typography.bold18.inverse(context),
          maxLines: 1,
          overflow: .ellipsis,
        ),
        Row(
          children: [
            if (showBackButton)
              MainBackButton(
                size: 44,
                iconSize: 22,
                backgroundColor: Colors.transparent,
                iconColor: context.colors.textWhite,
              ),
            const Spacer(),
            ...actions,
          ],
        ),
      ],
    );
  }
}
