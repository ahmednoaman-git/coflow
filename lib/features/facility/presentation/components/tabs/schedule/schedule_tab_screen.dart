import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/entities.dart';
import '../../../cubit/cubit.dart';
import '../../facility_data_provider.dart';
import 'components/schedule_day_summary.dart';
import 'components/schedule_empty_state.dart';
import 'components/schedule_shimmer.dart';
import 'components/session_timeline.dart';
import 'components/session_type_selector.dart';

/// Renders a facility's Schedule (Flow basic) or Calendar (Flow premium, Pro)
/// tab — the same timeline at two capability levels, see
/// [FacilityScheduleConfig].
class ScheduleTabScreen extends StatelessWidget {
  const ScheduleTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final facility = FacilityDataProvider.of(context).facility;
    final config = FacilityScheduleConfig.forFacility(facility);

    return BlocProvider(
      create: (_) => getIt<FacilityScheduleCubit>(param1: facility.id, param2: config),
      child: _ScheduleTabBody(config: config),
    );
  }
}

class _ScheduleTabBody extends StatelessWidget {
  const _ScheduleTabBody({required this.config});

  final FacilityScheduleConfig config;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacilityScheduleCubit, FacilityScheduleState>(
      builder: (context, state) {
        final cubit = context.read<FacilityScheduleCubit>();

        return Column(
          spacing: context.spacing.s16,
          children: [
            if (config.showsMonthNavigator)
              Padding(
                padding: EdgeInsets.only(top: context.spacing.s16),
                child: CalendarStepNavigator(
                  label: CalendarDateLabel(
                    prefix: CalendarDateFormat.monthName(context, state.selectedDay),
                    day: state.selectedDay,
                    style: context.typography.bold20.primary(context),
                  ),
                  onPrevious: cubit.showPreviousMonth,
                  onNext: cubit.showNextMonth,
                  canGoBack: state.canShowPreviousMonth,
                ),
              ),
            // Full-bleed: chips scroll edge to edge, inset to line up with the
            // timeline below.
            CalendarDayStrip(
              days: state.visibleDays,
              selectedDay: state.selectedDay,
              onDaySelected: cubit.selectDay,
              horizontalPadding: context.spacing.s16,
              activeDays: _daysWithSessions(state.schedule),
              // Schedule is a recurring weekly cycle, so its chips name the
              // weekday only; Calendar keeps the date.
              showsDayNumber: config.isCalendar,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                context.spacing.s16,
                0,
                context.spacing.s16,
                context.spacing.s16,
              ),
              child: Column(
                spacing: context.spacing.s16,
                children: [
                  if (config.showsTypeToggle)
                    SessionTypeSelector(
                      types: config.serviceTypes,
                      selectedType: state.selectedType,
                      onTypeSelected: cubit.selectType,
                    ),
                  ScheduleDaySummary(
                    day: state.selectedDay,
                    type: state.selectedType,
                    sessionCount: state.selectedDaySessions.length,
                  ),
                  Divider(height: 1, color: context.colors.strokePrimary),
                  AsyncHandler<
                    FacilityScheduleCubit,
                    FacilityScheduleState,
                    FacilityScheduleEntity
                  >(
                    requestManagerGetter: (cubit) => cubit.scheduleManager,
                    loadingBuilder: (context) => const ScheduleShimmer(),
                    onRetry: (cubit) => cubit.refresh(),
                    successBuilder: (context, schedule) {
                      final sessions = schedule.sessionsOn(state.selectedDay);

                      if (sessions.isEmpty) {
                        return ScheduleEmptyState(type: state.selectedType);
                      }

                      return SessionTimeline(
                        sessions: sessions,
                        showsCapacity: config.showsCapacity,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  /// Days the strip should render as active. Null while the window has not
  /// loaded, so nothing is dimmed until we actually know.
  Set<DateTime>? _daysWithSessions(FacilityScheduleEntity? schedule) {
    if (schedule == null) return null;
    return {for (final session in schedule.sessions) session.day};
  }
}
