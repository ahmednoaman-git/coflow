// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get inoPeople => 'InoPeople';

  @override
  String get onboardingStepOneDescription => 'Seamless daily attendance tracking';

  @override
  String get onboardingStepTwoDescription => 'Easily manage leave, letter, loan requests and more';

  @override
  String get onboardingStepThreeDescription => 'Monitor your payslips and expenses effortlessly';

  @override
  String get attendanceTitle => 'Attendance';

  @override
  String get attendanceDayShortSunday => 'S';

  @override
  String get attendanceDayShortMonday => 'M';

  @override
  String get attendanceDayShortTuesday => 'T';

  @override
  String get attendanceDayShortWednesday => 'W';

  @override
  String get attendanceDayShortThursday => 'T';

  @override
  String get attendanceDayShortFriday => 'F';

  @override
  String get attendanceDayShortSaturday => 'S';

  @override
  String get getStarted => 'Get Started';

  @override
  String get requestsTitle => 'Requests';

  @override
  String get payslipsTitle => 'Payslips';

  @override
  String get login => 'Login';

  @override
  String get loginSubtitle => 'Enter your credentials to continue';

  @override
  String get employeeId => 'Employee ID';

  @override
  String get employeeIdHint => 'Enter your employee ID';

  @override
  String get password => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get loginButton => 'Login';

  @override
  String get tenantInputTitle => 'Get started with InoPeople ESS!';

  @override
  String get tenantInputSubtitle =>
      'Let\'s get you started — enter your company\'s Tenant ID to begin!';

  @override
  String get tenantIdHint => 'e.g. Company name';

  @override
  String get submit => 'Submit';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get retry => 'Retry';

  @override
  String get tenantIdRequired => 'Please enter a tenant ID';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'Enter your email address';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get createAccount => 'Create Account';

  @override
  String get basicInfo => 'Basic Information';

  @override
  String get basicInfoSubtitle => 'Let\'s start with your basic details';

  @override
  String get fullName => 'Full Name';

  @override
  String get fullNameHint => 'Enter your full name';

  @override
  String get next => 'Next';

  @override
  String get profileDetails => 'Profile Details';

  @override
  String get profileDetailsSubtitle => 'Tell us more about yourself';

  @override
  String get gender => 'Gender';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get birthdate => 'Date of Birth';

  @override
  String get birthdateHint => 'Select your date of birth';

  @override
  String get nationality => 'Nationality';

  @override
  String get nationalityHint => 'Select your nationality';

  @override
  String get phone => 'Phone Number';

  @override
  String get phoneHint => 'Enter your phone number';

  @override
  String get loading => 'Loading...';

  @override
  String get verifyEmail => 'Verify Your Email';

  @override
  String otpSentTo(String email) {
    return 'We\'ve sent a verification code to $email';
  }

  @override
  String get otpCode => 'Verification Code';

  @override
  String get otpCodeHint => 'Enter the 6-digit code';

  @override
  String get resendOtp => 'Resend Code';

  @override
  String get sending => 'Sending...';

  @override
  String get otpSent => 'Verification code sent successfully';

  @override
  String get registrationSuccess => 'Registration successful! Please login to continue.';

  @override
  String get searchCountry => 'Search country...';

  @override
  String get noCountriesFound => 'No countries found';

  @override
  String get selectCountry => 'Select Country';

  @override
  String get welcome => 'Welcome,';

  @override
  String get businesses => 'Businesses';

  @override
  String get instructors => 'Instructors';

  @override
  String allLocation(String country) {
    return 'All . $country';
  }

  @override
  String get sky => 'Sky';

  @override
  String get sea => 'Sea';

  @override
  String get earth => 'Earth';

  @override
  String get energy => 'Energy';

  @override
  String get locations => 'LOCATIONS';

  @override
  String get selectGovernorateArea => 'SELECT GOVERNORATE/AREA';

  @override
  String get all => 'All';

  @override
  String get remote => 'Remote';

  @override
  String get confirm => 'Confirm';

  @override
  String get activityLineSky => 'Sky';

  @override
  String get activityLineSea => 'Sea';

  @override
  String get activityLineEarth => 'Earth';

  @override
  String get activityLineEnergy => 'Energy';

  @override
  String selectedCount(int count) {
    return '$count selected';
  }

  @override
  String remoteWithCount(int count) {
    return 'Remote ($count)';
  }

  @override
  String get facility_temporarilyClosed => 'Temporarily Closed';

  @override
  String get facilityDetails_profileTab => 'Profile';

  @override
  String get facilityDetails_activitiesTab => 'Activities';

  @override
  String get facilityDetails_flowsTab => 'Flows';

  @override
  String get facilityDetails_coursesTab => 'Courses';

  @override
  String get facilityDetails_pricingTab => 'Pricing';

  @override
  String get facilityDetails_scheduleTab => 'Schedule';

  @override
  String get facilityDetails_calendarTab => 'Calendar';

  @override
  String get facilityDetails_ticketPrice => 'Price';

  @override
  String get facilityDetails_addOns => 'Add-ons';

  @override
  String get facilityDetails_access => 'Access';

  @override
  String get facilityDetails_conditions => 'Conditions';

  @override
  String get facilityDetails_validity => 'Validity';

  @override
  String get facilityDetails_promotionPrice => 'Promotion Price';

  @override
  String get facilityDetails_purchase => 'Purchase';

  @override
  String get facilityDetails_purchaseNow => 'Purchase Now';

  @override
  String get facilityDetails_tickets => 'Tickets';

  @override
  String get facilityDetails_promotions => 'Promotions';

  @override
  String get facilityDetails_seeMore => 'See more';

  @override
  String get facilityDetails_seeLess => 'See less';

  @override
  String facilityDetails_accessPrefix(int count) {
    return 'Access: $count Services';
  }

  @override
  String get facilityDetails_unlimited => 'Unlimited';

  @override
  String get facilityDetails_unknown => 'Unknown';

  @override
  String facilityDetails_days(int count) {
    return '$count Day(s)';
  }

  @override
  String facilityDetails_likesCount(int count) {
    return '$count Likes';
  }

  @override
  String get facilityDetails_teamSectionTitle => 'Team';

  @override
  String get facilityDetails_operatingHoursSectionTitle => 'Operating hours';

  @override
  String get facilityDetails_locationSectionTitle => 'Location';

  @override
  String get facilityDetails_branchesSectionTitle => 'Branches';

  @override
  String get facilityDetails_languagesSectionTitle => 'Languages';

  @override
  String get facilityDetails_flowsSectionTitle => 'Flows';

  @override
  String get facilityDetails_amenitiesSectionTitle => 'Amenities';

  @override
  String get facilityDetails_actionsSectionTitle => 'Actions';

  @override
  String get facilityDetails_comingSoon => 'Coming soon';

  @override
  String get facilityDetails_appliedOn => 'Applied on';

  @override
  String get facilityDetails_offer => 'Offer';

  @override
  String get facilityDetails_buy => 'Buy';

  @override
  String get facilityDetails_get => 'Get';

  @override
  String get facilityDetails_descriptionLabel => 'Description';

  @override
  String facilityDetails_contactFacility(String name) {
    return 'Contact $name';
  }

  @override
  String get facilityDetails_noTickets => 'No tickets available';

  @override
  String get facilityDetails_noPromotions => 'No promotions available';

  @override
  String get facilityDetails_promotionAppliedOnTickets => 'Tickets';

  @override
  String get facilityDetails_promotionAppliedOnPromotions => 'Promotions';

  @override
  String get facilityDetails_promotionAppliedOnPackages => 'Packages';

  @override
  String get facilityDetails_promotionAppliedOnPurchases => 'Purchases';

  @override
  String get facilityDetails_promotionAppliedOnAllTickets => 'All Tickets';

  @override
  String get facilityDetails_promotionAppliedOnAllPromotions => 'All Promotions';

  @override
  String get facilityDetails_promotionAppliedOnAllPackages => 'All Packages';

  @override
  String get facilityDetails_promotionAppliedOnAllPurchases => 'All Purchases';

  @override
  String get facilityDetails_remaining => 'Remaining';

  @override
  String get facilityDetails_ticketFallbackLabel => 'Ticket';

  @override
  String get facilityDetails_trackUpdates => 'Track Updates';

  @override
  String get facilityDetails_faqs => 'FAQs';

  @override
  String get facilityDetails_allLevels => 'All Levels';

  @override
  String get facilityDetails_requirements => 'Requirements';

  @override
  String get facilityDetails_locationsSectionTitle => 'Locations';

  @override
  String get facilityDetails_instructorsSectionTitle => 'Instructors';

  @override
  String get facilityDetails_viewPricing => 'View Pricing';

  @override
  String get facilityDetails_noActivities => 'No activities available yet';

  @override
  String get facilityDetails_noFlows => 'No flows available yet';

  @override
  String get facilityDetails_noCourses => 'No courses available yet';

  @override
  String facilityDetails_folderTitle(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get purchase_title => 'Purchase';

  @override
  String get purchase_couponLabel => 'Coupon';

  @override
  String purchase_selectCoupon(int count) {
    return 'Select Coupon ($count Available)';
  }

  @override
  String get purchase_loadingCoupons => 'Loading coupons...';

  @override
  String get purchase_noCoupon => 'No Coupon';

  @override
  String get purchase_quantity => 'Quantity';

  @override
  String get purchase_invoiceTitle => 'Purchase Invoice';

  @override
  String purchase_invoiceLine(int count, String label) {
    return '${count}x $label';
  }

  @override
  String get purchase_couponDiscount => 'Coupon Discount';

  @override
  String get purchase_totalAmount => 'Total Amount';

  @override
  String get purchase_depositAmount => 'Deposit Amount';

  @override
  String get purchase_directPurchase => 'Direct Purchase';

  @override
  String get purchase_onlinePayment => 'Online Payment';

  @override
  String get purchase_depositPayment => 'Deposit Payment';

  @override
  String get purchase_stubSnackBar => 'Payment integration is coming soon.';

  @override
  String facilitySchedule_flowCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Flows',
      one: '1 Flow',
      zero: 'No Flows',
    );
    return '$_temp0';
  }

  @override
  String facilitySchedule_activityCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Activities',
      one: '1 Activity',
      zero: 'No Activities',
    );
    return '$_temp0';
  }

  @override
  String facilitySchedule_courseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Courses',
      one: '1 Course',
      zero: 'No Courses',
    );
    return '$_temp0';
  }

  @override
  String get facilitySchedule_ladiesOnly => 'Ladies Only';

  @override
  String get facilitySchedule_noFlows => 'No flows scheduled on this day';

  @override
  String get facilitySchedule_noActivities => 'No activities scheduled on this day';

  @override
  String get facilitySchedule_noCourses => 'No courses scheduled on this day';

  @override
  String facilitySchedule_waitingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count waiting',
      one: '1 waiting',
    );
    return '$_temp0';
  }

  @override
  String get facilitySchedule_customers => 'Customers';

  @override
  String get facilitySchedule_waitlist => 'Waitlist';

  @override
  String get facilitySchedule_note => 'Note';

  @override
  String get facilitySchedule_facilityLocation => 'Facility Location';

  @override
  String get facilitySchedule_location => 'Location';

  @override
  String facilitySchedule_reserveNowCta(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Reserve Now ($count Available Tickets)',
      one: 'Reserve Now (1 Available Ticket)',
    );
    return '$_temp0';
  }

  @override
  String facilitySchedule_purchaseTicketsCta(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Purchase Tickets ($count Available Tickets)',
      one: 'Purchase Tickets (1 Available Ticket)',
    );
    return '$_temp0';
  }

  @override
  String get facilitySchedule_joinWaitlist => 'Join Waitlist';

  @override
  String get facilitySchedule_leaveWaitlist => 'Leave Waitlist';

  @override
  String get facilitySchedule_cancelReservation => 'Cancel Reservation';

  @override
  String facilitySchedule_contactFacility(String facility) {
    return 'Contact $facility';
  }

  @override
  String get facilitySchedule_confirmLabel => 'Confirm:';

  @override
  String get facilitySchedule_reservationLabel => 'Reservation';

  @override
  String get facilitySchedule_confirmReservationSubtitle =>
      'Review available purchase to confirm reservation.';

  @override
  String get facilitySchedule_dateLabel => 'Date';

  @override
  String get facilitySchedule_timeLabel => 'Time';

  @override
  String get facilitySchedule_ticketLabel => 'Ticket';

  @override
  String get facilitySchedule_ticketDue => 'DUE';

  @override
  String facilitySchedule_ticketValidFor(int count) {
    return 'Valid for: $count Day(s)';
  }

  @override
  String facilitySchedule_ticketAddOns(int count) {
    return '$count Add-Ons';
  }

  @override
  String get facilitySchedule_cancellationPolicy => 'Cancellation Policy';

  @override
  String facilitySchedule_cancellationPolicyBody(String facility, int hours) {
    return '$facility accepts any cancellation $hours hours before the reservation. Used ticket will return to your account, and you will be able to reserve again if still available.';
  }

  @override
  String get nav_home => 'Home';

  @override
  String get nav_discover => 'Discover';

  @override
  String get nav_discounts => 'Discounts';

  @override
  String get nav_account => 'Account';

  @override
  String get nav_profile => 'Profile';

  @override
  String get account_title => 'Account';

  @override
  String get account_calendar => 'Calendar';

  @override
  String get account_purchases => 'Purchases';

  @override
  String get account_coupons => 'Coupons';

  @override
  String get account_management => 'Management';

  @override
  String get account_information => 'Account Information';

  @override
  String get account_activityPreferences => 'Activity Preferences';

  @override
  String get account_supportRequests => 'Support Requests';

  @override
  String get account_faqs => 'FAQ\'s';

  @override
  String get account_termsAndConditions => 'Terms & Conditions';

  @override
  String get account_privacyPolicy => 'Privacy Policy';

  @override
  String get account_logout => 'Logout';

  @override
  String get account_logoutConfirmTitle => 'Logout';

  @override
  String get account_logoutConfirmBody => 'Are you sure you want to log out of your account?';

  @override
  String get account_cancel => 'Cancel';

  @override
  String get calendar_title => 'Calendar';

  @override
  String calendar_reservationCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Reservations',
      one: '1 Reservation',
      zero: 'No Reservations',
    );
    return '$_temp0';
  }

  @override
  String get calendar_noReservations => 'No reservations on this day';

  @override
  String get savedProfiles_title => 'Profiles';

  @override
  String get savedProfiles_empty => 'No saved profiles yet';

  @override
  String get savedProfiles_emptyHint => 'Save a facility from its profile to find it here.';

  @override
  String get savedProfiles_emptyForLine => 'Nothing saved on this activity line';

  @override
  String get savedProfiles_unsave => 'Unsave';

  @override
  String get savedProfiles_unsaved => 'Removed from your saved profiles';

  @override
  String get savedProfiles_trackUpdates => 'Track updates';

  @override
  String get savedProfiles_trackingUpdates => 'Tracking updates';

  @override
  String get discounts_title => 'Discounts';

  @override
  String get search_title => 'Search';

  @override
  String get search_hint => 'Search';

  @override
  String get search_tabBusiness => 'Business';

  @override
  String get search_tabInstructor => 'Instructor';

  @override
  String get search_tabService => 'Service';

  @override
  String search_tabLabel(String label, int count) {
    return '$label ($count)';
  }

  @override
  String search_minCharacters(int count) {
    return 'Type at least $count characters to search';
  }

  @override
  String get search_typeActivity => 'Activity';

  @override
  String get search_typeFlow => 'Flow';

  @override
  String get search_typeCourse => 'Course';

  @override
  String get search_noResults => 'No results found';

  @override
  String get search_noResultsHint => 'Try a different keyword';

  @override
  String get facilityDetails_addressLocationSectionTitle => 'Address & Location';

  @override
  String get facilityDetails_remoteLocationSectionTitle => 'Remote Location';

  @override
  String get facilityDetails_locationLink => 'Link';

  @override
  String get facilityDetails_operatingIn => 'Operating in:';

  @override
  String get facilityDetails_coverageAll => 'ALL';

  @override
  String get facilityDetails_contactSectionTitle => 'Contact';

  @override
  String get facilityDetails_chooseNumberTitle => 'Choose a number';

  @override
  String get facilityDetails_linkFailed => 'Couldn\'t open this link';

  @override
  String get facilityDetails_saveAdded => 'Added to your profiles';

  @override
  String get facilityDetails_saveRemoved => 'Removed from your profiles';

  @override
  String get facilityDetails_saveFailed => 'Couldn\'t update your saved profiles';

  @override
  String get facilityDetails_trackingOn => 'You\'ll get this facility\'s updates';

  @override
  String get facilityDetails_trackingOff => 'Updates turned off';

  @override
  String get facilityDetails_trackingFailed => 'Couldn\'t update tracking';

  @override
  String facilityDetails_lastUpdated(String date) {
    return 'Last Updated: $date';
  }

  @override
  String get facilityFaq_title => 'FAQs';

  @override
  String facilityFaq_subtitle(String name) {
    return 'Answers straight from $name';
  }

  @override
  String get facilityFaq_empty => 'No questions yet';

  @override
  String get facilityFaq_emptyHint => 'This facility hasn\'t published any FAQs.';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get purchase_success => 'Purchase added to your account.';

  @override
  String get purchase_dueNotice =>
      'This purchase will be added to your account with payment due. No online payment will be collected here.';

  @override
  String get facilitySchedule_actionUnavailable => 'Reservations are unavailable for this session.';

  @override
  String get account_gifts => 'Gifts';
}
