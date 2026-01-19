import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/home/presentation/cubit/home_cubit.dart';
import 'package:coflow_users_v2/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import 'business_card.dart';

/// Section displaying businesses in a horizontal scrolling list.
class BusinessesSection extends StatelessWidget {
  const BusinessesSection({
    super.key,
    required this.profiles,
    this.onBusinessTap,
  });

  /// List of business profiles to display.
  final List<ProfileEntity> profiles;

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
        // Horizontal list
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: context.spacing.s24),
            itemCount: profiles.length,
            separatorBuilder: (_, _) => SizedBox(width: context.spacing.s12),
            itemBuilder: (context, index) {
              final profile = profiles[index];
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
    final homeCubit = context.read<HomeCubit>();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.backgroundWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.spacing.s24),
        ),
      ),
      builder: (context) => LocationSelectorBottomSheet(
        locations: locations,
        initialSelection: currentSelection,
        onConfirm: homeCubit.selectLocation,
      ),
    );
  }
}
