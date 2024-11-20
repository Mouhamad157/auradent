import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dimensions.dart';

class AppFonts {
  static double titleFont(BuildContext context) =>
      ScreenDimensions.fontSize(context, 3.5);

  static double subTitleFont(BuildContext context) =>
      ScreenDimensions.fontSize(context, 2.5);

  static double largeTitleFont(BuildContext context) =>
      ScreenDimensions.fontSize(context, 5);

  static double smallTitleFont(BuildContext context) =>
      ScreenDimensions.fontSize(context, 1.5);

  static TextStyle style(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.notoSansArabic(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
      );
}
