import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../activity_line/domain/domain.dart';
import '../domain/entities/entities.dart';
import '../domain/enums/enums.dart';
import 'components/components.dart';
import 'cubit/cubit.dart';

@RoutePage()
class FacilityServiceDetailsScreen extends StatefulWidget {
  const FacilityServiceDetailsScreen({
    super.key,
    required this.service,
    required this.type,
    required this.facility,
  });

  final CollapsedFacilityServiceEntity service;
  final FacilityServiceType type;
  final CollapsedFacilityEntity facility;

  @override
  State<FacilityServiceDetailsScreen> createState() => _FacilityServiceDetailsScreenState();
}

class _FacilityServiceDetailsScreenState extends State<FacilityServiceDetailsScreen> {
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

    return BlocProvider<ServiceDetailsCubit>(
      create: (_) => getIt<ServiceDetailsCubit>(param1: widget.service.id, param2: widget.type),
      child: FacilityDataProvider(
        scrollController: _scrollController,
        facility: widget.facility,
        activityLineColor: activityLineColor,
        activityLineBackground: activityLineBackground,
        child: Scaffold(
          body: ServiceDetailsBody(service: widget.service),
          bottomNavigationBar: const ServiceViewPricingButton(),
        ),
      ),
    );
  }
}
