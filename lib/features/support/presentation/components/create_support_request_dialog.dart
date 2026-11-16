import 'dart:io';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solar_icons/solar_icons.dart';

import '../cubit/support_requests_cubit.dart';
import '../cubit/support_requests_state.dart';

/// "Something doesn't look right?": the issue text and an optional image.
/// Closes itself once the request is sent.
class CreateSupportRequestDialog extends StatefulWidget {
  const CreateSupportRequestDialog({super.key});

  /// Shown on the root navigator, so the cubit is handed over explicitly.
  static Future<void> show(BuildContext context) {
    final cubit = context.read<SupportRequestsCubit>();
    cubit.createManager.reset();
    return showDialog<void>(
      context: context,
      builder: (_) => BlocProvider.value(value: cubit, child: const CreateSupportRequestDialog()),
    );
  }

  /// Shorter texts can't describe a problem; the server sets no minimum.
  static const int minLength = 10;

  @override
  State<CreateSupportRequestDialog> createState() => _CreateSupportRequestDialogState();
}

class _CreateSupportRequestDialogState extends State<CreateSupportRequestDialog> {
  final _formKey = GlobalKey<FormState>();
  final _issue = TextEditingController();
  File? _image;

  @override
  void dispose() {
    _issue.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,
      maxHeight: 1600,
      imageQuality: 85,
    );
    if (picked == null || !mounted) return;
    setState(() => _image = File(picked.path));
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<SupportRequestsCubit>().create(issue: _issue.text, image: _image);
  }

  String? _validate(String? value) {
    final length = value?.trim().length ?? 0;
    if (length == 0) return context.l10n.support_issueRequired;
    if (length < CreateSupportRequestDialog.minLength) {
      return context.l10n.support_issueTooShort(CreateSupportRequestDialog.minLength);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Dialog(
      insetPadding: EdgeInsets.all(context.spacing.s24),
      backgroundColor: context.colors.backgroundWhite,
      shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(24)),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: .stretch,
            mainAxisSize: .min,
            spacing: context.spacing.s16,
            children: [
              Column(
                crossAxisAlignment: .start,
                spacing: context.spacing.s4,
                children: [
                  Text(l10n.support_createTitle, style: context.typography.bold20.primary(context)),
                  Text(
                    l10n.support_createSubtitle,
                    style: context.typography.book14.secondary(context),
                  ),
                ],
              ),
              MainTextField(
                controller: _issue,
                hintText: l10n.support_issueHint,
                minLines: 4,
                maxLines: 8,
                keyboardType: .multiline,
                validator: _validate,
              ),
              Text.rich(
                TextSpan(
                  text: l10n.support_uploadImage,
                  style: context.typography.medium14.primary(context),
                  children: [
                    TextSpan(
                      text: ' (${l10n.support_optional})',
                      style: context.typography.book14.tertiary(context),
                    ),
                  ],
                ),
              ),
              _ImageField(
                image: _image,
                onPick: _pickImage,
                onRemove: () => setState(() => _image = null),
              ),
              AsyncHandler<SupportRequestsCubit, SupportRequestsState, void>.loadingDependent(
                requestManagerGetter: (cubit) => cubit.createManager,
                onSuccess: (context, _) {
                  Navigator.of(context).pop();
                  context.showSuccessSnackBar(l10n.support_created);
                },
                onError: (context, failure) => context.showErrorSnackBar(failure.message),
                builder: (context, isLoading) => MainButton(
                  text: l10n.support_submit,
                  height: 48,
                  isLoading: isLoading,
                  onPressed: isLoading ? null : _submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The upload box: an upload tile until an image is picked, then its preview
/// with a button to drop it.
class _ImageField extends StatelessWidget {
  const _ImageField({required this.image, required this.onPick, required this.onRemove});

  final File? image;
  final VoidCallback onPick;
  final VoidCallback onRemove;

  static const double height = 96;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(context.spacing.s12);
    final image = this.image;

    return TappableScale(
      borderRadius: radius,
      onTap: onPick,
      child: Container(
        height: image == null ? height : height * 1.6,
        decoration: ShapeDecoration(
          color: context.colors.backgroundTwo,
          shape: RoundedSuperellipseBorder(
            borderRadius: radius,
            side: BorderSide(color: context.colors.strokeSecondary),
          ),
        ),
        child: image == null
            ? Center(
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: ShapeDecoration(
                    color: context.colors.earthSunnyGoldSecondary,
                    shape: RoundedSuperellipseBorder(
                      borderRadius: BorderRadius.circular(context.spacing.s8),
                    ),
                  ),
                  child: Icon(
                    SolarIconsOutline.upload,
                    color: context.colors.earthSunnyGoldPrimary,
                    size: 24,
                  ),
                ),
              )
            : ClipRSuperellipse(
                borderRadius: radius,
                child: Stack(
                  fit: .expand,
                  children: [
                    Image.file(image, fit: BoxFit.cover),
                    PositionedDirectional(
                      top: context.spacing.s8,
                      end: context.spacing.s8,
                      child: CircularButton(
                        icon: SolarIconsOutline.trashBinMinimalistic,
                        size: 36,
                        iconSize: 18,
                        backgroundColor: context.colors.signatureBlue.withValues(alpha: 0.6),
                        iconColor: context.colors.textWhite,
                        onPressed: onRemove,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
