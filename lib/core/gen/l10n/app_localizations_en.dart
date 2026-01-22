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
  String get facilityDetails_pricingTab => 'Pricing';

  @override
  String get facilityDetails_ticketPrice => 'Ticket price';

  @override
  String get facilityDetails_addOns => 'Add-ons';

  @override
  String get facilityDetails_access => 'Access';

  @override
  String get facilityDetails_conditions => 'Conditions';

  @override
  String get facilityDetails_validity => 'Validity';

  @override
  String get facilityDetails_purchase => 'Purchase';

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
    return '$count days';
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
  String get facilityDetails_amenitiesSectionTitle => 'Amenities';

  @override
  String get facilityDetails_actionsSectionTitle => 'Actions';

  @override
  String get facilityDetails_comingSoon => 'Coming soon';

  @override
  String get facilityDetails_noTickets => 'No tickets available';
}
