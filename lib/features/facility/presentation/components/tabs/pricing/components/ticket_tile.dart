import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../facility_data_provider.dart';
import 'facility_tickets.dart';
import 'ticket_details_bottom_sheet.dart';

class TicketTile extends StatelessWidget {
  const TicketTile({super.key, required this.ticket, required this.size});

  final FacilityTicketEntity ticket;
  final Size size;

  @override
  Widget build(BuildContext context) {
    const middleSectionWidth = 14.0;
    final iconBoxWidth = FacilityTicketsList.ticketHeight;
    final facilityData = FacilityDataProvider.of(context);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (sheetContext) => BlocProvider<TicketDetailsCubit>(
            create: (_) => getIt<TicketDetailsCubit>(param1: ticket.id),
            child: FacilityDataProvider.fromFacilityDataProvider(
              facilityDataProvider: facilityData,
              child: TicketDetailsBottomSheet(ticketId: ticket.id),
            ),
          ),
        );
      },
      child: CustomPaint(
        size: size,
        painter: TicketPainter(
          context: context,
          iconBoxWidth: iconBoxWidth,
          middleSectionWidth: middleSectionWidth,
        ),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Row(
            children: [
              SizedBox(
                width: iconBoxWidth,
                height: size.height,
                child: Center(
                  child: Assets.svgs.ticket.svg(
                    colorFilter: facilityData.activityLineColor.colorFilter,
                  ),
                ),
              ),
              const SizedBox(width: middleSectionWidth),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(context.spacing.s16),
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        ticket.name,
                        style: context.typography.medium14.primary(context),
                      ),
                      Text(
                        context.l10n.facilityDetails_accessPrefix(ticket.servicesCount),
                        style: context.typography.book12.secondary(context),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            context.l10n.facilityDetails_ticketPrice,
                            style: context.typography.medium14.primary(context),
                          ),
                          const Spacer(),
                          _getPrice(context, facilityData),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPrice(BuildContext context, FacilityDataProvider facilityData) {
    if (ticket.discountPrice == null) {
      return Text(
        '${ticket.currency} ${ticket.originalPrice}',
        style: context.typography.medium14
            .primary(context)
            .copyWith(
              color: facilityData.activityLineColor,
            ),
      );
    }

    return Row(
      spacing: context.spacing.s8,
      children: [
        Text(
          '${ticket.currency} ${ticket.discountPrice}',
          style: context.typography.medium14
              .primary(context)
              .copyWith(
                color: facilityData.activityLineColor,
              ),
        ),
        Text(
          ticket.originalPrice.toString(),
          style: context.typography.book12
              .primary(context)
              .copyWith(
                color: facilityData.activityLineColor,
                decoration: TextDecoration.lineThrough,
              ),
        ),
      ],
    );
  }
}

class TicketPainter extends CustomPainter {
  final BuildContext context;
  final double iconBoxWidth;
  final double middleSectionWidth;

  const TicketPainter({
    required this.context,
    required this.iconBoxWidth,
    required this.middleSectionWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _paintTicket(canvas, size);
    _paintDashedSeparator(canvas, size);
  }

  void _paintTicket(Canvas canvas, Size size) {
    final colors = context.colors;

    final Paint paint = Paint()
      ..color = colors.backgroundWhite
      ..style = PaintingStyle.fill;

    final Path path = _buildTicketPath(size);

    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.2), 8.0, false);
    canvas.drawPath(path, paint);

    paint
      ..color = colors.strokePrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawPath(path, paint);
  }

  void _paintDashedSeparator(Canvas canvas, Size size) {
    final colors = context.colors;

    final Paint dashedLinePaint = Paint()
      ..color = colors.strokeSecondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    const dashSpace = 4.0;
    const dashCount = 8;
    const dashLineVerticalPadding = 4.0;
    final dashLineHeight = size.height - middleSectionWidth - dashLineVerticalPadding * 2;
    final dashWidth = (dashLineHeight - dashSpace * (dashCount - 1)) / dashCount;
    final dashLineStart = Offset(
      iconBoxWidth + middleSectionWidth / 2,
      middleSectionWidth / 2 + dashLineVerticalPadding,
    );
    final dashLineEnd = Offset(
      iconBoxWidth + middleSectionWidth / 2,
      size.height - middleSectionWidth / 2 - dashLineVerticalPadding,
    );

    for (var i = 0; i < dashCount; i++) {
      final start = Offset(
        dashLineStart.dx,
        dashLineStart.dy + i * (dashWidth + dashSpace),
      );
      final end = Offset(
        dashLineEnd.dx,
        dashLineStart.dy + i * (dashWidth + dashSpace) + dashWidth,
      );
      canvas.drawLine(start, end, dashedLinePaint);
    }
  }

  Path _buildTicketPath(Size size) {
    final path = Path();
    const leftSideCornerRadius = 2.0;
    const rightSideCornerRadius = 12.0;

    final width = size.width;
    final height = size.height;

    // Define where each section starts horizontally
    final middleSectionStart = iconBoxWidth;
    final contentBoxStart = iconBoxWidth + middleSectionWidth;

    // Start with top-left corner of icon box
    path.moveTo(leftSideCornerRadius, 0);
    path.lineTo(middleSectionStart, 0); // Top edge of icon box

    // Middle section (top)
    // Draw a semicircular notch at the middle section
    path.arcToPoint(
      Offset(contentBoxStart, 0),
      radius: Radius.circular(middleSectionWidth / 2),
      largeArc: true,
      clockwise: false,
    );

    // Content box (top edge) to top-right corner
    path.lineTo(width - rightSideCornerRadius, 0);
    path.arcToPoint(
      Offset(width, rightSideCornerRadius),
      radius: const Radius.circular(rightSideCornerRadius),
      clockwise: true,
    );

    // Right edge of content box
    path.lineTo(width, height - rightSideCornerRadius);
    path.arcToPoint(
      Offset(width - rightSideCornerRadius, height),
      radius: const Radius.circular(rightSideCornerRadius),
      clockwise: true,
    );

    // Bottom edge of content box
    path.lineTo(contentBoxStart, height);

    // Middle section (bottom)
    // Draw a semicircular notch at the middle section
    path.arcToPoint(
      Offset(middleSectionStart, height),
      radius: Radius.circular(middleSectionWidth / 2),
      largeArc: true,
      clockwise: false,
    );

    // Icon box (bottom edge) to bottom-left corner
    path.lineTo(leftSideCornerRadius, height);
    path.arcToPoint(
      Offset(0, height - leftSideCornerRadius),
      radius: const Radius.circular(leftSideCornerRadius),
      clockwise: true,
    );

    // Left edge of icon box
    path.lineTo(0, leftSideCornerRadius);
    path.arcToPoint(
      Offset(leftSideCornerRadius, 0),
      radius: const Radius.circular(leftSideCornerRadius),
      clockwise: true,
    );

    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant TicketPainter oldDelegate) {
    return false;
  }
}
