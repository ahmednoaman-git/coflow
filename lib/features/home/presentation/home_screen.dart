import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/core/domain/entities/activity_line_entity.dart' as core;
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:coflow_users_v2/features/home/presentation/widgets/instructors_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/entities.dart' hide ActivityLineEntity;
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';
import 'widgets/widgets.dart';

/// Discover/Home screen displaying activity lines, businesses, and instructors.
@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: const _HomeView(),
    );
  }
}

extension HomeSidePadding on Widget {
  /// Side padding used throughout the Home screen.
  Widget withHomeSidePadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing.s24),
      child: this,
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: context.colors.backgroundTwo,
        appBar: const HomeAppBar(),
        extendBodyBehindAppBar: true,
        body: const _HomeBody(),
      ),
    );
  }
}

/// Only the businesses row waits on the request — with its own skeleton — so
/// the rest of the screen is there from the first frame.
///
/// Its own widget so it reads the insets from under the [Scaffold], which
/// adds the app bar it draws behind to the top one.
class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return LogoRefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().refresh(),
      // The list runs behind the app bar; the logo appears below it.
      edgeOffset: MediaQuery.paddingOf(context).top,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              top: MediaQuery.paddingOf(context).top + context.spacing.s24,
              bottom: context.spacing.s24,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                spacing: context.spacing.s24,
                children: [
                  const _ActivityLinesRow().withHomeSidePadding(context),
                  BusinessesSection(
                    onBusinessTap: (profile) => context.router.push(
                      FacilityDetailsRoute(facility: profile.facilityPreview, isPreview: true),
                    ),
                  ),
                  BlocSelector<HomeCubit, HomeState, List<InstructorEntity>>(
                    selector: (state) => state.homeRequest.dataOrNull?.instructors ?? const [],
                    builder: (context, instructors) =>
                        InstructorsSection(instructors: instructors).withHomeSidePadding(context),
                  ),
                ],
              ),
            ),
          ),
          const SliverBottomInset(),
        ],
      ),
    );
  }
}

class _ActivityLinesRow extends StatelessWidget {
  const _ActivityLinesRow();

  /// Maximum width for the activity lines grid.
  static const double _maxGridWidth = 400.0;

  /// Standard activity lines (non-API related).
  static final List<ActivityLineEntity> _activityLines = ActivityLineEntity.all;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _maxGridWidth),
        child: GridView.count(
          padding: EdgeInsets.zero,
          crossAxisCount: 4,
          mainAxisSpacing: context.spacing.s12,
          crossAxisSpacing: context.spacing.s12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: _activityLines.map((activityLine) {
            return ActivityLineChip(
              activityLine: activityLine,
              isSelected: false,
              onTap: () => context.router.push(
                ActivityLineFacilitiesRoute(
                  activityLine: activityLine,
                  // Shown straight away and checked against the line's own
                  // locations once they load.
                  initialLocation: context.read<HomeCubit>().state.selectedLocation,
                  // And picking one there carries it back here.
                  onLocationSelected: context.read<HomeCubit>().adoptLocation,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

extension on ProfileEntity {
  /// What the facility screen can show at once: the dashboard's profiles carry
  /// no account type, subscription, status or payment type, so those are
  /// placeholders the screen replaces from the profile it loads.
  CollapsedFacilityEntity get facilityPreview => CollapsedFacilityEntity(
    id: id,
    name: name,
    description: title,
    logoUrl: logo,
    coverUrl: cover,
    activityLine: core.ActivityLineEntity.fromId(activityLine.id),
    accountType: const GoAccount(),
    status: FacilityStatus.visible,
    subscriptionStatus: SubscriptionStatus.inactive,
    paymentType: PaymentType.none,
    views: 0,
    locationLabel: switch ([area?.name, city?.name].nonNulls.join(', ')) {
      '' => null,
      final label => label,
    },
  );
}
