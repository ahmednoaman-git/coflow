// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get welcomeTo => 'مرحباً بك في';

  @override
  String get inoPeople => 'InoPeople';

  @override
  String get onboardingStepOneDescription => 'تتبع الحضور اليومي بسلاسة';

  @override
  String get onboardingStepTwoDescription => 'إدارة طلبات الإجازة، الخطابات، القروض والمزيد بسهولة';

  @override
  String get onboardingStepThreeDescription => 'مراقبة قسائم راتبك ومصروفاتك بسهولة';

  @override
  String get attendanceTitle => 'الحضور';

  @override
  String get attendanceDayShortSunday => 'ح';

  @override
  String get attendanceDayShortMonday => 'ن';

  @override
  String get attendanceDayShortTuesday => 'ث';

  @override
  String get attendanceDayShortWednesday => 'ر';

  @override
  String get attendanceDayShortThursday => 'خ';

  @override
  String get attendanceDayShortFriday => 'ج';

  @override
  String get attendanceDayShortSaturday => 'س';

  @override
  String get getStarted => 'ابدأ';

  @override
  String get requestsTitle => 'الطلبات';

  @override
  String get payslipsTitle => 'قسائم الراتب';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get loginSubtitle => 'أدخل بياناتك للمتابعة';

  @override
  String get employeeId => 'رقم الموظف';

  @override
  String get employeeIdHint => 'أدخل رقم الموظف';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordHint => 'أدخل كلمة المرور';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get loginButton => 'تسجيل الدخول';

  @override
  String get tenantInputTitle => 'ابدأ مع InoPeople ESS!';

  @override
  String get tenantInputSubtitle => 'لنبدأ معاً — أدخل معرف الشركة للمتابعة!';

  @override
  String get tenantIdHint => 'مثال: اسم الشركة';

  @override
  String get submit => 'إرسال';

  @override
  String get somethingWentWrong => 'حدث خطأ ما';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get tenantIdRequired => 'الرجاء إدخال معرف الشركة';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailHint => 'أدخل بريدك الإلكتروني';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get basicInfo => 'المعلومات الأساسية';

  @override
  String get basicInfoSubtitle => 'لنبدأ ببياناتك الأساسية';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get fullNameHint => 'أدخل اسمك الكامل';

  @override
  String get next => 'التالي';

  @override
  String get profileDetails => 'تفاصيل الملف الشخصي';

  @override
  String get profileDetailsSubtitle => 'أخبرنا المزيد عنك';

  @override
  String get gender => 'الجنس';

  @override
  String get genderMale => 'ذكر';

  @override
  String get genderFemale => 'أنثى';

  @override
  String get birthdate => 'تاريخ الميلاد';

  @override
  String get birthdateHint => 'اختر تاريخ ميلادك';

  @override
  String get nationality => 'الجنسية';

  @override
  String get nationalityHint => 'اختر جنسيتك';

  @override
  String get phone => 'رقم الهاتف';

  @override
  String get phoneHint => 'أدخل رقم هاتفك';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get verifyEmail => 'تأكيد البريد الإلكتروني';

  @override
  String otpSentTo(String email) {
    return 'لقد أرسلنا رمز التحقق إلى $email';
  }

  @override
  String get otpCode => 'رمز التحقق';

  @override
  String get otpCodeHint => 'أدخل الرمز المكون من 6 أرقام';

  @override
  String get resendOtp => 'إعادة إرسال الرمز';

  @override
  String get sending => 'جاري الإرسال...';

  @override
  String get otpSent => 'تم إرسال رمز التحقق بنجاح';

  @override
  String get registrationSuccess => 'تم التسجيل بنجاح! يرجى تسجيل الدخول للمتابعة.';

  @override
  String get searchCountry => 'ابحث عن الدولة...';

  @override
  String get noCountriesFound => 'لم يتم العثور على دول';

  @override
  String get selectCountry => 'اختر الدولة';

  @override
  String get welcome => 'أهلاً،';

  @override
  String get businesses => 'الأعمال';

  @override
  String get instructors => 'المدربين';

  @override
  String allLocation(String country) {
    return 'الكل . $country';
  }

  @override
  String get sky => 'السماء';

  @override
  String get sea => 'البحر';

  @override
  String get earth => 'الأرض';

  @override
  String get energy => 'الطاقة';

  @override
  String get locations => 'المواقع';

  @override
  String get selectGovernorateArea => 'اختر المحافظة/المنطقة';

  @override
  String get all => 'الكل';

  @override
  String get remote => 'عن بعد';

  @override
  String get confirm => 'تأكيد';

  @override
  String get activityLineSky => 'السماء';

  @override
  String get activityLineSea => 'البحر';

  @override
  String get activityLineEarth => 'الأرض';

  @override
  String get activityLineEnergy => 'الطاقة';

  @override
  String selectedCount(int count) {
    return '$count محدد';
  }

  @override
  String remoteWithCount(int count) {
    return 'عن بعد ($count)';
  }

  @override
  String get facility_temporarilyClosed => 'مغلق مؤقتاً';

  @override
  String get facilityDetails_profileTab => 'الملف الشخصي';

  @override
  String get facilityDetails_activitiesTab => 'الأنشطة';

  @override
  String get facilityDetails_flowsTab => 'التدفقات';

  @override
  String get facilityDetails_coursesTab => 'الدورات';

  @override
  String get facilityDetails_pricingTab => 'الأسعار';

  @override
  String get facilityDetails_scheduleTab => 'الجدول';

  @override
  String get facilityDetails_calendarTab => 'التقويم';

  @override
  String get facilityDetails_ticketPrice => 'سعر التذكرة';

  @override
  String get facilityDetails_addOns => 'الإضافات';

  @override
  String get facilityDetails_access => 'الوصول';

  @override
  String get facilityDetails_conditions => 'الشروط';

  @override
  String get facilityDetails_validity => 'الصلاحية';

  @override
  String get facilityDetails_promotionPrice => 'سعر العرض';

  @override
  String get facilityDetails_purchase => 'شراء';

  @override
  String get facilityDetails_purchaseNow => 'اشترِ الآن';

  @override
  String get facilityDetails_tickets => 'التذاكر';

  @override
  String get facilityDetails_promotions => 'العروض';

  @override
  String get facilityDetails_seeMore => 'عرض المزيد';

  @override
  String get facilityDetails_seeLess => 'عرض أقل';

  @override
  String facilityDetails_accessPrefix(int count) {
    return 'الوصول: $count خدمات';
  }

  @override
  String get facilityDetails_unlimited => 'غير محدود';

  @override
  String get facilityDetails_unknown => 'غير معروف';

  @override
  String facilityDetails_days(int count) {
    return '$count أيام';
  }

  @override
  String facilityDetails_likesCount(int count) {
    return '$count إعجابات';
  }

  @override
  String get facilityDetails_teamSectionTitle => 'الفريق';

  @override
  String get facilityDetails_operatingHoursSectionTitle => 'ساعات العمل';

  @override
  String get facilityDetails_locationSectionTitle => 'الموقع';

  @override
  String get facilityDetails_branchesSectionTitle => 'الفروع';

  @override
  String get facilityDetails_languagesSectionTitle => 'اللغات';

  @override
  String get facilityDetails_flowsSectionTitle => 'التدفقات';

  @override
  String get facilityDetails_amenitiesSectionTitle => 'المرافق';

  @override
  String get facilityDetails_actionsSectionTitle => 'الإجراءات';

  @override
  String get facilityDetails_comingSoon => 'قريباً';

  @override
  String get facilityDetails_appliedOn => 'مطبق على';

  @override
  String get facilityDetails_offer => 'العرض';

  @override
  String get facilityDetails_buy => 'شراء';

  @override
  String get facilityDetails_get => 'احصل على';

  @override
  String get facilityDetails_descriptionLabel => 'الوصف';

  @override
  String facilityDetails_contactFacility(String name) {
    return 'تواصل مع $name';
  }

  @override
  String get facilityDetails_noTickets => 'لا توجد تذاكر متاحة';

  @override
  String get facilityDetails_noPromotions => 'لا توجد عروض متاحة';

  @override
  String get facilityDetails_promotionAppliedOnTickets => 'التذاكر';

  @override
  String get facilityDetails_promotionAppliedOnPromotions => 'العروض';

  @override
  String get facilityDetails_promotionAppliedOnPackages => 'الباقات';

  @override
  String get facilityDetails_promotionAppliedOnPurchases => 'المشتريات';

  @override
  String get facilityDetails_promotionAppliedOnAllTickets => 'كل التذاكر';

  @override
  String get facilityDetails_promotionAppliedOnAllPromotions => 'كل العروض';

  @override
  String get facilityDetails_promotionAppliedOnAllPackages => 'كل الباقات';

  @override
  String get facilityDetails_promotionAppliedOnAllPurchases => 'كل المشتريات';

  @override
  String get facilityDetails_remaining => 'المتبقي';

  @override
  String get facilityDetails_ticketFallbackLabel => 'تذكرة';

  @override
  String get facilityDetails_trackUpdates => 'تتبع التحديثات';

  @override
  String get facilityDetails_faqs => 'الأسئلة الشائعة';

  @override
  String get facilityDetails_allLevels => 'كل المستويات';

  @override
  String get facilityDetails_requirements => 'المتطلبات';

  @override
  String get facilityDetails_locationsSectionTitle => 'المواقع';

  @override
  String get facilityDetails_instructorsSectionTitle => 'المدربون';

  @override
  String get facilityDetails_viewPricing => 'عرض الأسعار';

  @override
  String get facilityDetails_noActivities => 'لا توجد أنشطة متاحة حاليًا';

  @override
  String get facilityDetails_noFlows => 'لا توجد تدفقات متاحة حاليًا';

  @override
  String get facilityDetails_noCourses => 'لا توجد دورات متاحة حاليًا';

  @override
  String facilityDetails_folderTitle(String name, int count) {
    return '$name ($count)';
  }

  @override
  String get purchase_title => 'الشراء';

  @override
  String get purchase_couponLabel => 'الكوبون';

  @override
  String purchase_selectCoupon(int count) {
    return 'اختر كوبونًا ($count متاح)';
  }

  @override
  String get purchase_loadingCoupons => 'جارٍ تحميل الكوبونات...';

  @override
  String get purchase_noCoupon => 'بدون كوبون';

  @override
  String get purchase_quantity => 'الكمية';

  @override
  String get purchase_invoiceTitle => 'فاتورة الشراء';

  @override
  String purchase_invoiceLine(int count, String label) {
    return '$count× $label';
  }

  @override
  String get purchase_couponDiscount => 'خصم الكوبون';

  @override
  String get purchase_totalAmount => 'المبلغ الإجمالي';

  @override
  String get purchase_depositAmount => 'مبلغ العربون';

  @override
  String get purchase_directPurchase => 'شراء مباشر';

  @override
  String get purchase_onlinePayment => 'دفع إلكتروني';

  @override
  String get purchase_depositPayment => 'دفع عربون';

  @override
  String get purchase_stubSnackBar => 'الدفع الإلكتروني قادم قريبًا.';

  @override
  String facilitySchedule_flowCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تدفق',
      many: '$count تدفقًا',
      few: '$count تدفقات',
      two: 'تدفقان',
      one: 'تدفق واحد',
      zero: 'لا توجد تدفقات',
    );
    return '$_temp0';
  }

  @override
  String facilitySchedule_activityCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نشاط',
      many: '$count نشاطًا',
      few: '$count أنشطة',
      two: 'نشاطان',
      one: 'نشاط واحد',
      zero: 'لا توجد أنشطة',
    );
    return '$_temp0';
  }

  @override
  String facilitySchedule_courseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دورة',
      many: '$count دورة',
      few: '$count دورات',
      two: 'دورتان',
      one: 'دورة واحدة',
      zero: 'لا توجد دورات',
    );
    return '$_temp0';
  }

  @override
  String get facilitySchedule_ladiesOnly => 'للسيدات فقط';

  @override
  String get facilitySchedule_noFlows => 'لا توجد تدفقات في هذا اليوم';

  @override
  String get facilitySchedule_noActivities => 'لا توجد أنشطة في هذا اليوم';

  @override
  String get facilitySchedule_noCourses => 'لا توجد دورات في هذا اليوم';

  @override
  String facilitySchedule_waitingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count في الانتظار',
      many: '$count في الانتظار',
      few: '$count في الانتظار',
      two: 'اثنان في الانتظار',
      one: 'واحد في الانتظار',
    );
    return '$_temp0';
  }

  @override
  String get facilitySchedule_customers => 'العملاء';

  @override
  String get facilitySchedule_waitlist => 'قائمة الانتظار';

  @override
  String get facilitySchedule_note => 'ملاحظة';

  @override
  String get facilitySchedule_facilityLocation => 'موقع المنشأة';

  @override
  String get facilitySchedule_location => 'الموقع';

  @override
  String facilitySchedule_reserveNowCta(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'احجز الآن ($count تذكرة متاحة)',
      many: 'احجز الآن ($count تذكرة متاحة)',
      few: 'احجز الآن ($count تذاكر متاحة)',
      two: 'احجز الآن (تذكرتان متاحتان)',
      one: 'احجز الآن (تذكرة متاحة واحدة)',
    );
    return '$_temp0';
  }

  @override
  String facilitySchedule_purchaseTicketsCta(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'شراء تذاكر ($count تذكرة متاحة)',
      many: 'شراء تذاكر ($count تذكرة متاحة)',
      few: 'شراء تذاكر ($count تذاكر متاحة)',
      two: 'شراء تذاكر (تذكرتان متاحتان)',
      one: 'شراء تذاكر (تذكرة متاحة واحدة)',
    );
    return '$_temp0';
  }

  @override
  String get facilitySchedule_joinWaitlist => 'انضم لقائمة الانتظار';

  @override
  String get facilitySchedule_leaveWaitlist => 'مغادرة قائمة الانتظار';

  @override
  String get facilitySchedule_cancelReservation => 'إلغاء الحجز';

  @override
  String facilitySchedule_contactFacility(String facility) {
    return 'تواصل مع $facility';
  }

  @override
  String get facilitySchedule_confirmLabel => 'تأكيد:';

  @override
  String get facilitySchedule_reservationLabel => 'الحجز';

  @override
  String get facilitySchedule_confirmReservationSubtitle => 'راجع الشراء المتاح لتأكيد الحجز.';

  @override
  String get facilitySchedule_dateLabel => 'التاريخ';

  @override
  String get facilitySchedule_timeLabel => 'الوقت';

  @override
  String get facilitySchedule_ticketLabel => 'التذكرة';

  @override
  String get facilitySchedule_ticketDue => 'مستحقة';

  @override
  String facilitySchedule_ticketValidFor(int count) {
    return 'صالحة لمدة: $count يوم';
  }

  @override
  String facilitySchedule_ticketAddOns(int count) {
    return '$count إضافات';
  }

  @override
  String get facilitySchedule_cancellationPolicy => 'سياسة الإلغاء';

  @override
  String facilitySchedule_cancellationPolicyBody(String facility, int hours) {
    return 'تقبل $facility أي إلغاء قبل $hours ساعات من الحجز. ستعود التذكرة المستخدمة إلى حسابك، وسيمكنك الحجز مرة أخرى إذا كان المكان لا يزال متاحًا.';
  }

  @override
  String get nav_home => 'الرئيسية';

  @override
  String get nav_discover => 'استكشف';

  @override
  String get nav_discounts => 'الخصومات';

  @override
  String get nav_account => 'الحساب';

  @override
  String get nav_profile => 'ملفي';

  @override
  String get account_title => 'الحساب';

  @override
  String get account_calendar => 'التقويم';

  @override
  String get account_purchases => 'المشتريات';

  @override
  String get account_coupons => 'الكوبونات';

  @override
  String get account_management => 'الإدارة';

  @override
  String get account_information => 'معلومات الحساب';

  @override
  String get account_activityPreferences => 'تفضيلات النشاط';

  @override
  String get account_supportRequests => 'طلبات الدعم';

  @override
  String get account_faqs => 'الأسئلة الشائعة';

  @override
  String get account_termsAndConditions => 'الشروط والأحكام';

  @override
  String get account_privacyPolicy => 'سياسة الخصوصية';

  @override
  String get account_logout => 'تسجيل الخروج';

  @override
  String get account_logoutConfirmTitle => 'تسجيل الخروج';

  @override
  String get account_logoutConfirmBody => 'هل أنت متأكد أنك تريد تسجيل الخروج من حسابك؟';

  @override
  String get account_cancel => 'إلغاء';

  @override
  String get calendar_title => 'التقويم';

  @override
  String calendar_reservationCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حجز',
      many: '$count حجزًا',
      few: '$count حجوزات',
      two: 'حجزان',
      one: 'حجز واحد',
      zero: 'لا توجد حجوزات',
    );
    return '$_temp0';
  }

  @override
  String get calendar_noReservations => 'لا توجد حجوزات في هذا اليوم';

  @override
  String get savedProfiles_title => 'الملفات';

  @override
  String get savedProfiles_empty => 'لا توجد ملفات محفوظة بعد';

  @override
  String get savedProfiles_emptyHint => 'احفظ منشأة من صفحتها لتجدها هنا.';

  @override
  String get savedProfiles_emptyForLine => 'لا توجد ملفات محفوظة في هذا الخط';

  @override
  String get savedProfiles_unsave => 'إلغاء الحفظ';

  @override
  String get savedProfiles_unsaved => 'تمت الإزالة من ملفاتك المحفوظة';

  @override
  String get savedProfiles_trackUpdates => 'تتبع التحديثات';

  @override
  String get savedProfiles_trackingUpdates => 'يتم تتبع التحديثات';

  @override
  String get discounts_title => 'الخصومات';

  @override
  String get search_title => 'البحث';

  @override
  String get search_hint => 'ابحث';

  @override
  String get search_tabBusiness => 'المنشآت';

  @override
  String get search_tabInstructor => 'المدربون';

  @override
  String get search_tabService => 'الخدمات';

  @override
  String search_tabLabel(String label, int count) {
    return '$label ($count)';
  }

  @override
  String search_minCharacters(int count) {
    return 'اكتب $count أحرف على الأقل للبحث';
  }

  @override
  String get search_typeActivity => 'نشاط';

  @override
  String get search_typeFlow => 'تدفق';

  @override
  String get search_typeCourse => 'دورة';

  @override
  String get search_noResults => 'لا توجد نتائج';

  @override
  String get search_noResultsHint => 'جرّب كلمة أخرى';

  @override
  String get facilityDetails_addressLocationSectionTitle => 'العنوان والموقع';

  @override
  String get facilityDetails_remoteLocationSectionTitle => 'موقع متنقل';

  @override
  String get facilityDetails_locationLink => 'الرابط';

  @override
  String get facilityDetails_operatingIn => 'يعمل في:';

  @override
  String get facilityDetails_coverageAll => 'الكل';

  @override
  String get facilityDetails_contactSectionTitle => 'التواصل';

  @override
  String get facilityDetails_chooseNumberTitle => 'اختر رقمًا';

  @override
  String get facilityDetails_linkFailed => 'تعذّر فتح هذا الرابط';

  @override
  String get facilityDetails_saveAdded => 'تمت الإضافة إلى ملفاتك';

  @override
  String get facilityDetails_saveRemoved => 'تمت الإزالة من ملفاتك';

  @override
  String get facilityDetails_saveFailed => 'تعذّر تحديث ملفاتك المحفوظة';

  @override
  String get facilityDetails_trackingOn => 'سيصلك كل جديد من هذه المنشأة';

  @override
  String get facilityDetails_trackingOff => 'تم إيقاف التحديثات';

  @override
  String get facilityDetails_trackingFailed => 'تعذّر تحديث التتبع';

  @override
  String facilityDetails_lastUpdated(String date) {
    return 'آخر تحديث: $date';
  }

  @override
  String get facilityFaq_title => 'الأسئلة الشائعة';

  @override
  String facilityFaq_subtitle(String name) {
    return 'إجابات مباشرة من $name';
  }

  @override
  String get facilityFaq_empty => 'لا توجد أسئلة بعد';

  @override
  String get facilityFaq_emptyHint => 'لم تنشر هذه المنشأة أي أسئلة شائعة.';

  @override
  String get comingSoon => 'قريبًا';

  @override
  String get purchase_success => 'تمت إضافة عملية الشراء إلى حسابك.';

  @override
  String get purchase_dueNotice =>
      'ستُضاف عملية الشراء إلى حسابك كمبلغ مستحق. لن يتم تحصيل دفع إلكتروني هنا.';

  @override
  String get facilitySchedule_actionUnavailable => 'الحجز غير متاح لهذه الجلسة.';

  @override
  String get account_gifts => 'الهدايا';
}
