import '../const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class AppSnackBar {
  static void failure(BuildContext context, {String? msg, String? title}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.transparent,
      content: AwesomeSnackbarContent(
        title: title ?? 'On Snap!',
        message: msg ??
            'This is an example error message that will be shown in the body of snackbar!',
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void success(BuildContext context, {String? msg, String? title}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.transparent,
      content: AwesomeSnackbarContent(
        title: title ?? 'Oh Hey!!!',
        message: msg ??
            'This is an example error message that will be shown in the body of snackbar!',
        contentType: ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void warning(BuildContext context, {String? msg, String? title}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.transparent,
      content: AwesomeSnackbarContent(
        title: title ?? 'Oh Hey!!!',
        message: msg ??
            'This is an example error message that will be shown in the body of snackbar!',
        contentType: ContentType.warning,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
