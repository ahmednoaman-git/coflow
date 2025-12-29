import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/home/presentation/widgets/instructors_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/entities.dart';
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
        body: AsyncHandler<HomeCubit, HomeState, HomeEntity>(
          requestManagerGetter: (cubit) => cubit.homeManager,
          onRetry: (cubit) => cubit.refresh(),
          successBuilder: (context, home) {
            return RefreshIndicator(
              onRefresh: () => context.read<HomeCubit>().refresh(),
              color: context.colors.signatureBlue,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: MediaQuery.paddingOf(context).top + context.spacing.s24,
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: context.spacing.s24,
                  children: [
                    // Activity Line Chips
                    _ActivityLinesRow(home: home).withHomeSidePadding(context),
                    // Businesses Section
                    BusinessesSection(
                      profiles: home.profiles,
                      onBusinessTap: _onBusinessTap,
                    ),
                    // Instructors Section Header
                    InstructorsSection(
                      instructors: home.instructors,
                    ).withHomeSidePadding(context),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onBusinessTap(ProfileEntity profile) {
    // TODO: Navigate to business details
  }
}

class _ActivityLinesRow extends StatelessWidget {
  const _ActivityLinesRow({required this.home});

  final HomeEntity home;

  /// Maximum width for the activity lines grid.
  static const double _maxGridWidth = 400.0;

  /// Standard activity lines (non-API related).
  static const _activityLines = ['Sky', 'Sea', 'Earth', 'Energy'];

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
              name: activityLine,
              isSelected: false,
              onTap: () {
                // TODO: Navigate to activity line screen
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
