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

  /// No description provided for @activityLineSky.
  ///
  /// In en, this message translates to:
  /// **'Sky'**
  String get activityLineSky;

  /// No description provided for @activityLineSea.
  ///
  /// In en, this message translates to:
  /// **'Sea'**
  String get activityLineSea;

  /// No description provided for @activityLineEarth.
  ///
  /// In en, this message translates to:
  /// **'Earth'**
  String get activityLineEarth;

  /// No description provided for @activityLineEnergy.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get activityLineEnergy;

  /// No description provided for @selectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String selectedCount(int count);

  /// No description provided for @remoteWithCount.
  ///
  /// In en, this message translates to:
  /// **'Remote ({count})'**
  String remoteWithCount(int count);

  /// No description provided for @facility_temporarilyClosed.
  ///
  /// In en, this message translates to:
  /// **'Temporarily Closed'**
  String get facility_temporarilyClosed;

  /// No description provided for @facilityDetails_profileTab.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get facilityDetails_profileTab;

  /// No description provided for @facilityDetails_activitiesTab.
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get facilityDetails_activitiesTab;

  /// No description provided for @facilityDetails_flowsTab.
  ///
  /// In en, this message translates to:
  /// **'Flows'**
  String get facilityDetails_flowsTab;

  /// No description provided for @facilityDetails_coursesTab.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get facilityDetails_coursesTab;

  /// No description provided for @facilityDetails_pricingTab.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get facilityDetails_pricingTab;

  /// No description provided for @facilityDetails_scheduleTab.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get facilityDetails_scheduleTab;

  /// No description provided for @facilityDetails_calendarTab.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get facilityDetails_calendarTab;

  /// No description provided for @facilityDetails_ticketPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get facilityDetails_ticketPrice;

  /// No description provided for @facilityDetails_addOns.
  ///
  /// In en, this message translates to:
  /// **'Add-ons'**
  String get facilityDetails_addOns;

  /// No description provided for @facilityDetails_access.
  ///
  /// In en, this message translates to:
  /// **'Access'**
  String get facilityDetails_access;

  /// No description provided for @facilityDetails_conditions.
  ///
  /// In en, this message translates to:
  /// **'Conditions'**
  String get facilityDetails_conditions;

  /// No description provided for @facilityDetails_validity.
  ///
  /// In en, this message translates to:
  /// **'Validity'**
  String get facilityDetails_validity;

  /// No description provided for @facilityDetails_promotionPrice.
  ///
  /// In en, this message translates to:
  /// **'Promotion Price'**
  String get facilityDetails_promotionPrice;

  /// No description provided for @facilityDetails_purchase.
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get facilityDetails_purchase;

  /// No description provided for @facilityDetails_purchaseNow.
  ///
  /// In en, this message translates to:
  /// **'Purchase Now'**
  String get facilityDetails_purchaseNow;

  /// No description provided for @facilityDetails_tickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get facilityDetails_tickets;

  /// No description provided for @facilityDetails_promotions.
  ///
  /// In en, this message translates to:
  /// **'Promotions'**
  String get facilityDetails_promotions;

  /// No description provided for @facilityDetails_seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get facilityDetails_seeMore;

  /// No description provided for @facilityDetails_seeLess.
  ///
  /// In en, this message translates to:
  /// **'See less'**
  String get facilityDetails_seeLess;

  /// No description provided for @facilityDetails_accessPrefix.
  ///
  /// In en, this message translates to:
  /// **'Access: {count} Services'**
  String facilityDetails_accessPrefix(int count);

  /// No description provided for @facilityDetails_unlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get facilityDetails_unlimited;

  /// No description provided for @facilityDetails_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get facilityDetails_unknown;

  /// No description provided for @facilityDetails_days.
  ///
  /// In en, this message translates to:
  /// **'{count} Day(s)'**
  String facilityDetails_days(int count);

  /// No description provided for @facilityDetails_likesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Likes'**
  String facilityDetails_likesCount(int count);

  /// No description provided for @facilityDetails_teamSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Team'**
  String get facilityDetails_teamSectionTitle;

  /// No description provided for @facilityDetails_operatingHoursSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Operating hours'**
  String get facilityDetails_operatingHoursSectionTitle;

  /// No description provided for @facilityDetails_locationSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get facilityDetails_locationSectionTitle;

  /// No description provided for @facilityDetails_branchesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Branches'**
  String get facilityDetails_branchesSectionTitle;

  /// No description provided for @facilityDetails_languagesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get facilityDetails_languagesSectionTitle;

  /// No description provided for @facilityDetails_flowsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Flows'**
  String get facilityDetails_flowsSectionTitle;

  /// No description provided for @facilityDetails_amenitiesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Amenities'**
  String get facilityDetails_amenitiesSectionTitle;

  /// No description provided for @facilityDetails_actionsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get facilityDetails_actionsSectionTitle;

  /// No description provided for @facilityDetails_comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get facilityDetails_comingSoon;

  /// No description provided for @facilityDetails_appliedOn.
  ///
  /// In en, this message translates to:
  /// **'Applied on'**
  String get facilityDetails_appliedOn;

  /// No description provided for @facilityDetails_offer.
  ///
  /// In en, this message translates to:
  /// **'Offer'**
  String get facilityDetails_offer;

  /// No description provided for @facilityDetails_buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get facilityDetails_buy;

  /// No description provided for @facilityDetails_get.
  ///
  /// In en, this message translates to:
  /// **'Get'**
  String get facilityDetails_get;

  /// No description provided for @facilityDetails_descriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get facilityDetails_descriptionLabel;

  /// No description provided for @facilityDetails_contactFacility.
  ///
  /// In en, this message translates to:
  /// **'Contact {name}'**
  String facilityDetails_contactFacility(String name);

  /// No description provided for @facilityDetails_noTickets.
  ///
  /// In en, this message translates to:
  /// **'No tickets available'**
  String get facilityDetails_noTickets;

  /// No description provided for @facilityDetails_noPromotions.
  ///
  /// In en, this message translates to:
  /// **'No promotions available'**
  String get facilityDetails_noPromotions;

  /// No description provided for @facilityDetails_promotionAppliedOnTickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get facilityDetails_promotionAppliedOnTickets;

  /// No description provided for @facilityDetails_promotionAppliedOnPromotions.
  ///
  /// In en, this message translates to:
  /// **'Promotions'**
  String get facilityDetails_promotionAppliedOnPromotions;

  /// No description provided for @facilityDetails_promotionAppliedOnPackages.
  ///
  /// In en, this message translates to:
  /// **'Packages'**
  String get facilityDetails_promotionAppliedOnPackages;

  /// No description provided for @facilityDetails_promotionAppliedOnPurchases.
  ///
  /// In en, this message translates to:
  /// **'Purchases'**
  String get facilityDetails_promotionAppliedOnPurchases;

  /// No description provided for @facilityDetails_promotionAppliedOnAllTickets.
  ///
  /// In en, this message translates to:
  /// **'All Tickets'**
  String get facilityDetails_promotionAppliedOnAllTickets;

  /// No description provided for @facilityDetails_promotionAppliedOnAllPromotions.
  ///
  /// In en, this message translates to:
  /// **'All Promotions'**
  String get facilityDetails_promotionAppliedOnAllPromotions;

  /// No description provided for @facilityDetails_promotionAppliedOnAllPackages.
  ///
  /// In en, this message translates to:
  /// **'All Packages'**
  String get facilityDetails_promotionAppliedOnAllPackages;

  /// No description provided for @facilityDetails_promotionAppliedOnAllPurchases.
  ///
  /// In en, this message translates to:
  /// **'All Purchases'**
  String get facilityDetails_promotionAppliedOnAllPurchases;

  /// No description provided for @facilityDetails_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get facilityDetails_remaining;

  /// No description provided for @facilityDetails_ticketFallbackLabel.
  ///
  /// In en, this message translates to:
  /// **'Ticket'**
  String get facilityDetails_ticketFallbackLabel;

  /// No description provided for @facilityDetails_trackUpdates.
  ///
  /// In en, this message translates to:
  /// **'Track Updates'**
  String get facilityDetails_trackUpdates;

  /// No description provided for @facilityDetails_faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get facilityDetails_faqs;

  /// No description provided for @facilityDetails_allLevels.
  ///
  /// In en, this message translates to:
  /// **'All Levels'**
  String get facilityDetails_allLevels;

  /// No description provided for @facilityDetails_requirements.
  ///
  /// In en, this message translates to:
  /// **'Requirements'**
  String get facilityDetails_requirements;

  /// No description provided for @facilityDetails_locationsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Locations'**
  String get facilityDetails_locationsSectionTitle;

  /// No description provided for @facilityDetails_instructorsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Instructors'**
  String get facilityDetails_instructorsSectionTitle;

  /// No description provided for @facilityDetails_viewPricing.
  ///
  /// In en, this message translates to:
  /// **'View Pricing'**
  String get facilityDetails_viewPricing;

  /// No description provided for @facilityDetails_noActivities.
  ///
  /// In en, this message translates to:
  /// **'No activities available yet'**
  String get facilityDetails_noActivities;

  /// No description provided for @facilityDetails_noFlows.
  ///
  /// In en, this message translates to:
  /// **'No flows available yet'**
  String get facilityDetails_noFlows;

  /// No description provided for @facilityDetails_noCourses.
  ///
  /// In en, this message translates to:
  /// **'No courses available yet'**
  String get facilityDetails_noCourses;

  /// No description provided for @facilityDetails_folderTitle.
  ///
  /// In en, this message translates to:
  /// **'{name} ({count})'**
  String facilityDetails_folderTitle(String name, int count);

  /// No description provided for @purchase_title.
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get purchase_title;

  /// No description provided for @purchase_couponLabel.
  ///
  /// In en, this message translates to:
  /// **'Coupon'**
  String get purchase_couponLabel;

  /// No description provided for @purchase_selectCoupon.
  ///
  /// In en, this message translates to:
  /// **'Select Coupon ({count} Available)'**
  String purchase_selectCoupon(int count);

  /// No description provided for @purchase_loadingCoupons.
  ///
  /// In en, this message translates to:
  /// **'Loading coupons...'**
  String get purchase_loadingCoupons;

  /// No description provided for @purchase_noCoupon.
  ///
  /// In en, this message translates to:
  /// **'No Coupon'**
  String get purchase_noCoupon;

  /// No description provided for @purchase_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get purchase_quantity;

  /// No description provided for @purchase_invoiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Purchase Invoice'**
  String get purchase_invoiceTitle;

  /// No description provided for @purchase_invoiceLine.
  ///
  /// In en, this message translates to:
  /// **'{count}x {label}'**
  String purchase_invoiceLine(int count, String label);

  /// No description provided for @purchase_couponDiscount.
  ///
  /// In en, this message translates to:
  /// **'Coupon Discount'**
  String get purchase_couponDiscount;

  /// No description provided for @purchase_totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get purchase_totalAmount;

  /// No description provided for @purchase_depositAmount.
  ///
  /// In en, this message translates to:
  /// **'Deposit Amount'**
  String get purchase_depositAmount;

  /// No description provided for @purchase_directPurchase.
  ///
  /// In en, this message translates to:
  /// **'Direct Purchase'**
  String get purchase_directPurchase;

  /// No description provided for @purchase_onlinePayment.
  ///
  /// In en, this message translates to:
  /// **'Online Payment'**
  String get purchase_onlinePayment;

  /// No description provided for @purchase_depositPayment.
  ///
  /// In en, this message translates to:
  /// **'Deposit Payment'**
  String get purchase_depositPayment;

  /// No description provided for @purchase_stubSnackBar.
  ///
  /// In en, this message translates to:
  /// **'Payment integration is coming soon.'**
  String get purchase_stubSnackBar;

  /// No description provided for @facilitySchedule_flowCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No Flows} =1{1 Flow} other{{count} Flows}}'**
  String facilitySchedule_flowCount(int count);

  /// No description provided for @facilitySchedule_activityCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No Activities} =1{1 Activity} other{{count} Activities}}'**
  String facilitySchedule_activityCount(int count);

  /// No description provided for @facilitySchedule_courseCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No Courses} =1{1 Course} other{{count} Courses}}'**
  String facilitySchedule_courseCount(int count);

  /// No description provided for @facilitySchedule_ladiesOnly.
  ///
  /// In en, this message translates to:
  /// **'Ladies Only'**
  String get facilitySchedule_ladiesOnly;

  /// No description provided for @facilitySchedule_noFlows.
  ///
  /// In en, this message translates to:
  /// **'No flows scheduled on this day'**
  String get facilitySchedule_noFlows;

  /// No description provided for @facilitySchedule_noActivities.
  ///
  /// In en, this message translates to:
  /// **'No activities scheduled on this day'**
  String get facilitySchedule_noActivities;

  /// No description provided for @facilitySchedule_noCourses.
  ///
  /// In en, this message translates to:
  /// **'No courses scheduled on this day'**
  String get facilitySchedule_noCourses;

  /// No description provided for @facilitySchedule_waitingCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 waiting} other{{count} waiting}}'**
  String facilitySchedule_waitingCount(int count);

  /// No description provided for @facilitySchedule_customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get facilitySchedule_customers;

  /// No description provided for @facilitySchedule_waitlist.
  ///
  /// In en, this message translates to:
  /// **'Waitlist'**
  String get facilitySchedule_waitlist;

  /// No description provided for @facilitySchedule_note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get facilitySchedule_note;

  /// No description provided for @facilitySchedule_facilityLocation.
  ///
  /// In en, this message translates to:
  /// **'Facility Location'**
  String get facilitySchedule_facilityLocation;

  /// No description provided for @facilitySchedule_location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get facilitySchedule_location;

  /// No description provided for @facilitySchedule_reserveNowCta.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Reserve Now (1 Available Ticket)} other{Reserve Now ({count} Available Tickets)}}'**
  String facilitySchedule_reserveNowCta(int count);

  /// No description provided for @facilitySchedule_purchaseTicketsCta.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Purchase Tickets (1 Available Ticket)} other{Purchase Tickets ({count} Available Tickets)}}'**
  String facilitySchedule_purchaseTicketsCta(int count);

  /// No description provided for @facilitySchedule_joinWaitlist.
  ///
  /// In en, this message translates to:
  /// **'Join Waitlist'**
  String get facilitySchedule_joinWaitlist;

  /// No description provided for @facilitySchedule_leaveWaitlist.
  ///
  /// In en, this message translates to:
  /// **'Leave Waitlist'**
  String get facilitySchedule_leaveWaitlist;

  /// No description provided for @facilitySchedule_cancelReservation.
  ///
  /// In en, this message translates to:
  /// **'Cancel Reservation'**
  String get facilitySchedule_cancelReservation;

  /// No description provided for @facilitySchedule_contactFacility.
  ///
  /// In en, this message translates to:
  /// **'Contact {facility}'**
  String facilitySchedule_contactFacility(String facility);

  /// No description provided for @facilitySchedule_confirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm:'**
  String get facilitySchedule_confirmLabel;

  /// No description provided for @facilitySchedule_reservationLabel.
  ///
  /// In en, this message translates to:
  /// **'Reservation'**
  String get facilitySchedule_reservationLabel;

  /// No description provided for @facilitySchedule_confirmReservationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Review available purchase to confirm reservation.'**
  String get facilitySchedule_confirmReservationSubtitle;

  /// No description provided for @facilitySchedule_dateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get facilitySchedule_dateLabel;

  /// No description provided for @facilitySchedule_timeLabel.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get facilitySchedule_timeLabel;

  /// No description provided for @facilitySchedule_ticketLabel.
  ///
  /// In en, this message translates to:
  /// **'Ticket'**
  String get facilitySchedule_ticketLabel;

  /// No description provided for @facilitySchedule_ticketDue.
  ///
  /// In en, this message translates to:
  /// **'DUE'**
  String get facilitySchedule_ticketDue;

  /// No description provided for @facilitySchedule_ticketValidFor.
  ///
  /// In en, this message translates to:
  /// **'Valid for: {count} Day(s)'**
  String facilitySchedule_ticketValidFor(int count);

  /// No description provided for @facilitySchedule_ticketAddOns.
  ///
  /// In en, this message translates to:
  /// **'{count} Add-Ons'**
  String facilitySchedule_ticketAddOns(int count);

  /// No description provided for @facilitySchedule_cancellationPolicy.
  ///
  /// In en, this message translates to:
  /// **'Cancellation Policy'**
  String get facilitySchedule_cancellationPolicy;

  /// No description provided for @facilitySchedule_cancellationPolicyBody.
  ///
  /// In en, this message translates to:
  /// **'{facility} accepts any cancellation {hours} hours before the reservation. Used ticket will return to your account, and you will be able to reserve again if still available.'**
  String facilitySchedule_cancellationPolicyBody(String facility, int hours);

  /// No description provided for @nav_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get nav_home;

  /// No description provided for @nav_discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get nav_discover;

  /// No description provided for @nav_discounts.
  ///
  /// In en, this message translates to:
  /// **'Discounts'**
  String get nav_discounts;

  /// No description provided for @nav_account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get nav_account;

  /// No description provided for @nav_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get nav_profile;

  /// No description provided for @account_title.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account_title;

  /// No description provided for @account_calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get account_calendar;

  /// No description provided for @account_purchases.
  ///
  /// In en, this message translates to:
  /// **'Purchases'**
  String get account_purchases;

  /// No description provided for @account_coupons.
  ///
  /// In en, this message translates to:
  /// **'Coupons'**
  String get account_coupons;

  /// No description provided for @account_management.
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get account_management;

  /// No description provided for @account_information.
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get account_information;

  /// No description provided for @account_activityPreferences.
  ///
  /// In en, this message translates to:
  /// **'Activity Preferences'**
  String get account_activityPreferences;

  /// No description provided for @account_supportRequests.
  ///
  /// In en, this message translates to:
  /// **'Support Requests'**
  String get account_supportRequests;

  /// No description provided for @account_faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQ\'s'**
  String get account_faqs;

  /// No description provided for @account_termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get account_termsAndConditions;

  /// No description provided for @account_privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get account_privacyPolicy;

  /// No description provided for @account_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get account_logout;

  /// No description provided for @account_logoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get account_logoutConfirmTitle;

  /// No description provided for @account_logoutConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out of your account?'**
  String get account_logoutConfirmBody;

  /// No description provided for @account_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get account_cancel;

  /// No description provided for @calendar_title.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar_title;

  /// No description provided for @calendar_reservationCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No Reservations} =1{1 Reservation} other{{count} Reservations}}'**
  String calendar_reservationCount(int count);

  /// No description provided for @calendar_noReservations.
  ///
  /// In en, this message translates to:
  /// **'No reservations on this day'**
  String get calendar_noReservations;

  /// No description provided for @savedProfiles_title.
  ///
  /// In en, this message translates to:
  /// **'Profiles'**
  String get savedProfiles_title;

  /// No description provided for @savedProfiles_empty.
  ///
  /// In en, this message translates to:
  /// **'No saved profiles yet'**
  String get savedProfiles_empty;

  /// No description provided for @savedProfiles_emptyHint.
  ///
  /// In en, this message translates to:
  /// **'Save a facility from its profile to find it here.'**
  String get savedProfiles_emptyHint;

  /// No description provided for @savedProfiles_emptyForLine.
  ///
  /// In en, this message translates to:
  /// **'Nothing saved on this activity line'**
  String get savedProfiles_emptyForLine;

  /// No description provided for @savedProfiles_unsave.
  ///
  /// In en, this message translates to:
  /// **'Unsave'**
  String get savedProfiles_unsave;

  /// No description provided for @savedProfiles_unsaved.
  ///
  /// In en, this message translates to:
  /// **'Removed from your saved profiles'**
  String get savedProfiles_unsaved;

  /// No description provided for @savedProfiles_trackUpdates.
  ///
  /// In en, this message translates to:
  /// **'Track updates'**
  String get savedProfiles_trackUpdates;

  /// No description provided for @savedProfiles_trackingUpdates.
  ///
  /// In en, this message translates to:
  /// **'Tracking updates'**
  String get savedProfiles_trackingUpdates;

  /// No description provided for @discounts_title.
  ///
  /// In en, this message translates to:
  /// **'Discounts'**
  String get discounts_title;

  /// No description provided for @search_title.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search_title;

  /// No description provided for @search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search_hint;

  /// No description provided for @search_tabBusiness.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get search_tabBusiness;

  /// No description provided for @search_tabInstructor.
  ///
  /// In en, this message translates to:
  /// **'Instructor'**
  String get search_tabInstructor;

  /// No description provided for @search_tabService.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get search_tabService;

  /// No description provided for @search_tabLabel.
  ///
  /// In en, this message translates to:
  /// **'{label} ({count})'**
  String search_tabLabel(String label, int count);

  /// No description provided for @search_minCharacters.
  ///
  /// In en, this message translates to:
  /// **'Type at least {count} characters to search'**
  String search_minCharacters(int count);

  /// No description provided for @search_typeActivity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get search_typeActivity;

  /// No description provided for @search_typeFlow.
  ///
  /// In en, this message translates to:
  /// **'Flow'**
  String get search_typeFlow;

  /// No description provided for @search_typeCourse.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get search_typeCourse;

  /// No description provided for @search_noResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get search_noResults;

  /// No description provided for @search_noResultsHint.
  ///
  /// In en, this message translates to:
  /// **'Try a different keyword'**
  String get search_noResultsHint;

  /// No description provided for @facilityDetails_addressLocationSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Address & Location'**
  String get facilityDetails_addressLocationSectionTitle;

  /// No description provided for @facilityDetails_remoteLocationSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Remote Location'**
  String get facilityDetails_remoteLocationSectionTitle;

  /// No description provided for @facilityDetails_locationLink.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get facilityDetails_locationLink;

  /// No description provided for @facilityDetails_operatingIn.
  ///
  /// In en, this message translates to:
  /// **'Operating in:'**
  String get facilityDetails_operatingIn;

  /// No description provided for @facilityDetails_coverageAll.
  ///
  /// In en, this message translates to:
  /// **'ALL'**
  String get facilityDetails_coverageAll;

  /// No description provided for @facilityDetails_contactSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get facilityDetails_contactSectionTitle;

  /// No description provided for @facilityDetails_chooseNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a number'**
  String get facilityDetails_chooseNumberTitle;

  /// No description provided for @facilityDetails_linkFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open this link'**
  String get facilityDetails_linkFailed;

  /// No description provided for @facilityDetails_saveAdded.
  ///
  /// In en, this message translates to:
  /// **'Added to your profiles'**
  String get facilityDetails_saveAdded;

  /// No description provided for @facilityDetails_saveRemoved.
  ///
  /// In en, this message translates to:
  /// **'Removed from your profiles'**
  String get facilityDetails_saveRemoved;

  /// No description provided for @facilityDetails_saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update your saved profiles'**
  String get facilityDetails_saveFailed;

  /// No description provided for @facilityDetails_trackingOn.
  ///
  /// In en, this message translates to:
  /// **'You\'ll get this facility\'s updates'**
  String get facilityDetails_trackingOn;

  /// No description provided for @facilityDetails_trackingOff.
  ///
  /// In en, this message translates to:
  /// **'Updates turned off'**
  String get facilityDetails_trackingOff;

  /// No description provided for @facilityDetails_trackingFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update tracking'**
  String get facilityDetails_trackingFailed;

  /// No description provided for @facilityDetails_lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated: {date}'**
  String facilityDetails_lastUpdated(String date);

  /// No description provided for @facilityFaq_title.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get facilityFaq_title;

  /// No description provided for @facilityFaq_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Answers straight from {name}'**
  String facilityFaq_subtitle(String name);

  /// No description provided for @facilityFaq_empty.
  ///
  /// In en, this message translates to:
  /// **'No questions yet'**
  String get facilityFaq_empty;

  /// No description provided for @facilityFaq_emptyHint.
  ///
  /// In en, this message translates to:
  /// **'This facility hasn\'t published any FAQs.'**
  String get facilityFaq_emptyHint;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @purchase_success.
  ///
  /// In en, this message translates to:
  /// **'Purchase added to your account.'**
  String get purchase_success;

  /// No description provided for @purchase_dueNotice.
  ///
  /// In en, this message translates to:
  /// **'This purchase will be added to your account with payment due. No online payment will be collected here.'**
  String get purchase_dueNotice;

  /// No description provided for @facilitySchedule_actionUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Reservations are unavailable for this session.'**
  String get facilitySchedule_actionUnavailable;

  /// No description provided for @account_gifts.
  ///
  /// In en, this message translates to:
  /// **'Gifts'**
  String get account_gifts;
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
