import 'package:auradent/core/translation/language_controller.dart';
import 'package:auradent/modules/home/presentation/manager/home/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../pages/register_page.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  LanguageController languageController = Get.find();

  void arabic() {
    languageController.changeToArabic();
  }

  void english() {
    languageController.changeToEnglish();
  }

  void login() async {
    Get.toNamed(HomePage.name);
  }

  void register() async {
    Get.toNamed(RegisterPage.name);
  }
}
