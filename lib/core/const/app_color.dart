import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Colors.black;
  static const Color primary = Color(0xff0F6CBD);
  static const Color secondary = Colors.deepPurple;
  static const Color beige = Color(0xFFF3E3C0);
  static const Color blue = Color(0xFF000080);
  static const Color white = Color(0xFFFFFFFF);
  static const Color purple = Colors.purple;
  static const Color background = Color(0xFFF6F6F6);
  static const Color dividerColor = Color(0xFFA6BBBA);
  static Color appGrey = const Color(0xFF000000).withOpacity(0.12);
  static Color appButtonsGrey = const Color(0xFFEFEFEF);
  static const appTransparentGrey = Color(0xFFF5F5F5);
  static Color appTransparentBlack = const Color(0xff000000).withOpacity(0.5);
  static const appFontBlack = Color(0xFF4F4F4F);
  static const textGrey = Color(0xFF6B7A99);
  static const appRed = Color(0xFFD8453E);
  static const orangeStartGradient = Color(0xFFFF5C3A);
  static const orangeEndGradient = Color(0xFFF88823);
  static const green = Color(0xFF37BB40);
  static const transparent = Colors.transparent;
  static const _appOrange = orangeEndGradient;
  static final orange = _make(_appOrange);
}

MaterialColor _make(Color color) {
  var hsl = HSLColor.fromColor(color);
  var delta = hsl.lightness / 5;
  var start = hsl.lightness - 4 * delta;
  return MaterialColor(color.value, {
    50: hsl.withLightness(start - delta / 2).toColor(),
    for (int i = 1; i < 10; i++)
      i * 100: hsl.withLightness(start + delta * (i - 1)).toColor(),
  });
}
