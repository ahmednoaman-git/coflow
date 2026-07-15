import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import 'ticket_notch_divider.dart';
import 'ticket_shape_border.dart';

/// A ticket-shaped card: a single rounded-superellipse surface with a
/// perforated tear line separating [topChildren] from [bottomChildren].
///
/// The whole card is one component — the semicircular notches at the tear line
/// are cut out of the shape itself (see [TicketShapeBorder]), so they are
/// transparent to whatever is behind the card and the shadow follows their
/// curves. The tear line's vertical position is measured after layout so the
/// notches always line up with the dashed divider, regardless of how much
/// content sits above it.
class TicketCard extends StatefulWidget {
  const TicketCard({super.key, required this.topChildren, required this.bottomChildren});

  final List<Widget> topChildren;
  final List<Widget> bottomChildren;

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  final _cardKey = GlobalKey();
  final _notchKey = GlobalKey();

  double? _notchCenterY;

  @override
  void initState() {
    super.initState();
    _scheduleMeasure();
  }

  @override
  void didUpdateWidget(covariant TicketCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Content above the tear line can change height (e.g. add-ons, coupons),
    // so remeasure on every rebuild.
    _scheduleMeasure();
  }

  void _scheduleMeasure() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final cardBox = _cardKey.currentContext?.findRenderObject() as RenderBox?;
      final notchBox = _notchKey.currentContext?.findRenderObject() as RenderBox?;
      if (cardBox == null || notchBox == null || !cardBox.attached || !notchBox.attached) {
        return;
      }

      final notchTop = notchBox.localToGlobal(Offset.zero, ancestor: cardBox).dy;
      final centerY = notchTop + notchBox.size.height / 2;
      if (_notchCenterY != centerY) {
        setState(() => _notchCenterY = centerY);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _cardKey,
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: TicketShapeBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: context.colors.strokePrimary),
          notchRadius: TicketNotchDivider.notchRadius,
          notchCenterY: _notchCenterY,
        ),
        shadows: context.shadows.md,
      ),
      child: Column(
        children: [
          ...widget.topChildren,
          TicketNotchDivider(key: _notchKey),
          ...widget.bottomChildren,
        ],
      ),
    );
  }
}
