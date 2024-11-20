
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../env/environment.dart';

Future<void> showLoader() async =>await Get.dialog(
    WillPopScope(
      onWillPop: () async{
        return Environment.closeLoader;
      },
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    )
);

Future<void> showSnackBar(String content) async => ScaffoldMessenger.of(Get.context!)
    .showSnackBar(SnackBar(content: Text(content)));