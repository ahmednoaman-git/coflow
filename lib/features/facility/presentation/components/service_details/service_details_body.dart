import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../cubit/cubit.dart';
import '../facility_data_provider.dart';
import 'service_details_header_controls.dart';
import 'service_details_sections.dart';
import 'service_details_shimmer.dart';
import 'service_image_header.dart';
import 'service_level_pill_row.dart';

const double _headerHeight = 320;
const double _sheetOverlap = 20;

/// The service details screen body: an image header with a rounded sheet
/// rising over it, mirroring the facility details screen's layered header
/// pattern via [CustomScrollView] + [SliverAppBar] (simplified — no pinned
/// tab bar).
class ServiceDetailsBody extends StatelessWidget {
  const ServiceDetailsBody({super.key, required this.service});

  final CollapsedFacilityServiceEntity service;

  @override
  Widget build(BuildContext context) {
    final activityLineColor = FacilityDataProvider.of(context).activityLineColor;

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: _headerHeight,
              backgroundColor: activityLineColor,
              elevation: 0,
              flexibleSpace: BlocSelector<ServiceDetailsCubit, ServiceDetailsState, List<String>>(
                selector: (state) =>
                    state.detailsRequest.dataOrNull?.imageUrls ??
                    (service.imageUrl != null ? [service.imageUrl!] : const []),
                builder: (context, imageUrls) => ServiceImageHeader(imageUrls: imageUrls),
              ),
            ),
            SliverToBoxAdapter(
              child: Transform.translate(
                offset: const Offset(0, -_sheetOverlap),
                child: Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: context.colors.backgroundWhite,
                    shape: const RoundedSuperellipseBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(_sheetOverlap)),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(
                    context.spacing.s16,
                    context.spacing.s24,
                    context.spacing.s16,
                    context.spacing.s96,
                  ),
                  child: Column(
                    crossAxisAlignment: .center,
                    spacing: context.spacing.s8,
                    children: [
                      Text(
                        service.name,
                        textAlign: .center,
                        style: context.typography.bold18.primary(context),
                      ),
                      ServiceLevelPillRow(
                        level: service.level,
                        durationLabel: service.durationLabel,
                      ),
                      Align(
                        alignment: .centerLeft,
                        child:
                            AsyncHandler<
                              ServiceDetailsCubit,
                              ServiceDetailsState,
                              FacilityServiceDetailsEntity
                            >(
                              requestManagerGetter: (cubit) => cubit.detailsManager,
                              loadingBuilder: (context) => const ServiceDetailsShimmer(),
                              onRetry: (cubit) => cubit.refresh(),
                              successBuilder: (context, details) =>
                                  ServiceDetailsSections(details: details),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const ServiceDetailsHeaderControls(),
      ],
    );
  }
}
