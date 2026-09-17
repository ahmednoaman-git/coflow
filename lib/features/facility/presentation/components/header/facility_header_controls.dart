import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../cubit/cubit.dart';

/// Overlay controls on the facility cover: back, save, and share.
///
/// These float above the scroll view for the whole screen, so the pinned header
/// underneath has to keep [controlEdgeInsets] clear at each edge once it slides
/// up behind them.
class FacilityHeaderControls extends StatelessWidget {
  const FacilityHeaderControls({super.key});

  /// Diameter of each control.
  static const double buttonSize = 40;

  /// Gap between the actions, and between the last action and the screen edge.
  static const double buttonSpacing = 12;

  /// Actions rendered at the end edge: save and share.
  static const int actionCount = 2;

  /// Horizontal space the pinned title must leave clear at each edge.
  ///
  /// Measured from the end cluster, which is wider than the lone back button,
  /// and applied symmetrically so the title stays centred on the screen rather
  /// than drifting off-centre between the two clusters.
  static const double controlEdgeInsets =
      buttonSpacing + actionCount * buttonSize + (actionCount - 1) * buttonSpacing;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        right: buttonSpacing,
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
                width: buttonSize,
                height: buttonSize,
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
            spacing: buttonSpacing,
            children: [
              const BackButton(),
              const Spacer(),
              const _SaveControl(),
              CircularButton(
                icon: SolarIconsOutline.share,
                size: buttonSize,
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

/// The save toggle. Only offered once the profile has loaded, since it needs
/// the current flag to know which way it flips.
class _SaveControl extends StatelessWidget {
  const _SaveControl();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacilityDetailsCubit, FacilityDetailsState>(
      builder: (context, state) {
        final cubit = context.read<FacilityDetailsCubit>();
        final profile = cubit.profileManager.data;
        if (profile == null) return const SizedBox.shrink();

        final isSaved = profile.isSaved;
        final isLoading = cubit.saveManager.isLoading;

        return CircularButton(
          icon: isSaved ? SolarIconsBold.bookmark : SolarIconsOutline.bookmark,
          size: FacilityHeaderControls.buttonSize,
          isLoading: isLoading,
          // Solid white while saved, translucent while not, so the state reads
          // against any cover image.
          backgroundColor: isSaved
              ? context.colors.backgroundWhite
              : Colors.black.withValues(alpha: 0.3),
          iconColor: isSaved ? context.colors.signatureBlue : Colors.white,
          onPressed: isLoading ? null : () => _toggle(context, cubit, isSaved),
        );
      },
    );
  }

  Future<void> _toggle(BuildContext context, FacilityDetailsCubit cubit, bool wasSaved) async {
    await cubit.toggleSave();
    if (!context.mounted) return;

    if (cubit.saveManager.isError) {
      context.showErrorSnackBar(context.l10n.facilityDetails_saveFailed);
    } else {
      context.showSuccessSnackBar(
        wasSaved
            ? context.l10n.facilityDetails_saveRemoved
            : context.l10n.facilityDetails_saveAdded,
      );
    }
  }
}
