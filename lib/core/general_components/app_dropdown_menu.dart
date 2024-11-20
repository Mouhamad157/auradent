import 'package:flutter/material.dart';
import 'app_text.dart';
import '../const/app_color.dart';
import '../utils/app_fonts.dart';
import '../utils/dimensions.dart';

class AppDropDownMenu extends StatelessWidget {
  const AppDropDownMenu({
    super.key,
    required this.hint,
    required this.items,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.style,
    this.border,
    this.textColor,
    this.onSelected,
    this.borderRadius,
    this.fillColor,
  });

  final String hint;
  final List<DropdownMenuEntry<String>> items;
  final Function(String?)? onSelected;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final TextStyle? style;
  final Color? textColor;
  final Color? fillColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? ScreenDimensions.heightPercentage(context, 5.75),
      width: width ?? ScreenDimensions.screenWidth(context),
      padding: padding,
      margin: margin ??
          EdgeInsets.symmetric(
              horizontal: ScreenDimensions.widthPercentage(context, 5),
              vertical: ScreenDimensions.heightPercentage(context, 1.5)),
      decoration: BoxDecoration(
          color: fillColor ?? AppColors.appTransparentGrey,
          borderRadius: borderRadius ??
              BorderRadius.circular(ScreenDimensions.radius(context, 0.5)),
          border: border ?? Border.all(color: AppColors.textGrey)),
      alignment: Alignment.center,
      child: DropdownMenu(
        dropdownMenuEntries: items,
        width: width,
        onSelected: onSelected,
        expandedInsets: EdgeInsets.symmetric(
            horizontal: ScreenDimensions.widthPercentage(context, 3)),
        textStyle: style ??
            AppFonts.style(
              fontSize: AppFonts.smallTitleFont(context),
              color: textColor ?? AppColors.textGrey,
            ),
        trailingIcon: Icon(Icons.keyboard_arrow_down_outlined,size: ScreenDimensions.widthPercentage(context, 5),),
        selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_outlined,size: ScreenDimensions.widthPercentage(context, 5),),
        label: AppText(
          text: hint,
          fontSize: AppFonts.smallTitleFont(context)-2,
        ),
        inputDecorationTheme:
            const InputDecorationTheme(border: InputBorder.none),
      ),
    );
  }
}
