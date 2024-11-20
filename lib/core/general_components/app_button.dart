import '../utils/app_fonts.dart';
import '../const/app_color.dart';
import '../utils/sizer_util.dart';
import '../words/words.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../const/app_shadow.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String? label;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onTap;
  final Color? color;
  final Color? textColor;
  final TextStyle? style;
  final double? width;
  final double? height;

  const AppButton({
    Key? key,
    this.label,
    this.margin,
    this.onTap,
    this.color,
    this.textColor,
    this.style,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Padding(
      padding: margin ?? EdgeInsets.symmetric(vertical: 2.5.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width ?? 100.w,
          height: height ?? 10.w,
          decoration: BoxDecoration(
              color: color ?? AppColors.primary,
              borderRadius: BorderRadius.circular(1.5.w)),
          child: AppText(
            text: label ?? AppWord.confirm,
            style: style ??
                TextStyle(
                    fontSize: AppFonts.subTitleFont(context),
                    fontWeight: FontWeight.w600),
            color: textColor ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}

class AppRoundedButton extends StatelessWidget {
  final String? label;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onTap;
  final Widget? icon;
  final double? width;
  final double? height;
  final Color? color;
  final Color? contentColor;
  final Color? borderColor;

  const AppRoundedButton(
      {Key? key,
      this.label,
      this.margin,
      this.onTap,
      this.icon,
      this.width,
      this.height,
      this.color,
      this.contentColor,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: contentColor ?? AppColors.appGrey)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width ?? double.infinity,
          height: height ?? 10.w,
          margin: margin ?? EdgeInsets.all(2.5.w),
          decoration: BoxDecoration(
              color: color ?? AppColors.white,
              borderRadius: BorderRadius.circular(1.5.w),
              border: Border.all(color: borderColor ?? AppColors.appGrey),
              boxShadow: const [AppShadow.appShadowNormal]),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(2.5.w),
                  child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: icon ??
                          const SizedBox(
                            width: .1,
                            height: .1,
                          )),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    label ?? AppWord.confirm,
                    style: TextStyle(
                        color: contentColor ?? AppColors.appGrey,
                        fontSize: 16.maxSp(22)),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
