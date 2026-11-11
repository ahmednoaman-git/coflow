import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/home/presentation/cubit/home_cubit.dart';
import 'package:coflow_users_v2/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import 'business_card.dart';

/// Section displaying businesses in a horizontal scrolling list.
///
/// The header is always there; the row shows card skeletons while the home
/// request loads, and the cards fade in over them.
class BusinessesSection extends StatelessWidget {
  const BusinessesSection({super.key, this.onBusinessTap});

  /// Callback when a business card is tapped.
  final void Function(ProfileEntity)? onBusinessTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.s24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.businesses,
                style: context.typography.bold18.primary(context),
              ),
              // Location filter button
              const _LocationFilterButton(),
            ],
          ),
        ),
        SizedBox(height: context.spacing.s16),
        AsyncHandler<HomeCubit, HomeState, HomeEntity>(
          requestManagerGetter: (cubit) => cubit.homeManager,
          skeletonBuilder: (_) => const Skeleton(
            child: _BusinessesRow(
              itemCount: 3,
              scrollable: false,
              itemBuilder: _skeletonCard,
            ),
          ),
          errorBuilder: (context, failure) => SizedBox(
            height: BusinessCard.height,
            child: Center(
              child: InlineAsyncError(
                failure: failure,
                onRetry: context.read<HomeCubit>().refresh,
              ),
            ),
          ),
          successBuilder: (context, home) => _BusinessesRow(
            itemCount: home.profiles.length,
            itemBuilder: (context, index) {
              final profile = home.profiles[index];
              return BusinessCard(
                profile: profile,
                onTap: () => onBusinessTap?.call(profile),
              );
            },
          ),
        ),
      ],
    );
  }

  static Widget _skeletonCard(BuildContext context, int index) => const BusinessCardSkeleton();
}

/// The horizontal row the cards — or their skeletons — sit in, so both line
/// up exactly.
class _BusinessesRow extends StatelessWidget {
  const _BusinessesRow({
    required this.itemCount,
    required this.itemBuilder,
    this.scrollable = true,
  });

  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: BusinessCard.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: scrollable ? null : const NeverScrollableScrollPhysics(),
        // Room for the cards' shadows, which the list would otherwise clip.
        clipBehavior: .none,
        padding: EdgeInsets.symmetric(horizontal: context.spacing.s24),
        itemCount: itemCount,
        separatorBuilder: (_, _) => SizedBox(width: context.spacing.s12),
        itemBuilder: itemBuilder,
      ),
    );
  }
}

/// Location filter button that shows the bottom sheet
class _LocationFilterButton extends StatelessWidget {
  const _LocationFilterButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.locationsRequest != current.locationsRequest ||
          previous.selectedLocation != current.selectedLocation,
      builder: (context, state) {
        final isLoading = state.locationsRequest.isLoading;
        final locations = state.locationsRequest.isSuccess
            ? (state.locationsRequest as AsyncSuccess<LocationsEntity>).data
            : null;

        return LocationButton(
          selection: state.selectedLocation,
          isLoading: isLoading,
          backgroundColor: context.colors.signatureBlue,
          textColor: context.colors.textWhite,
          iconColor: context.colors.textWhite,
          onTap: locations != null
              ? () => _showLocationBottomSheet(
                  context,
                  locations: locations,
                  currentSelection: state.selectedLocation,
                )
              : null,
        );
      },
    );
  }

  void _showLocationBottomSheet(
    BuildContext context, {
    required LocationsEntity locations,
    required SelectedLocation currentSelection,
  }) {
    // Captured up front: the sheet mounts on the root navigator, outside this
    // subtree, so it cannot look the cubit up for itself.
    final homeCubit = context.read<HomeCubit>();

    showMainBottomSheet<void>(
      context: context,
      builder: (_) => LocationSelectorBottomSheet(
        locations: locations,
        initialSelection: currentSelection,
        onConfirm: homeCubit.selectLocation,
      ),
    );
  }
}
