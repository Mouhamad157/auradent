import 'package:auradent/core/const/app_color.dart';
import 'package:auradent/core/general_components/app_text.dart';
import 'package:auradent/core/general_components/full_screen_sized_box.dart';
import 'package:auradent/core/themes/app_theme.dart';
import 'package:auradent/core/utils/app_fonts.dart';
import 'package:auradent/core/utils/dimensions.dart';
import 'package:auradent/core/words/words.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../manager/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: FullScreenSizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenDimensions.widthPercentage(context, 2),
              vertical: ScreenDimensions.heightPercentage(context, 1)),
          child: Row(
            children: [
              _buildLeftSide(context),
              _buildRightSide(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeftSide(BuildContext context) => Container(
        color: AppColors.white,
        width: ScreenDimensions.widthPercentage(context, 33),
        height: ScreenDimensions.screenHeight(context),
        child: Column(
          children: [
            Container(
              width: ScreenDimensions.widthPercentage(context, 10),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenDimensions.widthPercentage(context, 1),
                vertical: ScreenDimensions.heightPercentage(context, 1),
              ),
              decoration: context.theme.borderDecoration,
              child: AppText(
                text: AppWord.exit,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                fontSize: AppFonts.smallTitleFont(context),
              ),
            ),
          ],
        ),
      );
  Widget _buildRightSide(BuildContext context) => Container(
        color: AppColors.white,
        width: ScreenDimensions.widthPercentage(context, 63),
        height: ScreenDimensions.screenHeight(context),
      );
}
