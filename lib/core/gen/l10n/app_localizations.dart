import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ar'), Locale('en')];

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcomeTo;

  /// No description provided for @inoPeople.
  ///
  /// In en, this message translates to:
  /// **'InoPeople'**
  String get inoPeople;

  /// No description provided for @onboardingStepOneDescription.
  ///
  /// In en, this message translates to:
  /// **'Seamless daily attendance tracking'**
  String get onboardingStepOneDescription;

  /// No description provided for @onboardingStepTwoDescription.
  ///
  /// In en, this message translates to:
  /// **'Easily manage leave, letter, loan requests and more'**
  String get onboardingStepTwoDescription;

  /// No description provided for @onboardingStepThreeDescription.
  ///
  /// In en, this message translates to:
  /// **'Monitor your payslips and expenses effortlessly'**
  String get onboardingStepThreeDescription;

  /// No description provided for @attendanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendanceTitle;

  /// No description provided for @attendanceDayShortSunday.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get attendanceDayShortSunday;

  /// No description provided for @attendanceDayShortMonday.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get attendanceDayShortMonday;

  /// No description provided for @attendanceDayShortTuesday.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get attendanceDayShortTuesday;

  /// No description provided for @attendanceDayShortWednesday.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get attendanceDayShortWednesday;

  /// No description provided for @attendanceDayShortThursday.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get attendanceDayShortThursday;

  /// No description provided for @attendanceDayShortFriday.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get attendanceDayShortFriday;

  /// No description provided for @attendanceDayShortSaturday.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get attendanceDayShortSaturday;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @requestsTitle.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requestsTitle;

  /// No description provided for @payslipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Payslips'**
  String get payslipsTitle;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your credentials to continue'**
  String get loginSubtitle;

  /// No description provided for @employeeId.
  ///
  /// In en, this message translates to:
  /// **'Employee ID'**
  String get employeeId;

  /// No description provided for @employeeIdHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your employee ID'**
  String get employeeIdHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @tenantInputTitle.
  ///
  /// In en, this message translates to:
  /// **'Get started with InoPeople ESS!'**
  String get tenantInputTitle;

  /// No description provided for @tenantInputSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get you started — enter your company\'s Tenant ID to begin!'**
  String get tenantInputSubtitle;

  /// No description provided for @tenantIdHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Company name'**
  String get tenantIdHint;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @tenantIdRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a tenant ID'**
  String get tenantIdRequired;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get emailHint;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @basicInfo.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basicInfo;

  /// No description provided for @basicInfoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start with your basic details'**
  String get basicInfoSubtitle;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get fullNameHint;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @profileDetails.
  ///
  /// In en, this message translates to:
  /// **'Profile Details'**
  String get profileDetails;

  /// No description provided for @profileDetailsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us more about yourself'**
  String get profileDetailsSubtitle;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @birthdate.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get birthdate;

  /// No description provided for @birthdateHint.
  ///
  /// In en, this message translates to:
  /// **'Select your date of birth'**
  String get birthdateHint;

  /// No description provided for @nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get nationality;

  /// No description provided for @nationalityHint.
  ///
  /// In en, this message translates to:
  /// **'Select your nationality'**
  String get nationalityHint;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get phoneHint;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @verifyEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Email'**
  String get verifyEmail;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a verification code to {email}'**
  String otpSentTo(String email);

  /// No description provided for @otpCode.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get otpCode;

  /// No description provided for @otpCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code'**
  String get otpCodeHint;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendOtp;

  /// No description provided for @sending.
  ///
  /// In en, this message translates to:
  /// **'Sending...'**
  String get sending;

  /// No description provided for @otpSent.
  ///
  /// In en, this message translates to:
  /// **'Verification code sent successfully'**
  String get otpSent;

  /// No description provided for @registrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration successful! Please login to continue.'**
  String get registrationSuccess;

  /// No description provided for @searchCountry.
  ///
  /// In en, this message translates to:
  /// **'Search country...'**
  String get searchCountry;

  /// No description provided for @noCountriesFound.
  ///
  /// In en, this message translates to:
  /// **'No countries found'**
  String get noCountriesFound;

  /// No description provided for @selectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get selectCountry;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome,'**
  String get welcome;

  /// No description provided for @businesses.
  ///
  /// In en, this message translates to:
  /// **'Businesses'**
  String get businesses;

  /// No description provided for @instructors.
  ///
  /// In en, this message translates to:
  /// **'Instructors'**
  String get instructors;

  /// No description provided for @allLocation.
  ///
  /// In en, this message translates to:
  /// **'All . {country}'**
  String allLocation(String country);

  /// No description provided for @sky.
  ///
  /// In en, this message translates to:
  /// **'Sky'**
  String get sky;

  /// No description provided for @sea.
  ///
  /// In en, this message translates to:
  /// **'Sea'**
  String get sea;

  /// No description provided for @earth.
  ///
  /// In en, this message translates to:
  /// **'Earth'**
  String get earth;

  /// No description provided for @energy.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get energy;

  /// No description provided for @locations.
  ///
  /// In en, this message translates to:
  /// **'LOCATIONS'**
  String get locations;

  /// No description provided for @selectGovernorateArea.
  ///
  /// In en, this message translates to:
  /// **'SELECT GOVERNORATE/AREA'**
  String get selectGovernorateArea;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @remote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get remote;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
