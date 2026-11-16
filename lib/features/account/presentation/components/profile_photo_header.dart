import 'dart:io';

import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/authentication/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import '../cubit/cubit.dart';

/// The user's photo, name and email at the top of Account Information. The
/// camera badge picks a new photo from the gallery and uploads it at once.
class ProfilePhotoHeader extends StatelessWidget {
  const ProfilePhotoHeader({super.key, required this.user});

  final UserEntity user;

  static const double photoSize = 104;
  static const double ringWidth = 4;
  static const double outerSize = photoSize + ringWidth * 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.s4,
      children: [
        AsyncHandler<AccountInfoCubit, AccountInfoState, ProfileEntity>.loadingDependent(
          requestManagerGetter: (cubit) => cubit.imageManager,
          onSuccess: (context, profile) {
            context.read<ProfileCubit>().replaceProfile(profile);
            context.showSuccessSnackBar(context.l10n.accountInfo_photoUpdated);
          },
          onError: (context, failure) => context.showErrorSnackBar(failure.message),
          builder: (context, isUploading) => _Photo(user: user, isUploading: isUploading),
        ),
        SizedBox(height: context.spacing.s8),
        Text(
          user.name,
          style: context.typography.bold20.primary(context),
          textAlign: .center,
        ),
        Text(
          user.email,
          style: context.typography.book14.secondary(context),
          textAlign: .center,
        ),
      ],
    );
  }
}

class _Photo extends StatelessWidget {
  const _Photo({required this.user, required this.isUploading});

  final UserEntity user;
  final bool isUploading;

  Future<void> _pick(BuildContext context) async {
    final cubit = context.read<AccountInfoCubit>();
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (picked == null) return;
    await cubit.changeImage(File(picked.path));
  }

  @override
  Widget build(BuildContext context) {
    const size = ProfilePhotoHeader.photoSize;

    return SizedBox.square(
      dimension: ProfilePhotoHeader.outerSize,
      child: Stack(
        children: [
          Container(
            width: ProfilePhotoHeader.outerSize,
            height: ProfilePhotoHeader.outerSize,
            padding: const EdgeInsets.all(ProfilePhotoHeader.ringWidth),
            decoration: ShapeDecoration(
              color: context.colors.backgroundWhite,
              shape: CircleBorder(side: BorderSide(color: context.colors.strokePrimary)),
              shadows: context.shadows.sm,
            ),
            child: Stack(
              fit: .expand,
              children: [
                ShimmerImage(
                  imageUrl: user.image,
                  width: size,
                  height: size,
                  borderRadius: size / 2,
                  fallback: ImageFallback.person(user.name),
                ),
                IgnorePointer(
                  child: AnimatedOpacity(
                    opacity: isUploading ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                        color: context.colors.signatureBlue.withValues(alpha: 0.5),
                        shape: const CircleBorder(),
                      ),
                      child: Center(
                        child: SizedBox.square(
                          dimension: 28,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: context.colors.textWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            end: 0,
            bottom: 0,
            child: Semantics(
              label: context.l10n.accountInfo_changePhoto,
              button: true,
              child: CircularButton(
                icon: SolarIconsOutline.camera,
                size: 36,
                iconSize: 18,
                backgroundColor: context.colors.signatureBlue,
                iconColor: context.colors.textWhite,
                isDisabled: isUploading,
                onPressed: isUploading ? null : () => _pick(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Placeholder for [ProfilePhotoHeader] while the profile loads.
class ProfilePhotoHeaderSkeleton extends StatelessWidget {
  const ProfilePhotoHeaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.s4,
      children: [
        const SkeletonCircle(size: ProfilePhotoHeader.outerSize),
        SizedBox(height: context.spacing.s8),
        SkeletonText(
          style: context.typography.bold20,
          width: 160,
          alignment: AlignmentDirectional.center,
        ),
        SkeletonText(
          style: context.typography.book14,
          width: 200,
          alignment: AlignmentDirectional.center,
        ),
      ],
    );
  }
}
