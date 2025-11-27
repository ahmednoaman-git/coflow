import 'package:cached_network_image/cached_network_image.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/core/presentation/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShimmerImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final Duration fadeInDuration;
  final bool shouldFadeIn;
  final Duration shimmerDuration;
  final void Function(ImageProvider)? onImageLoaded;
  final Widget? errorWidget;

  const ShimmerImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.fit = BoxFit.cover,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.shouldFadeIn = true,
    this.shimmerDuration = const Duration(milliseconds: 1000),
    this.onImageLoaded,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRSuperellipse(
      borderRadius: BorderRadius.circular(borderRadius),
      child: imageUrl == null
          ? _buildErrorWidget(context)
          : CachedNetworkImage(
              imageUrl: imageUrl!,
              width: width,
              height: height,
              fit: fit,
              placeholder: (context, url) => _buildShimmerPlaceholder(context),
              imageBuilder: (context, imageProvider) {
                onImageLoaded?.call(imageProvider);
                return _buildImageWithFadeIn(imageProvider);
              },
              errorWidget: (context, url, error) => _buildErrorWidget(context),
            ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return errorWidget ??
        Icon(
          Icons.no_photography_rounded,
          size: 24,
          color: context.colors.backgroundGrey,
        );
  }

  Widget _buildShimmerPlaceholder(BuildContext context) {
    return Shimmer(
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: context.colors.backgroundTwo,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }

  Widget _buildImageWithFadeIn(ImageProvider imageProvider) {
    return Animate(
      effects: [if (shouldFadeIn) FadeEffect(duration: fadeInDuration)],
      child: Image(
        image: imageProvider,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
