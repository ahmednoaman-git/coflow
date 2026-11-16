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
  static const double buttonSize = CircularButton.standardSize;

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
      padding: EdgeInsetsDirectional.only(
        top: topPadding,
        start: buttonSpacing,
        end: buttonSpacing,
      ),
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          spacing: buttonSpacing,
          children: [
            MainBackButton(
              backgroundColor: Colors.black.withValues(alpha: 0.3),
              iconColor: Colors.white,
            ),
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
    );
  }
}

/// The save toggle. Only offered once the profile has loaded, since it needs
/// the current flag to know which way it flips.
///
/// Flips on every tap — the cubit merges the taps before anything is sent —
/// and reports once the server has settled, or put the bookmark back.
class _SaveControl extends StatelessWidget {
  const _SaveControl();

  @override
  Widget build(BuildContext context) {
    return BlocListener<FacilityDetailsCubit, FacilityDetailsState>(
      listenWhen: (previous, current) => previous.saveRequest != current.saveRequest,
      listener: (context, state) => switch (state.saveRequest) {
        AsyncSuccess(data: true) => context.showSuccessSnackBar(
          context.l10n.facilityDetails_saveAdded,
        ),
        AsyncSuccess(data: false) => context.showSuccessSnackBar(
          context.l10n.facilityDetails_saveRemoved,
        ),
        AsyncError() => context.showErrorSnackBar(context.l10n.facilityDetails_saveFailed),
        _ => null,
      },
      child: BlocSelector<FacilityDetailsCubit, FacilityDetailsState, bool?>(
        selector: (state) => state.profileRequest.dataOrNull?.isSaved,
        builder: (context, isSaved) {
          if (isSaved == null) return const SizedBox.shrink();

          return CircularButton(
            icon: isSaved ? SolarIconsBold.bookmark : SolarIconsOutline.bookmark,
            size: FacilityHeaderControls.buttonSize,
            // Solid white while saved, translucent while not, so the state reads
            // against any cover image.
            backgroundColor: isSaved
                ? context.colors.backgroundWhite
                : Colors.black.withValues(alpha: 0.3),
            iconColor: isSaved ? context.colors.signatureBlue : Colors.white,
            onPressed: context.read<FacilityDetailsCubit>().toggleSave,
          );
        },
      ),
    );
  }
}
