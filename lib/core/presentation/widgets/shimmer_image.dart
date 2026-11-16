import 'package:cached_network_image/cached_network_image.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A network image with a skeleton bone while it loads, fading in once it
/// arrives.
///
/// Images are cached in memory and on disk by [CachedNetworkImage], so a URL is
/// only ever downloaded once. On top of that, the bone and the fade play only
/// the first time a URL shows in this run of the app: when it mounts again —
/// scrolled back into view, a tab revisited, the list rebuilt by a refresh —
/// the image is simply there, rather than looking like it loads all over again.
///
/// When there is no URL, or the image fails to load, it shows [fallback] — a
/// designed placeholder picked to suit the image (a cover, a person's photo,
/// a business logo, an icon) — in exactly the same box, clipped to the same
/// corners. [errorBuilder] replaces that placeholder entirely for the rare
/// slot that needs something bespoke.
class ShimmerImage extends StatefulWidget {
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

  /// URLs that have already been on screen in this run of the app.
  static final Set<String> _shown = {};

  @override
  State<ShimmerImage> createState() => _ShimmerImageState();
}

class _ShimmerImageState extends State<ShimmerImage> {
  /// Whether this mount has to reveal the image — decided once per URL, so a
  /// rebuild mid-fade doesn't cut the fade short.
  late bool _reveal;

  String? get _url {
    final url = widget.imageUrl?.trim();
    return url == null || url.isEmpty ? null : url;
  }

  @override
  void initState() {
    super.initState();
    _reveal = !ShimmerImage._shown.contains(_url);
  }

  @override
  void didUpdateWidget(ShimmerImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _reveal = !ShimmerImage._shown.contains(_url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final url = _url;

    return ClipRSuperellipse(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: url == null
          ? _buildFallback(context)
          : CachedNetworkImage(
              imageUrl: url,
              width: widget.width,
              height: widget.height,
              fit: widget.fit,
              // A seen image is usually still in memory and shows on the
              // first frame. If it was evicted, it's back from disk within a
              // frame or two — not worth flashing a bone and fading over.
              fadeInDuration: _reveal ? const Duration(milliseconds: 500) : Duration.zero,
              fadeOutDuration: _reveal ? const Duration(milliseconds: 1000) : Duration.zero,
              placeholder: (context, url) => _reveal
                  ? _buildShimmerPlaceholder(context)
                  : SizedBox(width: widget.width, height: widget.height),
              imageBuilder: (context, imageProvider) {
                ShimmerImage._shown.add(url);
                widget.onImageLoaded?.call(imageProvider);
                return _buildImageWithFadeIn(imageProvider);
              },
              errorWidget: (context, url, error) => _buildFallback(context),
            ),
    );
  }

  /// The placeholder for a missing or failed image, in the image's own box.
  Widget _buildFallback(BuildContext context) {
    if (widget.errorBuilder case final builder?) {
      return SizedBox(width: widget.width, height: widget.height, child: builder(context));
    }
    return ImageFallbackView(fallback: widget.fallback, width: widget.width, height: widget.height);
  }

  /// A bone the size and shape of the image, sweeping in step with any
  /// skeleton around it.
  Widget _buildShimmerPlaceholder(BuildContext context) => Skeleton(
    child: SkeletonBox(width: widget.width, height: widget.height, radius: widget.borderRadius),
  );

  Widget _buildImageWithFadeIn(ImageProvider imageProvider) {
    return Animate(
      effects: [
        if (widget.shouldFadeIn && _reveal) FadeEffect(duration: widget.fadeInDuration),
      ],
      child: Image(
        image: imageProvider,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
        // Keeps the last frame up if the provider is swapped mid-life.
        gaplessPlayback: true,
      ),
    );
  }
}
