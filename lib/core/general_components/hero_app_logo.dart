import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../const/app_constants.dart';
import '../const/app_images.dart';

class HeroAppLogo extends StatelessWidget {
  const HeroAppLogo({Key? key, this.width, this.height, this.padding})
      : super(key: key);
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return DelayedDisplay(
      delay: AppConstants.animationDuration,
      child: Hero(
        tag: "splash",
        child: Padding(
          padding: padding ?? EdgeInsets.all(2.5.w),
          child: Image.asset(
            AppPNGs.appLogo,
            width: width ?? 60.w,
            height: height ?? 60.w,
          ),
        ),
      ),
    );
  }
}
