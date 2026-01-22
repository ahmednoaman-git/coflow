import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class FacilityHeaderControls extends StatelessWidget {
  const FacilityHeaderControls({super.key});

  static const double controlEdgeInsets = 12 + 8 + 2 * 25;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        right: context.spacing.s12,
      ),
      child: SizedBox(
        height: kToolbarHeight,
        child: Theme(
          data: Theme.of(context).copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            actionIconTheme: ActionIconThemeData(
              backButtonIconBuilder: (context) => Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          child: Row(
            children: [
              const BackButton(),
              const Spacer(),
              _buildCircularButton(
                context,
                icon: SolarIconsOutline.bookmark,
                onPressed: () {},
              ),
              const SizedBox(width: 12),
              _buildCircularButton(
                context,
                icon: SolarIconsOutline.share,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.3),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
