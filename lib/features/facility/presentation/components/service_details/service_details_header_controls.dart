import 'package:flutter/material.dart';

/// Back button overlay for the service details screen, mirroring
/// [FacilityHeaderControls]'s back button styling.
class ServiceDetailsHeaderControls extends StatelessWidget {
  const ServiceDetailsHeaderControls({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return Positioned(
      top: topPadding + 12,
      left: 12,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.3),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}
