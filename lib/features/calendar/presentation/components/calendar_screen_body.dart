import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../cubit/cubit.dart';
import 'calendar_day_summary.dart';
import 'calendar_empty_state.dart';
import 'calendar_shimmer.dart';
import 'reservation_timeline.dart';

/// Body of the Calendar screen: week stepper, day strip, then the focused
/// day's reservations.
class CalendarScreenBody extends StatelessWidget {
  const CalendarScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        final cubit = context.read<CalendarCubit>();

        return RefreshIndicator(
          onRefresh: cubit.refresh,
          color: context.colors.signatureBlue,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              top: context.spacing.s24,
              bottom: context.bottomInset + context.spacing.s24,
            ),
            child: Column(
              spacing: context.spacing.s16,
              children: [
                CalendarStepNavigator(
                  label: CalendarDateLabel(
                    prefix: CalendarDateFormat.monthName(context, state.focusedDay),
                    day: state.focusedDay,
                    style: context.typography.bold20.primary(context),
                  ),
                  onPrevious: cubit.showPreviousWeek,
                  onNext: cubit.showNextWeek,
                  canGoBack: state.canShowPreviousWeek,
                ),
                // Full-bleed: chips scroll edge to edge, inset to line up with
                // the timeline below.
                CalendarDayStrip(
                  days: state.visibleDays,
                  selectedDay: state.focusedDay,
                  onDaySelected: cubit.selectDay,
                  horizontalPadding: context.spacing.s24,
                  activeDays: state.bookedDays,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.spacing.s24),
                  child: Column(
                    spacing: context.spacing.s16,
                    children: [
                      CalendarDaySummary(
                        day: state.focusedDay,
                        reservationCount: state.focusedDayReservations.length,
                      ),
                      Divider(height: 1, color: context.colors.strokePrimary),
                      AsyncHandler<CalendarCubit, CalendarState, ReservationCalendarEntity>(
                        requestManagerGetter: (cubit) => cubit.calendarManager,
                        initialBuilder: (_) => const CalendarShimmer(),
                        loadingBuilder: (_) => const CalendarShimmer(),
                        onRetry: (cubit) => cubit.refresh(),
                        successBuilder: (context, calendar) {
                          final reservations = calendar.reservationsOn(state.focusedDay);

                          if (reservations.isEmpty) return const CalendarEmptyState();

                          return ReservationTimeline(reservations: reservations);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
