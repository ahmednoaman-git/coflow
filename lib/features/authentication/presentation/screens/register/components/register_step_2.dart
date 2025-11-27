import 'dart:io';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../domain/entities/entities.dart';
import '../../../state/state.dart';

/// Step 2: Profile details (image, gender, birthdate, nationality, phone).
class RegisterStep2 extends StatelessWidget {
  const RegisterStep2({super.key});

  @override
  Widget build(BuildContext context) {
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
                        gender.displayName,
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
        AsyncHandler<RegisterCubit, RegisterState, List<String>>(
          requestManagerGetter: (cubit) => cubit.nationalitiesManager,
          loadingBuilder: (context) => Container(
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
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.colors.signatureBlue,
                  ),
                ),
                SizedBox(width: context.spacing.s8),
                Text(
                  context.l10n.loading,
                  style: context.typography.medium12.tertiary(context),
                ),
              ],
            ),
          ),
          successBuilder: (context, nationalities) {
            return BlocBuilder<RegisterCubit, RegisterState>(
              buildWhen: (prev, curr) => prev.nationality != curr.nationality,
              builder: (context, state) {
                return DropdownButtonFormField<String>(
                  value: state.nationality,
                  hint: Text(
                    context.l10n.nationalityHint,
                    style: context.typography.medium12.tertiary(context),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      LucideIcons.globe,
                      color: context.colors.textSecondary,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: context.colors.backgroundTwo,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: context.spacing.s8,
                      vertical: context.spacing.s12,
                    ),
                    border: RoundedSuperellipseInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: context.colors.strokePrimary,
                      ),
                    ),
                    enabledBorder: RoundedSuperellipseInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: context.colors.strokePrimary,
                      ),
                    ),
                    focusedBorder: RoundedSuperellipseInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: context.colors.strokeSecondary,
                      ),
                    ),
                  ),
                  style: context.typography.medium12.primary(context),
                  items: nationalities
                      .map((n) => DropdownMenuItem(value: n, child: Text(n)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<RegisterCubit>().nationalityChanged(value);
                    }
                  },
                );
              },
            );
          },
          onRetry: (cubit) => cubit.nationalitiesManager.refresh(),
        ),
      ],
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
