import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onComplete: (controller) {
        controller.reset();
        controller.forward();
      },
      effects: [
        ShimmerEffect(
          duration: const Duration(milliseconds: 1000),
          color: context.colors.backgroundGrey,
        ),
      ],
      child: child,
    );
  }
}
