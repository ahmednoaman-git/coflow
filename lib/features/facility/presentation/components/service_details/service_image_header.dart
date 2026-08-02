import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The service details image header. Renders a single image, or a
/// swipeable [PageView] with a dot indicator when there is more than one.
class ServiceImageHeader extends StatefulWidget {
  const ServiceImageHeader({super.key, required this.imageUrls});

  final List<String> imageUrls;

  @override
  State<ServiceImageHeader> createState() => _ServiceImageHeaderState();
}

class _ServiceImageHeaderState extends State<ServiceImageHeader> {
  final PageController _pageController = PageController();
  int _page = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageUrls = widget.imageUrls.isEmpty ? const <String?>[null] : widget.imageUrls;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (page) => setState(() => _page = page),
            children: [
              for (final url in imageUrls) ShimmerImage(imageUrl: url, fit: BoxFit.cover),
            ],
          ),
          if (imageUrls.length > 1)
            Positioned(
              bottom: context.spacing.s16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: .center,
                spacing: context.spacing.s4,
                children: [
                  for (var i = 0; i < imageUrls.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: i == _page ? 20 : 6,
                      height: 6,
                      decoration: ShapeDecoration(
                        color: Colors.white.withValues(alpha: i == _page ? 1 : 0.5),
                        shape: const StadiumBorder(),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
