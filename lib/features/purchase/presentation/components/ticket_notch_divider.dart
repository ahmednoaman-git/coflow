import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// The dashed tear line drawn across a [TicketCard], sized to span the gap
/// between the two semicircular notches cut into the card's edges.
///
/// This widget only paints the perforation dashes. The notches themselves are
/// part of the card's [TicketShapeBorder] — transparent bites out of the shape,
/// not opaque circles painted here — so nothing needs to match the background.
class TicketNotchDivider extends StatelessWidget {
  const TicketNotchDivider({super.key});

  /// Radius of the semicircular notches cut into the card edges at this line.
  /// Shared with [TicketShapeBorder] so the dashes and the notches align.
  static const double notchRadius = 16;
  static const double _height = notchRadius * 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _height,
      child: CustomPaint(
        painter: _TicketDashPainter(
          dashColor: context.colors.strokeSecondary,
          inset: notchRadius * 2,
        ),
      ),
    );
  }
}

class _TicketDashPainter extends CustomPainter {
  const _TicketDashPainter({required this.dashColor, required this.inset});

  final Color dashColor;

  /// Horizontal padding on each side so dashes clear the notches.
  final double inset;

  @override
  void paint(Canvas canvas, Size size) {
    final centerY = size.height / 2;
    final dashPaint = Paint()
      ..color = dashColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    const dashWidth = 14.0;
    const dashSpace = 10.0;
    final startX = inset;
    final endX = size.width - inset;

    var x = startX;
    while (x < endX) {
      final segmentEnd = (x + dashWidth).clamp(startX, endX);
      canvas.drawLine(Offset(x, centerY), Offset(segmentEnd, centerY), dashPaint);
      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _TicketDashPainter oldDelegate) {
    return dashColor != oldDelegate.dashColor || inset != oldDelegate.inset;
  }
}
