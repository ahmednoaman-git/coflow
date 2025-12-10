import 'dart:io';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sealed_countries/sealed_countries.dart';

import '../../../../domain/entities/entities.dart';
import '../../../state/state.dart';

/// Step 2: Profile details (image, gender, birthdate, nationality, phone).
class RegisterStep2 extends StatefulWidget {
  const RegisterStep2({super.key});

  @override
  State<RegisterStep2> createState() => _RegisterStep2State();
}

class _RegisterStep2State extends State<RegisterStep2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.spacing.s24),
      child: Column(
        crossAxisAlignment: .start,
        spacing: context.spacing.s24,
        children: [
          // Header
          Text(
            context.l10n.profileDetails,
            style: context.typography.bold20.primary(context),
          ),
          Text(
            context.l10n.profileDetailsSubtitle,
            style: context.typography.book14.secondary(context),
          ),
          SizedBox(height: context.spacing.s8),
          // Profile image
          const Center(child: _ProfileImagePicker()),
          // Form fields
          const _GenderSelector(),
          const _BirthdatePicker(),
          const _NationalityDropdown(),
          const _PhoneField(),
          SizedBox(height: context.spacing.s16),
          // Next button
          const _NextButton(),
        ],
      ),
    );
  }
}

class _ProfileImagePicker extends StatelessWidget {
  const _ProfileImagePicker();

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && context.mounted) {
      context.read<RegisterCubit>().imageChanged(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, curr) => prev.image != curr.image,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => _pickImage(context),
          child: Container(
            width: 100,
            height: 100,
            decoration: ShapeDecoration(
              color: context.colors.backgroundGrey,
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: context.colors.strokePrimary),
              ),
              image: state.image != null
                  ? DecorationImage(
                      image: FileImage(state.image!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: state.image == null
                ? Icon(
                    LucideIcons.camera,
                    color: context.colors.textTertiary,
                    size: 32,
                  )
                : null,
          ),
        );
      },
    );
  }
}

class _GenderSelector extends StatelessWidget {
  const _GenderSelector();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s8,
      children: [
        Text(
          context.l10n.gender,
          style: context.typography.medium12.primary(context),
        ),
        BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (prev, curr) => prev.gender != curr.gender,
          builder: (context, state) {
            return Row(
              spacing: context.spacing.s16,
              children: Gender.values.map((gender) {
                final isSelected = state.gender == gender;
                return Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        context.read<RegisterCubit>().genderChanged(gender),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: context.spacing.s12,
                      ),
                      decoration: ShapeDecoration(
                        color: isSelected
                            ? context.colors.signatureBlue
                            : context.colors.backgroundTwo,
                        shape: RoundedSuperellipseBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: isSelected
                                ? context.colors.signatureBlue
                                : context.colors.strokePrimary,
                          ),
                        ),
                      ),
                      child: Text(
                        gender.displayName(context),
                        textAlign: .center,
                        style: isSelected
                            ? context.typography.medium14.inverse(context)
                            : context.typography.medium14.primary(context),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _BirthdatePicker extends StatelessWidget {
  const _BirthdatePicker();

  Future<void> _selectDate(BuildContext context) async {
    final cubit = context.read<RegisterCubit>();
    final initialDate =
        cubit.state.birthdate ??
        DateTime.now().subtract(const Duration(days: 365 * 18));
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && context.mounted) {
      cubit.birthdateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s8,
      children: [
        Text(
          context.l10n.birthdate,
          style: context.typography.medium12.primary(context),
        ),
        BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (prev, curr) => prev.birthdate != curr.birthdate,
          builder: (context, state) {
            return GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: context.spacing.s12,
                  vertical: context.spacing.s12,
                ),
                decoration: ShapeDecoration(
                  color: context.colors.backgroundTwo,
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: context.colors.strokePrimary),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.calendar,
                      color: context.colors.textSecondary,
                      size: 20,
                    ),
                    SizedBox(width: context.spacing.s8),
                    Text(
                      state.birthdate != null
                          ? DateFormat('MMM dd, yyyy').format(state.birthdate!)
                          : context.l10n.birthdateHint,
                      style: state.birthdate != null
                          ? context.typography.medium12.primary(context)
                          : context.typography.medium12.tertiary(context),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _NationalityDropdown extends StatelessWidget {
  const _NationalityDropdown();

  Future<void> _selectCountry(BuildContext context) async {
    final cubit = context.read<RegisterCubit>();
    final country = await showModalBottomSheet<WorldCountry>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colors.backgroundWhite,
      shape: RoundedSuperellipseBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.spacing.s24),
        ),
      ),
      builder: (context) =>
          _CountrySelectorSheet(selectedCountry: cubit.state.selectedCountry),
    );
    if (country != null && context.mounted) {
      cubit.countryChanged(country);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s8,
      children: [
        Text(
          context.l10n.nationality,
          style: context.typography.medium12.primary(context),
        ),
        BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (prev, curr) =>
              prev.selectedCountry != curr.selectedCountry,
          builder: (context, state) {
            return GestureDetector(
              onTap: () => _selectCountry(context),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: context.spacing.s12,
                  vertical: context.spacing.s12,
                ),
                decoration: ShapeDecoration(
                  color: context.colors.backgroundTwo,
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: context.colors.strokePrimary),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.globe,
                      color: context.colors.textSecondary,
                      size: 20,
                    ),
                    SizedBox(width: context.spacing.s8),
                    Expanded(
                      child: Text(
                        state.selectedCountry?.name.common ??
                            context.l10n.nationalityHint,
                        style: state.selectedCountry != null
                            ? context.typography.medium12.primary(context)
                            : context.typography.medium12.tertiary(context),
                      ),
                    ),
                    Icon(
                      LucideIcons.chevronDown,
                      color: context.colors.textTertiary,
                      size: 20,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Custom bottom sheet for country selection with search functionality.
class _CountrySelectorSheet extends StatefulWidget {
  const _CountrySelectorSheet({this.selectedCountry});

  final WorldCountry? selectedCountry;

  @override
  State<_CountrySelectorSheet> createState() => _CountrySelectorSheetState();
}

class _CountrySelectorSheetState extends State<_CountrySelectorSheet> {
  final _searchController = TextEditingController();
  late List<WorldCountry> _filteredCountries;

  static const _allCountries = WorldCountry.list;

  @override
  void initState() {
    super.initState();
    _filteredCountries = _allCountries;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = _allCountries;
      } else {
        final lowerQuery = query.toLowerCase();
        _filteredCountries = _allCountries.where((country) {
          return country.name.common.toLowerCase().contains(lowerQuery) ||
              country.name.official.toLowerCase().contains(lowerQuery) ||
              country.code.toLowerCase().contains(lowerQuery);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Column(
          children: [
            // Handle bar
            Container(
              margin: EdgeInsets.only(top: context.spacing.s12),
              width: 40,
              height: 4,
              decoration: ShapeDecoration(
                color: context.colors.strokeSecondary,
                shape: const StadiumBorder(),
              ),
            ),
            // Header
            Padding(
              padding: EdgeInsets.all(context.spacing.s16),
              child: Text(
                context.l10n.selectCountry,
                style: context.typography.bold18.primary(context),
              ),
            ),
            // Search field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
              child: MainTextField(
                controller: _searchController,
                hintText: context.l10n.searchCountry,
                prefixIcon: LucideIcons.search,
                onChanged: _onSearchChanged,
              ),
            ),
            SizedBox(height: context.spacing.s16),
            // Countries list
            Expanded(
              child: _filteredCountries.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: .center,
                        children: [
                          Icon(
                            LucideIcons.searchX,
                            size: 48,
                            color: context.colors.textTertiary,
                          ),
                          SizedBox(height: context.spacing.s12),
                          Text(
                            context.l10n.noCountriesFound,
                            style: context.typography.medium14.tertiary(
                              context,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.s16,
                      ),
                      itemCount: _filteredCountries.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: context.spacing.s8),
                      itemBuilder: (context, index) {
                        final country = _filteredCountries[index];
                        final isSelected =
                            widget.selectedCountry?.code == country.code;

                        return _CountryTile(
                          country: country,
                          isSelected: isSelected,
                          onTap: () => Navigator.of(context).pop(country),
                        );
                      },
                    ),
            ),
            SizedBox(height: context.spacing.s16),
          ],
        );
      },
    );
  }
}

/// A tile widget representing a single country in the list.
class _CountryTile extends StatelessWidget {
  const _CountryTile({
    required this.country,
    required this.isSelected,
    required this.onTap,
  });

  final WorldCountry country;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing.s12,
            vertical: context.spacing.s12,
          ),
          decoration: ShapeDecoration(
            color: isSelected
                ? context.colors.signatureBlueSecondary
                : context.colors.backgroundTwo,
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: isSelected
                    ? context.colors.signatureBlue
                    : context.colors.strokePrimary,
              ),
            ),
          ),
          child: Row(
            children: [
              // Flag emoji
              Text(country.emoji, style: const TextStyle(fontSize: 24)),
              SizedBox(width: context.spacing.s12),
              // Country name and code
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      country.name.common,
                      style: isSelected
                          ? context.typography.medium14.brand(context)
                          : context.typography.medium14.primary(context),
                    ),
                    Text(
                      country.code,
                      style: context.typography.book12.tertiary(context),
                    ),
                  ],
                ),
              ),
              // Check icon for selected
              if (isSelected)
                Icon(
                  LucideIcons.check,
                  color: context.colors.signatureBlue,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField();

  @override
  Widget build(BuildContext context) {
    return MainTextField(
      labelText: context.l10n.phone,
      hintText: context.l10n.phoneHint,
      prefixIcon: LucideIcons.phone,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      onChanged: context.read<RegisterCubit>().phoneChanged,
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, curr) => prev.isStep2Valid != curr.isStep2Valid,
      builder: (context, state) {
        return MainButton(
          text: context.l10n.next,
          isDisabled: !state.isStep2Valid,
          onPressed: () {
            context.read<RegisterCubit>()
              ..sendOtp()
              ..nextPage();
          },
        );
      },
    );
  }
}
