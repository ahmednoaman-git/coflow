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
  String get onboardingStepTwoDescription =>
      'إدارة طلبات الإجازة، الخطابات، القروض والمزيد بسهولة';

  @override
  String get onboardingStepThreeDescription =>
      'مراقبة قسائم راتبك ومصروفاتك بسهولة';

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
  String get registrationSuccess =>
      'تم التسجيل بنجاح! يرجى تسجيل الدخول للمتابعة.';
}
