import 'app_color.dart';
import 'package:flutter/material.dart';

class AppGradient {
  static const LinearGradient appBarGradient = LinearGradient(colors: [
    AppColors.primary,
    AppColors.secondary,
  ]);
  static const LinearGradient containerGradient = LinearGradient(
    colors: [
      AppColors.primary,
      AppColors.black,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient secondContainerGradient = LinearGradient(
      colors: [
        AppColors.black,
        AppColors.primary,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0]);
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      AppColors.purple,
      AppColors.primary,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient drawerGradient = LinearGradient(
    colors: [
      AppColors.orangeStartGradient,
      AppColors.orangeEndGradient,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static const LinearGradient buttonsGradient = LinearGradient(colors: [
    AppColors.orangeEndGradient,
    AppColors.orangeStartGradient,
  ]);
}
