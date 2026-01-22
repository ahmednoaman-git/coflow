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
    this.logoImageProvider,
  });

  final CollapsedFacilityEntity facility;

  /// Optional logo provider to support a Hero transition from list cards.
  final ImageProvider? logoImageProvider;

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
      create: (context) => getIt<FacilityDetailsCubit>(param1: widget.facility),
      child: FacilityDataProvider(
        scrollController: _scrollController,
        facility: widget.facility,
        logoImageProvider: widget.logoImageProvider,
        activityLineColor: activityLineColor,
        activityLineBackground: activityLineBackground,
        child: Scaffold(
          body: FacilityScreenBody(scrollController: _scrollController),
        ),
      ),
    );
  }
}
