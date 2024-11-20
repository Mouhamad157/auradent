import 'package:flutter/material.dart';
import '../const/app_gradient.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../const/app_color.dart';

class AppTheme {
  static AppTheme? _instance;

  AppTheme._();

  factory AppTheme() => _instance ??= AppTheme._();

  ThemeData get theme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColors.primary,
        ),
        primaryColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        useMaterial3: true,
      );
}

extension CustomThemes on ThemeData {
  Gradient get appBarGradient => AppGradient.appBarGradient;

  BoxDecoration get borderDecoration => BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: AppColors.primary)
              );

  BoxDecoration get greyContainerDecoration => BoxDecoration(
      color: AppColors.appGrey.withOpacity(0.25),
      borderRadius: BorderRadius.circular(2.5.w));

  TextStyle get bodyTitleStyle => TextStyle(
      fontSize: 16.spa, color: primaryColor, fontWeight: FontWeight.bold);

  BoxShadow get buttonShadow => BoxShadow(
      offset: const Offset(1, 1),
      blurRadius: 5,
      spreadRadius: 1,
      color: AppColors.black.withOpacity(0.35));

  // AlignmentGeometry get containerTextAlignment =>
  //     StorageHandler().lang.toLowerCase() == 'en'
  //         ? Alignment.centerLeft
  //         : Alignment.centerRight;

  Color get backButtonColor => AppColors.primary;
}
