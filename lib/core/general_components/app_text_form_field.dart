import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'animate_widget.dart';
import '../utils/app_fonts.dart';
import '../utils/dimensions.dart';
import 'app_text.dart';
import '../const/app_color.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? helpText;
  final String? title;
  final Widget? icon;
  final bool isPass;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final String? initialValue;
  final Widget? suffixIcon;
  final Border? border;
  final VoidCallback? onTap;
  final bool readOnly;

  const AppTextFormField({
    super.key,
    this.controller,
    this.helpText,
    this.title,
    this.icon,
    this.keyboardType,
    this.isPass = false,
    this.validator,
    this.borderRadius,
    this.padding,
    this.width,
    this.height,
    this.textInputAction,
    this.onSubmit,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.initialValue,
    this.suffixIcon,
    this.border,
    this.readOnly = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    return AnimateWidget.withXOffset(
      x: 5,
      child: SizedBox(
        width: ScreenDimensions.screenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: widget.title ?? 'missed title',
              color: AppColors.appFontBlack,
              fontSize: AppFonts.smallTitleFont(context),
            ).marginSymmetric(
                vertical: ScreenDimensions.heightPercentage(context, 1)),
            TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                border: UnderlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
                ),
                disabledBorder: UnderlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(5),
                    ),
                enabledBorder: UnderlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(5),
                   ),
                errorBorder: UnderlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.red, width: 0.5),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(5),
                    ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.red, width: 0.5),
                ),
                suffixIcon: widget.isPass
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _hide = !_hide;
                          });
                        },
                        icon: Icon(_hide ? Iconsax.eye : Iconsax.eye_slash))
                    : widget.suffixIcon,
                isCollapsed: true,
                isDense: true,
                helperText: widget.helpText,
                contentPadding: EdgeInsets.symmetric(
                    vertical: ScreenDimensions.heightPercentage(context, 1),
                    horizontal: ScreenDimensions.widthPercentage(context, 2)),
              ),
              obscureText: widget.isPass ? _hide : false,
              validator: widget.validator,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onFieldSubmitted: widget.onSubmit,
              readOnly: widget.readOnly,
              style: AppFonts.style(color: AppColors.appFontBlack),
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
            ),
          ],
        ).paddingSymmetric(
            horizontal: ScreenDimensions.widthPercentage(context, 6)),
      ),
    );
  }
}
