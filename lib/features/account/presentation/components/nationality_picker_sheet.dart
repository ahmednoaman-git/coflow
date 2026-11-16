import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import '../cubit/cubit.dart';

/// Shows a stored nationality with its first letter capitalised: the
/// backend's list mixes "egyptian" with "Egypt". Display only; the value sent
/// back is untouched.
String displayNationality(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) return trimmed;
  return trimmed[0].toUpperCase() + trimmed.substring(1);
}

/// Searchable list of the backend's nationalities (`GET nationalities`).
/// Resolves to the picked name, or null when dismissed.
class NationalityPickerSheet extends StatefulWidget {
  const NationalityPickerSheet({super.key, this.selected});

  final String? selected;

  /// Opens the sheet on the root navigator, re-providing [AccountInfoCubit]
  /// from [context], and loads the list if it isn't already.
  static Future<String?> show(BuildContext context, {String? selected}) {
    final cubit = context.read<AccountInfoCubit>()..loadNationalities();

    return showMainBottomSheet<String>(
      context: context,
      useSafeArea: true,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: NationalityPickerSheet(selected: selected),
      ),
    );
  }

  @override
  State<NationalityPickerSheet> createState() => _NationalityPickerSheetState();
}

class _NationalityPickerSheetState extends State<NationalityPickerSheet> {
  String _query = '';

  bool _isSelected(NationalityEntity nationality) =>
      nationality.name.toLowerCase() == widget.selected?.trim().toLowerCase();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) => Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: context.spacing.s12),
            width: 40,
            height: 4,
            decoration: ShapeDecoration(
              color: context.colors.strokeSecondary,
              shape: const StadiumBorder(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.spacing.s16),
            child: Text(
              context.l10n.nationality,
              style: context.typography.bold18.primary(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
            child: MainTextField(
              hintText: context.l10n.accountInfo_searchNationality,
              prefixIcon: SolarIconsOutline.magnifier,
              onChanged: (value) => setState(() => _query = value.trim().toLowerCase()),
            ),
          ),
          SizedBox(height: context.spacing.s12),
          Expanded(
            child: AsyncHandler<AccountInfoCubit, AccountInfoState, List<NationalityEntity>>(
              requestManagerGetter: (cubit) => cubit.nationalitiesManager,
              skeletonBuilder: (_) => const _ListSkeleton(),
              errorBuilder: (context, failure) => Padding(
                padding: EdgeInsets.all(context.spacing.s16),
                child: InlineAsyncError(
                  failure: failure,
                  onRetry: context.read<AccountInfoCubit>().loadNationalities,
                ),
              ),
              successBuilder: (context, nationalities) {
                final matches = _query.isEmpty
                    ? nationalities
                    : [
                        for (final nationality in nationalities)
                          if (nationality.name.toLowerCase().contains(_query)) nationality,
                      ];

                if (matches.isEmpty) {
                  return Center(
                    child: Text(
                      context.l10n.accountInfo_noNationalitiesFound,
                      style: context.typography.medium14.tertiary(context),
                    ),
                  );
                }

                return ListView.separated(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    context.spacing.s16,
                    0,
                    context.spacing.s16,
                    context.spacing.s16,
                  ),
                  itemCount: matches.length,
                  separatorBuilder: (_, _) => SizedBox(height: context.spacing.s8),
                  itemBuilder: (context, index) {
                    final nationality = matches[index];
                    return _NationalityTile(
                      name: displayNationality(nationality.name),
                      isSelected: _isSelected(nationality),
                      onTap: () => Navigator.of(context).pop(nationality.name),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NationalityTile extends StatelessWidget {
  const _NationalityTile({required this.name, required this.isSelected, required this.onTap});

  static const double height = 48;

  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      onTap: onTap,
      scaleEnd: 0.98,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: context.spacing.s12),
        decoration: ShapeDecoration(
          color: isSelected ? context.colors.signatureBlueSecondary : context.colors.backgroundTwo,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s12),
            side: BorderSide(
              color: isSelected ? context.colors.signatureBlue : context.colors.strokePrimary,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: isSelected
                    ? context.typography.medium14.brand(context)
                    : context.typography.medium14.primary(context),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            if (isSelected)
              Icon(SolarIconsOutline.checkCircle, size: 20, color: context.colors.signatureBlue),
          ],
        ),
      ),
    );
  }
}

class _ListSkeleton extends StatelessWidget {
  const _ListSkeleton();

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
        child: Column(
          spacing: context.spacing.s8,
          children: [
            for (var i = 0; i < 8; i++)
              SkeletonBox(height: _NationalityTile.height, radius: context.spacing.s12),
          ],
        ),
      ),
    );
  }
}
