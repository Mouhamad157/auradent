import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_text.dart';
import '../themes/app_theme.dart';
import '../utils/app_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubmitButton extends StatelessWidget {
  final Color? color;
  final Color? fontColor;
  final String? label;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Widget? child;

  const SubmitButton({
    super.key,
    this.color,
    this.fontColor,
    this.label,
    this.onTap,
    this.margin,
    this.borderRadius,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 13.w,
        margin: margin,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color ?? theme.primaryColor,
          borderRadius: borderRadius ?? BorderRadius.circular(5.spa),
          boxShadow: [theme.buttonShadow],
        ),
        alignment: Alignment.center,
        child: child ??
            AppText(
              text: label ?? 'Submit'.tr,
              color: fontColor ?? Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: AppFonts.smallTitleFont(context),
            ),
      ),
    );
  }
}
