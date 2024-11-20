import 'dart:ui';
import 'package:get/get.dart';
import '../storage/storage_handler.dart';

class LanguageController extends GetxController {
  late Locale locale;

  void changeToArabic() async {
    Get.updateLocale(const Locale('ar', 'SA'));
    await StorageHandler().setLanguage('ar');
  }

  void changeToEnglish() async {
    Get.updateLocale(const Locale('en', 'US'));
    await StorageHandler().setLanguage('en');
  }

  void init() {
    String tmp = StorageHandler().language;
    print(tmp);
    if (tmp == 'en') {
      locale = const Locale('en', 'US');
    } else {
      locale = const Locale('ar', 'SA');
    }
  }

  Locale get language => locale;

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
