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
              CircularButton(
                icon: SolarIconsOutline.bookmark,
                size: 40,
                backgroundColor: Colors.black.withValues(alpha: 0.3),
                iconColor: Colors.white,
                onPressed: () {},
              ),
              const SizedBox(width: 12),
              CircularButton(
                icon: SolarIconsOutline.share,
                size: 40,
                backgroundColor: Colors.black.withValues(alpha: 0.3),
                iconColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
