import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

Future initFireBase () async {
  await Firebase.initializeApp().then((value) {
    Get.log("Firebase init successfully");
  });
  await FirebaseMessaging.instance.subscribeToTopic('test').then((value) {
    Get.log('done');
  });
  FirebaseMessaging.onMessage.listen((event) {
    print('\nmessage get : ${event.notification!.title}');
    Get.snackbar(
      event.notification!.title.toString(),
      event.notification!.body.toString(),
      onTap: (e) {},
      duration: const Duration(
        seconds: 5,
      ),
      colorText: SchedulerBinding.instance.window.platformBrightness ==
          Brightness.dark
          ? Colors.white
          : Colors.black,
      backgroundColor: SchedulerBinding.instance.window.platformBrightness ==
          Brightness.dark
          ? Colors.black
          : Colors.white,
    );

  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('\nmessage get : ${event.notification!.title}');
  });
  FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
    print('\nmessage get : ${message.notification!.title}');
    Get.snackbar(message.notification!.title!, message.notification!.body!);
  });

}