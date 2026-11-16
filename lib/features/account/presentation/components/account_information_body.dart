import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/authentication/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import '../cubit/cubit.dart';
import 'account_info_card.dart';
import 'account_management_list.dart';
import 'change_password_sheet.dart';
import 'nationality_picker_sheet.dart';
import 'profile_photo_header.dart';

/// Body of Account Information: photo and name, the details card, an edit
/// button, and the security group.
///
/// Shows the profile held by [ProfileCubit] (fetched at sign-in), so it opens
/// filled; pulling down re-reads it.
class AccountInformationBody extends StatelessWidget {
  const AccountInformationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LogoRefreshIndicator(
      onRefresh: () => context.read<ProfileCubit>().profileManager.refresh(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(context.spacing.s24),
            sliver: SliverToBoxAdapter(
              child: AsyncHandler<ProfileCubit, ProfileState, ProfileEntity>(
                requestManagerGetter: (cubit) => cubit.profileManager,
                skeletonBuilder: (_) => const _Skeleton(),
                onRetry: (cubit) => cubit.profileManager.refresh(),
                onBackgroundError: (context, failure) => context.showErrorSnackBar(failure.message),
                successBuilder: (context, profile) => _Content(user: profile.user),
              ),
            ),
          ),
          const SliverBottomInset(),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final birthdate = DateTime.tryParse(user.birthdate ?? '');

    return Column(
      crossAxisAlignment: .stretch,
      spacing: context.spacing.s24,
      children: [
        ProfilePhotoHeader(user: user),
        _Section(
          title: l10n.accountInfo_personalDetails,
          child: AccountInfoCard(
            rows: [
              AccountInfoRow(
                icon: SolarIconsOutline.userRounded,
                label: l10n.fullName,
                value: user.name,
              ),
              AccountInfoRow(icon: SolarIconsOutline.letter, label: l10n.email, value: user.email),
              AccountInfoRow(icon: SolarIconsOutline.phone, label: l10n.phone, value: user.phone),
              AccountInfoRow(
                icon: SolarIconsOutline.calendarMinimalistic,
                label: l10n.birthdate,
                value: birthdate == null
                    ? user.birthdate
                    : DateFormat.yMMMMd(context.locale.toLanguageTag()).format(birthdate),
              ),
              AccountInfoRow(
                icon: user.gender == Gender.female
                    ? SolarIconsOutline.women
                    : SolarIconsOutline.men,
                label: l10n.gender,
                value: user.gender.displayName(context),
              ),
              AccountInfoRow(
                icon: SolarIconsOutline.globus,
                label: l10n.nationality,
                value: switch (user.nationality) {
                  final nationality? => displayNationality(nationality),
                  null => null,
                },
              ),
            ],
          ),
        ),
        MainButton(
          text: l10n.accountInfo_edit,
          leadingIcon: SolarIconsOutline.penNewSquare,
          height: 48,
          onPressed: () => context.router.push(const EditAccountInformationRoute()),
        ),
        _Section(
          title: l10n.accountInfo_security,
          child: AccountManagementList(
            actions: [
              AccountManagementAction(
                icon: SolarIconsOutline.lockPassword,
                label: l10n.accountInfo_changePassword,
                onTap: () => ChangePasswordSheet.show(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      spacing: context.spacing.s12,
      children: [
        Text(title, style: context.typography.bold18.primary(context)),
        child,
      ],
    );
  }
}

class _Skeleton extends StatelessWidget {
  const _Skeleton();

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: context.spacing.s24,
        children: [
          const ProfilePhotoHeaderSkeleton(),
          _Section(
            title: context.l10n.accountInfo_personalDetails,
            child: const AccountInfoCardSkeleton(rowCount: 6),
          ),
        ],
      ),
    );
  }
}
