import 'dart:ui';

import 'package:flutter/material.dart';

import '../facility_data_provider.dart';
import 'facility_header.dart';

class FacilityHeaderTopGradient extends StatelessWidget {
  const FacilityHeaderTopGradient({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final facilityDataProvider = FacilityDataProvider.of(context);

    final double gradientHeight = FacilityHeader.coverImageHeight + topPadding;

    final double colorConversionStart = gradientHeight * 0.5;
    final double colorConversionEnd = gradientHeight;

    return AnimatedBuilder(
      animation: facilityDataProvider.scrollController,
      builder: (context, child) {
        final double offset = facilityDataProvider.scrollController.offset;
        final double clampOffset = offset.clamp(
          colorConversionStart,
          colorConversionEnd,
        );

        final double progress =
            (clampOffset - colorConversionStart) /
            (colorConversionEnd - colorConversionStart);
        final double curvedProgress = Curves.easeOut.transform(progress);

        final color = Color.lerp(
          Colors.black,
          facilityDataProvider.activityLineColor,
          curvedProgress,
        )!;

        return Padding(
          padding: EdgeInsets.only(top: offset.clamp(0, double.infinity)),
          child: SizedBox(
            width: double.infinity,
            height: gradientHeight - offset.clamp(0, gradientHeight),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, lerpDouble(0.3, 1.0, curvedProgress)!],
                  colors: [
                    color.withValues(
                      alpha: lerpDouble(0.9, 1.0, curvedProgress)!,
                    ),
                    color.withValues(
                      alpha: lerpDouble(0.0, 1.0, curvedProgress)!,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
