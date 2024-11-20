import 'package:auradent/core/storage/storage_handler.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'core/pages/app_pages.dart';
import 'core/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'core/translation/language_controller.dart';
import 'core/translation/translation.dart';
Size size = const Size(1600, 900);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions =  WindowOptions(
    backgroundColor: Colors.transparent,
    title: 'AURADENT',
    windowButtonVisibility: true,
    size: size,
    minimumSize: size,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  await StorageHandler.init();
  runApp(const AuraDent());
}

class AuraDent extends StatelessWidget {
  const AuraDent({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Dictionary(),
      locale: Get.find<LanguageController>().language,
      theme: AppTheme().theme,
      onInit: onInit,
      getPages: appPages,
    );
  }

  onInit() {}
}
