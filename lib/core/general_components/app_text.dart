import 'animate_widget.dart';
import '../const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:read_more_text/read_more_text.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.shadows,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return AnimateWidget(
      child: Material(
        color: Colors.transparent,
        child: Text(
          text,
          style: GoogleFonts.comicNeue(
            textStyle: style,
            color: color ?? AppColors.appTransparentBlack,
            fontSize: fontSize,
            fontWeight: fontWeight,
            shadows:shadows ,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
          textAlign:textAlign,
        ),
      ),
    );
  }
}

class AppReadMoreText extends StatelessWidget {
  const AppReadMoreText({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.fontSize = 24,
    this.fontWeight,
  });

  final String text;
  final TextStyle? style;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReadMoreText(
        text,
        style: GoogleFonts.ibmPlexSansArabic(
          textStyle: style,
          color: color ?? AppColors.appFontBlack,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        numLines: 2,
        readMoreText: 'Read more',
        readLessText: 'Read less',
        readMoreIconColor: AppColors.primary,
        readMoreTextStyle:GoogleFonts.ibmPlexSansArabic(
          color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ) ,
      ),
    );
  }
}

