import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../activity_line/domain/domain.dart';
import 'components/components.dart';
import 'cubit/cubit.dart';

@RoutePage()
class FacilityDetailsScreen extends StatefulWidget {
  const FacilityDetailsScreen({
    super.key,
    required this.facility,
    this.isPreview = false,
  });

  final CollapsedFacilityEntity facility;

  /// Whether [facility] is only a preview — its id, name, title, images and
  /// activity line — built from a payload that lacks the rest, such as the
  /// home dashboard's profiles. The screen opens at once with the header and
  /// shows skeletons for the tabs until the profile fills the facility in.
  final bool isPreview;

  @override
  State<FacilityDetailsScreen> createState() => _FacilityDetailsScreenState();
}

class _FacilityDetailsScreenState extends State<FacilityDetailsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final (activityLineColor, activityLineBackground) = widget.facility.activityLine.getColors(
      context,
    );

    return BlocProvider<FacilityDetailsCubit>(
      create: (context) =>
          getIt<FacilityDetailsCubit>(param1: widget.facility, param2: widget.isPreview),
      // The cubit's copy, not `widget.facility`: it picks up the payment type
      // from the freshly read profile.
      child:
          BlocSelector<FacilityDetailsCubit, FacilityDetailsState, (CollapsedFacilityEntity, bool)>(
            selector: (state) => (state.facility, state.isResolved),
            builder: (context, selected) => FacilityDataProvider(
              scrollController: _scrollController,
              facility: selected.$1,
              isResolved: selected.$2,
              activityLineColor: activityLineColor,
              activityLineBackground: activityLineBackground,
              child: Scaffold(
                body: FacilityScreenBody(scrollController: _scrollController),
              ),
            ),
          ),
    );
  }
}
