import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../cubit/cubit.dart';
import 'calendar_day_summary.dart';
import 'calendar_empty_state.dart';
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

        return LogoRefreshIndicator(
          onRefresh: cubit.refresh,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: context.spacing.s24),
                sliver: SliverToBoxAdapter(
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
                              skeletonBuilder: (_) =>
                                  const CalendarTimelineSkeleton(withLogo: true),
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
              ),
              const SliverBottomInset(),
            ],
          ),
        );
      },
    );
  }
}
