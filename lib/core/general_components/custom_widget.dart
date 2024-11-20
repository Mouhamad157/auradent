import '../utils/sizer_util.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const/app_color.dart';
import '../const/app_shadow.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    super.key,
    this.title,
    required this.child,
    this.border,
    this.margin,
    this.titleFontSize,
    this.padding,
    this.height,
    this.width,
  });

  final String? title;
  final Widget child;
  final Border? border;
  final EdgeInsets? margin;
  final double? titleFontSize;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin ?? EdgeInsets.zero,
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: padding ?? EdgeInsets.zero,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  color: AppColors.white,
                  border: border ??
                      Border.all(color: AppColors.appGrey, width: 0.6),
                  boxShadow: const [AppShadow.appShadowNormal]),
              child: child,
            ),
          ),
          title == null
              ? const SizedBox.shrink()
              : Text(
                  title ?? '',
                  style: TextStyle(
                    color: AppColors.orangeStartGradient,
                    fontSize: titleFontSize ?? 8.maxSp(15),
                  ),
                )
        ],
      ),
    );
  }
}
