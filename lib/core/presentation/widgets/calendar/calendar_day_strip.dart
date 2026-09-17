import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Horizontally scrollable day picker above a timeline.
///
/// Seven chips fit the viewport width — matching the design — and the rest of
/// the loaded window scrolls. Days with nothing on them are dimmed and cannot
/// be selected.
class CalendarDayStrip extends StatefulWidget {
  const CalendarDayStrip({
    super.key,
    required this.days,
    required this.selectedDay,
    required this.onDaySelected,
    required this.horizontalPadding,
    this.activeDays,
    this.showsDayNumber = true,
  });

  final List<DateTime> days;
  final DateTime selectedDay;
  final ValueChanged<DateTime> onDaySelected;

  /// Inset on both ends, applied **inside** the scroll view so the first and
  /// last chips clear the screen edge while the strip still scrolls
  /// edge to edge. Pass the host screen's own horizontal content padding so
  /// the chips line up with the timeline below.
  final double horizontalPadding;

  /// Days that have at least one entry. Null while the window is still
  /// loading — nothing is dimmed until we know.
  final Set<DateTime>? activeDays;

  /// Whether a chip carries its day of the month under the weekday.
  ///
  /// False for the facility Schedule tab: it renders a *recurring weekly
  /// cycle*, so a date on the chip would imply the slot only runs that week.
  final bool showsDayNumber;

  static const double _visibleChips = 7;
  static const double height = 72;

  @override
  State<CalendarDayStrip> createState() => _CalendarDayStripState();
}

class _CalendarDayStripState extends State<CalendarDayStrip> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _centerOnSelected());
  }

  @override
  void didUpdateWidget(CalendarDayStrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only a new selection or a new window re-centers — the day list is rebuilt
    // on every state change, so comparing its identity would fight the user's
    // own scrolling.
    final windowChanged =
        oldWidget.days.length != widget.days.length || oldWidget.days.first != widget.days.first;

    if (oldWidget.selectedDay != widget.selectedDay || windowChanged) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _centerOnSelected());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Keeps the selected chip in view after a window change.
  void _centerOnSelected() {
    if (!_controller.hasClients) return;

    final index = widget.days.indexOf(widget.selectedDay);
    if (index < 0) return;

    final viewport = _controller.position.viewportDimension;
    final chipWidth = _chipWidth(viewport);
    // Chips start after the leading padding, which scrolls with the content.
    final chipStart = widget.horizontalPadding + index * chipWidth;
    final target = chipStart - (viewport - chipWidth) / 2;

    _controller.animateTo(
      target.clamp(0, _controller.position.maxScrollExtent),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
    );
  }

  /// Seven chips share the width left over once both end insets are removed,
  /// so a full week fits without scrolling.
  double _chipWidth(double maxWidth) =>
      (maxWidth - widget.horizontalPadding * 2) / CalendarDayStrip._visibleChips;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CalendarDayStrip.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final chipWidth = _chipWidth(constraints.maxWidth);

          return ListView.builder(
            controller: _controller,
            scrollDirection: .horizontal,
            padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
            itemExtent: chipWidth,
            itemCount: widget.days.length,
            itemBuilder: (context, index) {
              final day = widget.days[index];

              return _DayChip(
                day: day,
                isSelected: day == widget.selectedDay,
                isActive: widget.activeDays?.contains(day) ?? true,
                showsDayNumber: widget.showsDayNumber,
                onTap: () => widget.onDaySelected(day),
              );
            },
          );
        },
      ),
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({
    required this.day,
    required this.isSelected,
    required this.isActive,
    required this.showsDayNumber,
    required this.onTap,
  });

  final DateTime day;
  final bool isSelected;
  final bool isActive;
  final bool showsDayNumber;
  final VoidCallback onTap;

  /// Nominal circle size. The strip gives each chip a tight slot, so on narrow
  /// screens the box comes back narrower than this and `CircleBorder` draws to
  /// the shorter side — the height stays fixed so the labels always fit.
  static const double _circleSize = 64;

  @override
  Widget build(BuildContext context) {
    final labelColor = switch ((isSelected, isActive)) {
      (true, _) => context.colors.textWhite,
      (false, true) => context.colors.textPrimary,
      (false, false) => context.colors.textDisabled,
    };

    return Center(
      child: TappableScale(
        // A day with nothing on it is not selectable.
        onTap: isActive ? onTap : null,
        borderRadius: BorderRadius.circular(_circleSize / 2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: _circleSize,
          height: _circleSize,
          decoration: ShapeDecoration(
            color: isSelected ? context.colors.signatureBlue : Colors.transparent,
            shape: const CircleBorder(),
          ),
          child: Column(
            // No gap — the labels sit on their own line heights.
            mainAxisAlignment: .center,
            children: [
              // Scaled down rather than wrapped: Arabic weekday abbreviations
              // are long enough to take a second line in a chip this narrow,
              // which would push the labels out of the circle.
              _ChipLabel(
                text: CalendarDateFormat.weekdayAbbreviation(context, day),
                style: context.typography.medium13.withColor(labelColor),
              ),
              if (showsDayNumber)
                _ChipLabel(
                  text: CalendarDateFormat.dayNumber(context, day),
                  style: context.typography.medium14.withColor(labelColor),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// One line of a day chip, shrunk to fit rather than wrapped.
class _ChipLabel extends StatelessWidget {
  const _ChipLabel({required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: .scaleDown,
      child: Text(text, style: style, maxLines: 1, softWrap: false),
    );
  }
}
