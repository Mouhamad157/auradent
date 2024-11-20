// ignore_for_file: library_prefixes

import 'dart:io';
import 'package:flutter/cupertino.dart' as IOS;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/app_color.dart';
import 'app_text.dart';

class AppExitDialog {
  static Future<bool> ensureExitForAndroid() async {
    return await Get.defaultDialog(
        title: 'التأكيد',
        titleStyle: const AppText(
          text: '',
          fontWeight: FontWeight.w600,
        ).style,
        cancel: ElevatedButton(
          onPressed: () {
            Get.log('Quiting app');
            exit(0);
          },
          child: const AppText(
            text: 'نعم',
            color: AppColors.appFontBlack,
          ),
        ) ,
        confirm: ElevatedButton(
          onPressed: () {
            Get.log('Stay in app');
            Get.back();
          },
          child: const AppText(
            text: 'لا',
            color: AppColors.appFontBlack,
          ),
        ),
        content: const AppText(text: 'هل تريد الخروج من التطبيق؟'));
  }

  static Future<bool> ensureExitForIOS() async {
    return await IOS.showCupertinoModalPopup(
      context: Get.context!,
      builder: (context) => IOS.CupertinoAlertDialog(
        title: const AppText(text: 'التأكيد'),
        content: const AppText(text: 'هل تريد الخروج من التطبيق؟'),
        actions: <IOS.CupertinoDialogAction>[
          IOS.CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Get.back();
            },
            child: const AppText(
              text: 'لا',
            ),
          ),
          IOS.CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              exit(0);
            },
            child: const AppText(
              text: 'نعم',
            ),
          ),
        ],
      ),
    );
  }

  static Future<bool> ensureExit() {
    return GetPlatform.isIOS ? ensureExitForIOS() : ensureExitForAndroid();
  }
}
