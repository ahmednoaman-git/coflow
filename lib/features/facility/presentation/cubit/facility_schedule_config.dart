import '../../../activity_line/domain/entities/collapsed_facility_entity.dart';
import '../../domain/enums/enums.dart';
import 'package:coflow_users_v2/core/core.dart';

/// Which capabilities the Schedule/Calendar tab renders for a facility.
///
/// Schedule (Flow basic) and Calendar (Flow premium & Pro) are the same screen
/// at two capability levels; every difference between the two designs is one
/// flag here. Each flag is also a seam — when Calendar grows a requirement
/// Schedule does not share, it becomes its own branch without a rewrite.
class FacilityScheduleConfig {
  const FacilityScheduleConfig({
    required this.isCalendar,
    required this.showsMonthNavigator,
    required this.showsCapacity,
    required this.serviceTypes,
  });

  /// Resolves the config from the facility's account tier.
  ///
  /// - Flow basic → Schedule: one recurring week, day strip only, no capacity.
  /// - Flow premium → Calendar: month navigator + capacity.
  /// - Pro → Calendar with an Activities/Courses toggle.
  factory FacilityScheduleConfig.forFacility(CollapsedFacilityEntity facility) {
    final features = facility.accountType.features(facility.subscriptionStatus);
    final isCalendar = features.contains(FacilityFeature.calendar);

    return FacilityScheduleConfig(
      isCalendar: isCalendar,
      showsMonthNavigator: isCalendar,
      showsCapacity: isCalendar,
      serviceTypes: [
        if (features.contains(FacilityFeature.flows)) FacilityServiceType.flow,
        if (features.contains(FacilityFeature.activities)) FacilityServiceType.activity,
        if (features.contains(FacilityFeature.courses)) FacilityServiceType.course,
      ],
    );
  }

  /// Which of the two data shapes backs the tab.
  ///
  /// Calendar wants dated, capacity-bearing sessions (still stub-backed).
  /// Schedule is served by `schedule/{facilityId}`, a recurring weekly pattern
  /// with no dates and no capacity — hence one week, no stepper.
  final bool isCalendar;

  /// `← January 1st →` above the day strip. Calendar only; it also switches
  /// the fetched window from a rolling range to whole months.
  final bool showsMonthNavigator;

  /// The `2/10` capacity bar on session cards. Calendar only — Schedule hides
  /// it by product rule, the data is there either way.
  final bool showsCapacity;

  /// Listing types this facility schedules, in tab order. More than one
  /// renders the Activities/Courses toggle.
  final List<FacilityServiceType> serviceTypes;

  bool get showsTypeToggle => serviceTypes.length > 1;

  FacilityServiceType get initialType =>
      serviceTypes.isEmpty ? FacilityServiceType.activity : serviceTypes.first;
}
