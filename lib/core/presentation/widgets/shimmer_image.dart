import 'package:cached_network_image/cached_network_image.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A network image with a skeleton bone while it loads, fading in once it
/// arrives.
///
/// When there is no URL, or the image fails to load, it shows [fallback] — a
/// designed placeholder picked to suit the image (a cover, a person's photo,
/// a business logo, an icon) — in exactly the same box, clipped to the same
/// corners. [errorBuilder] replaces that placeholder entirely for the rare
/// slot that needs something bespoke.
class ShimmerImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final Duration fadeInDuration;
  final bool shouldFadeIn;
  final void Function(ImageProvider)? onImageLoaded;

  /// What stands in for a missing or failed image. Defaults to a cover.
  final ImageFallback fallback;

  /// Overrides [fallback] with a custom widget. It is given the image's box.
  final WidgetBuilder? errorBuilder;

  const ShimmerImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.fit = BoxFit.cover,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.shouldFadeIn = true,
    this.onImageLoaded,
    this.fallback = const ImageFallback.cover(),
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final url = imageUrl?.trim();

    return ClipRSuperellipse(
      borderRadius: BorderRadius.circular(borderRadius),
      child: url == null || url.isEmpty
          ? _buildFallback(context)
          : CachedNetworkImage(
              imageUrl: url,
              width: width,
              height: height,
              fit: fit,
              placeholder: (context, url) => _buildShimmerPlaceholder(context),
              imageBuilder: (context, imageProvider) {
                onImageLoaded?.call(imageProvider);
                return _buildImageWithFadeIn(imageProvider);
              },
              errorWidget: (context, url, error) => _buildFallback(context),
            ),
    );
  }

  /// The placeholder for a missing or failed image, in the image's own box.
  Widget _buildFallback(BuildContext context) {
    if (errorBuilder case final builder?) {
      return SizedBox(width: width, height: height, child: builder(context));
    }
    return ImageFallbackView(fallback: fallback, width: width, height: height);
  }

  /// A bone the size and shape of the image, sweeping in step with any
  /// skeleton around it.
  Widget _buildShimmerPlaceholder(BuildContext context) => Skeleton(
    child: SkeletonBox(width: width, height: height, radius: borderRadius),
  );

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
