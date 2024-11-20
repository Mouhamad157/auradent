import 'dart:ui';
import 'app_text.dart';
import 'package:get/get.dart';
import '../const/app_color.dart';
import '../utils/app_fonts.dart';
import '../utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends SliverAppBar {
  const CustomAppBar({
    super.key,
    super.leading,
    super.automaticallyImplyLeading = true,
    super.title,
    super.actions,
    super.flexibleSpace,
    super.bottom,
    super.elevation,
    super.scrolledUnderElevation,
    super.shadowColor,
    super.surfaceTintColor,
    super.forceElevated = false,
    super.backgroundColor,
    super.foregroundColor,
    super.iconTheme,
    super.actionsIconTheme,
    super.primary = true,
    super.centerTitle,
    super.excludeHeaderSemantics = false,
    super.titleSpacing,
    super.collapsedHeight,
    super.expandedHeight,
    super.floating = false,
    super.pinned = false,
    super.snap = false,
    super.stretch = false,
    super.stretchTriggerOffset = 100.0,
    super.onStretchTrigger,
    super.shape,
    super.toolbarHeight = kToolbarHeight,
    super.leadingWidth,
    super.toolbarTextStyle,
    super.titleTextStyle,
    super.systemOverlayStyle,
    super.forceMaterialTransparency = false,
    super.clipBehavior,
    required this.context,
    this.height,
    this.onBack,
    this.fontSize,
    this.additionalWidget,
    required this.label,
    this.isBack = true,
  })  : assert(floating || !snap,
            'The "snap" argument only makes sense for floating app bars.'),
        assert(stretchTriggerOffset > 0.0),
        assert(
          collapsedHeight == null || collapsedHeight >= toolbarHeight,
          'The "collapsedHeight" argument has to be larger than or equal to [toolbarHeight].',
        );

  final BuildContext context;
  final double? height;
  final double? fontSize;
  final String label;
  final bool isBack;

  final Widget? additionalWidget;
  final VoidCallback? onBack;

  @override
  Color? get backgroundColor => AppColors.white.withOpacity(0.5);

  @override
  double get toolbarHeight =>
      height ?? ScreenDimensions.heightPercentage(context, 10);

  @override
  double? get expandedHeight =>
      height ?? ScreenDimensions.heightPercentage(context, 10);

  @override
  bool get pinned => true;

  @override
  List<Widget>? get actions => [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              width: ScreenDimensions.screenWidth(context),
              height: ScreenDimensions.heightPercentage(context, 10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppText(
                      text: label,
                      fontSize: fontSize ?? AppFonts.subTitleFont(context)-3,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            if (isBack)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                      if (onBack != null) onBack!();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_sharp)),
              ),
            Positioned(
                bottom: -ScreenDimensions.heightPercentage(context, 0.5),
                right: 0,
                left: 0,
                child: Divider()),
            if (additionalWidget != null)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: additionalWidget!,
              ),
          ],
        )
      ];
}
