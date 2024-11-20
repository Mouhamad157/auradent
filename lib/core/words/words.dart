import 'package:get/get.dart';

class ErrorWords {
  static const String noInternet = "No Internet connection, try again later";
  static const String error = "An unexpected error occurred, try again later";
  static const String tryAgain = "try again";
  static const String success = "The operation was completed successfully";
}

class AppWord {
  static const String invalidUserName = "invalid user name";
  static const String invalidPhoneNumber = "invalid user phone (09 xxxx xxxx) ";
  static const String invalidEmail = "invalid email example@mail.com ";
  static const String notNumber = "invalid number";
  static const String empty = "no data , please add some data";
  static const String passwordIsNotMatch = "passwords don\'t matches";
  static const String verve = "Verve";
  static const String slogan = "Verve: Where Every Swipe Sparks Joy!";

  static String invalidLength(int length) =>
      "لا يمكن أن تكون أقل من $length أحرف ";

  static String get goBack => "الرجوع".tr;

  static String get email => "البريد الالكتروني".tr;

  static String get auraDent => "AURADENT".tr;
  
  static String get exit => "خروج".tr;

  static String get pleaseLogin => "الرجاء تسجيل الدخول بحسابك".tr;

  static String get pleaseCreate => "الرجاء إنشاء حساب جديد".tr;

  static String get username => "اسم المستخدم".tr;

  static String get signup => "تسجيل ".tr;

  static String get confirm => "تأكيد".tr;

  static String get resetPassword => 'إعادة تعيين كلمة السر'.tr;

  static String get enterNewPassword => 'أدخل كلمة السر الجديدة'.tr;

  static String get newPassword => 'كلمة السر الجديدة'.tr;

  static String get confirmPassword => 'تأكيد كلمة السر'.tr;

  static String get continueNext => 'متابعة'.tr;

  static String get done => 'تم'.tr;

  static String get phoneNumber => 'رقم الهاتف'.tr;

  static String get password => 'كلمة السر'.tr;

  static String get forgotPassword => 'نسيت كلمة السر؟'.tr;

  static String get login => 'تسجيل الدخول'.tr;

  static String get logout => 'تسجيل الخروج'.tr;

  static String get or => 'أو'.tr;

  static String get signupByParents => 'حساب جديد عن طريق الأهل'.tr;

  static String get doNotHaveAccount => 'ليس لديك حساب ؟ '.tr;

  static String get createAccount => 'إنشاء حساب'.tr;

  static String get createNewAccount => 'إنشاء حساب جديد'.tr;

  static String get name => 'الاسم'.tr;

  static String get fatherName => 'اسم الأب'.tr;

  static String get nickName => 'اسم العائلة'.tr;

  static String get backToLogin => 'العودة الى تسجيل الدخول'.tr;

  static String get haveAProblemWhileLogin => 'لديك مشكلة في الدخول'.tr;

  static String get enterYourPhoneNumber => 'أدخل رقم هاتفك'.tr;

  static String get sendVerificationCode => 'إرسال رمز التحقق'.tr;

  static String get home => 'home'.tr;

  static String get search => 'بحث'.tr;

  static String get chat => 'chat'.tr;

  static String get notification => 'notification'.tr;

  static String get profile => 'profile'.tr;

  static String get additionalInformation => 'معلومات إضافية'.tr;

  static String get classroom => 'الصف'.tr;

  static String get motherName => 'اسم الأم'.tr;

  static String get birthDate => 'تاريخ الميلاد'.tr;

  static String get gender => 'الجنس'.tr;

  static String get studentIdentifier => 'الرقم الطلابي'.tr;

  static String get state => 'المحافظة'.tr;

  static String get school => 'المدرسة'.tr;

  static String get academicBranch => 'الفرع الدراسي'.tr;

  static String get motherPhoneNumber => 'رقم هاتف الأم'.tr;

  static String get fatherPhoneNumber => 'رقم هاتف الأب'.tr;

  static String get hobbies => 'الهوايات'.tr;

  static String get sport => 'رياضة'.tr;

  static String get music => 'موسيقى'.tr;

  static String get skip => 'تخطي'.tr;

  static String get teachers => 'الأساتذة'.tr;

  static String get friends => 'الأصدقاء'.tr;

  static String get friend => 'صديق'.tr;

  static String get options => 'خيارات'.tr;

  static String get scientificSubjects => 'المواد العلمية'.tr;

  static String get studentWallet => 'محفظة الطالب'.tr;

  static String get mutualFriend => 'صديق مشترك'.tr;

  static String get addFriend => 'إضافة صديق'.tr;

  static String get delete => 'حذف'.tr;

  static String get friendsRequest => 'طلبات الصداقة'.tr;

  static String get block => 'حظر'.tr;

  static String get unFriend => ' إلغاء الصداقة'.tr;

  static String get videoCall => ' مكالمة فيديو'.tr;

  static String get audioCall => ' مكالمة صوتية'.tr;

  static String get about => ' حول'.tr;

  static String get posts => ' المنشورات'.tr;

  static String get photos => ' الصور'.tr;

  static String get editProfile => 'تعديل الملف الشخصي'.tr;

  static String get followTeacher => 'متابعة الأستاذ'.tr;

  static String get copyProfileLink => 'نسخ رابط البروفايل'.tr;

  static String get lessons => 'شروحات'.tr;

  static String get challenges => 'تحديات'.tr;

  static String get videos => 'فيديوهات'.tr;

  static String get live => 'بث مباشر'.tr;

  static String get subjects => 'المواد الدراسية'.tr;

  static String get progress => 'الإنجاز'.tr;

  static String get startRoad => 'بدء المسار'.tr;

  static String get resumeRoad => 'استكمال المسار'.tr;

  static String get roadDone => 'انتهى المسار'.tr;

  static String get myClass => 'الصف'.tr;

  static String get sortBy => 'ترتيب'.tr;

  static String get selectClass => 'اختيار الدرس'.tr;

  static String get basicInfo => 'المعلومات الأساسية'.tr;

  static String get secondInfo => 'المعلومات الثانوية'.tr;

  static String get learningAndLocation => 'التعليم ومكان الإقامة'.tr;

  static String get town => 'المدينة'.tr;

  static String get images => 'الصور'.tr;

  static String get showAll => 'عرض الكل'.tr;

  static String get searchFriends => 'البحث عن أصدقاء'.tr;

  static String get friendsFrom => 'أصدقاء منذ '.tr;
}
