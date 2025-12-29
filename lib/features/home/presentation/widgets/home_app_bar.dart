import 'dart:math';

import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/navigation_root/presentation/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// Custom AppBar for the Home screen with:
/// - Dark signature blue background with black-to-transparent gradient
/// - Coflow logo positioned in background
/// - User avatar with welcome text
/// - Search and notification buttons (transparent background)
/// - Bottom border radius
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  /// Bottom border radius value
  static const double borderRadius = 32.0;

  /// Content height
  static const double contentHeight = 140.0;

  @override
  Size get preferredSize => const Size.fromHeight(contentHeight);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return Container(
      height: contentHeight + topPadding,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(borderRadius),
          ),
        ),
        color: Color(0xFF181935),
      ),
      child: Stack(
        children: [
          // Gradient overlay
          const Positioned.fill(child: _GradientOverlay()),
          // Logo in background
          Positioned(
            left: -180,
            top: -140,

            child: Transform.rotate(
              angle: -pi,
              child: Opacity(
                opacity: 0.1,
                child: Assets.svgs.logo.svg(width: 350, height: 350),
              ),
            ),
          ),
          // Content
          Positioned(
            left: 0,
            right: 0,
            bottom: context.spacing.s32,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
              child: const _AppBarContent(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Black-to-transparent gradient overlay
class _GradientOverlay extends StatelessWidget {
  const _GradientOverlay();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(HomeAppBar.borderRadius),
          ),
        ),
        gradient: LinearGradient(
          begin: .topCenter,
          end: .bottomCenter,
          stops: const [0.0, 0.5],
          colors: [Colors.black.withValues(alpha: 0.6), Colors.transparent],
        ),
      ),
    );
  }
}

/// Main content of the app bar (avatar, text, buttons)
class _AppBarContent extends StatelessWidget {
  const _AppBarContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _UserAvatar(),
        SizedBox(width: context.spacing.s12),
        const Expanded(child: _WelcomeText()),
        const _ActionButtons(),
      ],
    );
  }
}

/// User avatar with profile image
class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    final user = context.user;

    return Container(
      width: 52,
      height: 52,
      decoration: ShapeDecoration(
        shape: const CircleBorder(
          side: BorderSide(color: Colors.white, width: 2),
        ),
        image: user.image != null && user.image!.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(user.image!),
                fit: BoxFit.cover,
              )
            : null,
        color: user.image == null || user.image!.isEmpty
            ? Colors.white.withValues(alpha: 0.2)
            : null,
      ),
      child: user.image == null || user.image!.isEmpty
          ? Center(
              child: Text(
                user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                style: context.typography.bold18.copyWith(color: Colors.white),
              ),
            )
          : null,
    );
  }
}

/// Welcome text with user name
class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    final user = context.user;
    final displayName = user.name.split(' ').take(2).join(' ');

    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(
          context.l10n.welcome,
          style: context.typography.book14.copyWith(
            color: context.colors.earthSunnyGoldPrimary,
          ),
        ),
        Text(
          '$displayName 👋',
          style: context.typography.bold16.copyWith(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

/// Search and notification buttons (transparent background)
class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      spacing: context.spacing.s8,
      children: [
        CircularButton(
          icon: SolarIconsOutline.magnifier,
          size: 44,
          iconSize: 24,
          backgroundColor: Colors.transparent,
          iconColor: Colors.white,
          onPressed: () {
            // TODO: Navigate to search
          },
        ),
        Stack(
          children: [
            CircularButton(
              icon: SolarIconsOutline.bell,
              size: 44,
              iconSize: 24,
              backgroundColor: Colors.transparent,
              iconColor: Colors.white,
              onPressed: () {
                // TODO: Navigate to notifications
              },
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: context.colors.earthSunnyGoldPrimary,
                  shape: .circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
