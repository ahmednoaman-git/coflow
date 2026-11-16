import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/authentication/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/domain.dart';
import '../cubit/cubit.dart';
import 'nationality_picker_sheet.dart';

/// The edit form for Account Information, filled from [user].
///
/// `POST profile` requires every field, so all of them are required here too
/// and the whole set is sent on save.
class EditAccountInformationForm extends StatefulWidget {
  const EditAccountInformationForm({super.key, required this.user});

  final UserEntity user;

  @override
  State<EditAccountInformationForm> createState() => _EditAccountInformationFormState();
}

class _EditAccountInformationFormState extends State<EditAccountInformationForm> {
  static final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  final _formKey = GlobalKey<FormState>();
  late final _name = TextEditingController(text: widget.user.name);
  late final _email = TextEditingController(text: widget.user.email);
  late final _phone = TextEditingController(text: widget.user.phone);
  final _birthdateLabel = TextEditingController();
  final _nationalityLabel = TextEditingController();

  late Gender _gender = widget.user.gender;
  late DateTime? _birthdate = DateTime.tryParse(widget.user.birthdate ?? '');

  /// A name from `GET nationalities`, sent back as it is.
  late String? _nationality = switch (widget.user.nationality?.trim()) {
    final value? when value.isNotEmpty => value,
    _ => null,
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncPickerLabels();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _birthdateLabel.dispose();
    _nationalityLabel.dispose();
    super.dispose();
  }

  void _syncPickerLabels() {
    final birthdate = _birthdate;
    _birthdateLabel.text = birthdate == null
        ? ''
        : DateFormat.yMMMMd(context.locale.toLanguageTag()).format(birthdate);

    final nationality = _nationality;
    _nationalityLabel.text = nationality == null ? '' : displayNationality(nationality);
  }

  Future<void> _pickBirthdate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthdate ?? DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked == null || !mounted) return;
    setState(() {
      _birthdate = picked;
      _syncPickerLabels();
    });
  }

  Future<void> _pickNationality() async {
    final picked = await NationalityPickerSheet.show(context, selected: _nationality);
    if (picked == null || !mounted) return;
    setState(() {
      _nationality = picked;
      _syncPickerLabels();
    });
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();

    context.read<AccountInfoCubit>().updateProfile(
      UpdateProfileDto(
        name: _name.text.trim(),
        email: _email.text.trim(),
        phone: _phone.text.trim(),
        birthdate: _birthdate!,
        gender: _gender,
        nationality: _nationality!,
      ),
    );
  }

  String? _required(String? value) =>
      (value == null || value.trim().isEmpty) ? context.l10n.accountInfo_fieldRequired : null;

  String? _validateEmail(String? value) {
    final required = _required(value);
    if (required != null) return required;
    return _emailPattern.hasMatch(value!.trim()) ? null : context.l10n.accountInfo_invalidEmail;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          context.spacing.s24,
          context.spacing.s24,
          context.spacing.s24,
          context.bottomInset + context.spacing.s24,
        ),
        keyboardDismissBehavior: .onDrag,
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: context.spacing.s16,
          children: [
            MainTextField(
              controller: _name,
              labelText: l10n.fullName,
              hintText: l10n.fullNameHint,
              prefixIcon: SolarIconsOutline.userRounded,
              textInputAction: .next,
              validator: _required,
            ),
            MainTextField(
              controller: _email,
              labelText: l10n.email,
              hintText: l10n.emailHint,
              prefixIcon: SolarIconsOutline.letter,
              keyboardType: .emailAddress,
              textInputAction: .next,
              validator: _validateEmail,
            ),
            MainTextField(
              controller: _phone,
              labelText: l10n.phone,
              hintText: l10n.phoneHint,
              prefixIcon: SolarIconsOutline.phone,
              keyboardType: .phone,
              textInputAction: .done,
              validator: _required,
            ),
            _GenderSelector(
              value: _gender,
              onChanged: (gender) => setState(() => _gender = gender),
            ),
            _PickerField(
              controller: _birthdateLabel,
              label: l10n.birthdate,
              hint: l10n.birthdateHint,
              icon: SolarIconsOutline.calendarMinimalistic,
              onTap: _pickBirthdate,
              validator: (_) => _birthdate == null ? l10n.accountInfo_fieldRequired : null,
            ),
            _PickerField(
              controller: _nationalityLabel,
              label: l10n.nationality,
              hint: l10n.nationalityHint,
              icon: SolarIconsOutline.globus,
              onTap: _pickNationality,
              validator: (_) => _nationality == null ? l10n.accountInfo_fieldRequired : null,
            ),
            SizedBox(height: context.spacing.s8),
            AsyncHandler<AccountInfoCubit, AccountInfoState, ProfileEntity>.loadingDependent(
              requestManagerGetter: (cubit) => cubit.updateManager,
              onSuccess: (context, profile) {
                context.read<ProfileCubit>().replaceProfile(profile);
                context.showSuccessSnackBar(context.l10n.accountInfo_saved);
                context.router.maybePop();
              },
              onError: (context, failure) => context.showErrorSnackBar(failure.message),
              builder: (context, isSaving) => MainButton(
                text: l10n.accountInfo_save,
                height: 48,
                isLoading: isSaving,
                onPressed: isSaving ? null : _submit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A read-only [MainTextField] that opens a picker, so pickers share the text
/// fields' look and show validation errors the same way.
class _PickerField extends StatelessWidget {
  const _PickerField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.onTap,
    required this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final VoidCallback onTap;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      onTap: onTap,
      scaleEnd: 0.98,
      child: AbsorbPointer(
        child: MainTextField(
          controller: controller,
          labelText: label,
          hintText: hint,
          prefixIcon: icon,
          suffixIcon: SolarIconsOutline.altArrowDown,
          readOnly: true,
          validator: validator,
        ),
      ),
    );
  }
}

class _GenderSelector extends StatelessWidget {
  const _GenderSelector({required this.value, required this.onChanged});

  final Gender value;
  final ValueChanged<Gender> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s8,
      children: [
        Text(context.l10n.gender, style: context.typography.medium12.primary(context)),
        Row(
          spacing: context.spacing.s12,
          children: [
            for (final gender in Gender.values)
              Expanded(
                child: _GenderOption(
                  gender: gender,
                  isSelected: gender == value,
                  onTap: () => onChanged(gender),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({required this.gender, required this.isSelected, required this.onTap});

  final Gender gender;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foreground = isSelected ? context.colors.textWhite : context.colors.textPrimary;

    return TappableScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(vertical: context.spacing.s12),
        decoration: ShapeDecoration(
          color: isSelected ? context.colors.signatureBlue : context.colors.backgroundTwo,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s12),
            side: BorderSide(
              color: isSelected ? context.colors.signatureBlue : context.colors.strokeSecondary,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: .center,
          spacing: context.spacing.s8,
          children: [
            Icon(
              gender == Gender.female ? SolarIconsOutline.women : SolarIconsOutline.men,
              size: 18,
              color: foreground,
            ),
            Text(
              gender.displayName(context),
              style: context.typography.medium14.withColor(foreground),
            ),
          ],
        ),
      ),
    );
  }
}
