import 'package:auradent/core/utils/dimensions.dart';
import 'package:auradent/core/validator/app_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/words/words.dart';
import '../../../../core/const/app_color.dart';
import '../../../../core/utils/app_fonts.dart';
import '../manager/controllers/login_controller.dart';
import '../../../../core/general_components/app_text.dart';
import '../../../../core/general_components/app_logo.dart';
import '../../../../core/general_components/column_expander.dart';
import '../../../../core/general_components/app_text_form_field.dart';
import '../../../../core/general_components/full_screen_sized_box.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullScreenSizedBox(
        child: Stack(
          children: [
            Row(
              children: [
                _buildLeftSide(context),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const ColumnExpander(),
                      const Spacer(),
                      AppText(
                        text: AppWord.auraDent,
                        color: AppColors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFonts.titleFont(context),
                        shadows: const [
                          Shadow(
                            color: AppColors.textGrey,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                      AppText(
                        text: AppWord.pleaseLogin,
                        color: AppColors.black,
                        fontSize: AppFonts.subTitleFont(context),
                      ),
                      AppTextFormField(
                        title: AppWord.username,
                        controller: controller.userNameController,
                        validator: AppValidator().nameValidator,
                      ),
                      SizedBox(
                        height: ScreenDimensions.heightPercentage(context, 5),
                      ),
                      AppTextFormField(
                        title: AppWord.password,
                        controller: controller.passwordController,
                        validator: AppValidator().passwordValidator,
                      ),
                      SizedBox(
                        height: ScreenDimensions.heightPercentage(context, 5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: controller.register,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              height:
                                  ScreenDimensions.heightPercentage(context, 5),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.primary,
                                  )),
                              alignment: Alignment.center,
                              child: AppText(
                                text: AppWord.signup,
                                fontSize: AppFonts.subTitleFont(context),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: controller.login,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              height:
                                  ScreenDimensions.heightPercentage(context, 5),
                              decoration:
                                  const BoxDecoration(color: AppColors.primary),
                              alignment: Alignment.center,
                              child: AppText(
                                text: AppWord.login,
                                color: AppColors.white,
                                fontSize: AppFonts.subTitleFont(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: controller.english,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      width: ScreenDimensions.widthPercentage(context, 10),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.primary)),
                      child: const AppText(
                        text: 'English',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.arabic,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      width: ScreenDimensions.widthPercentage(context, 10),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.primary)),
                      child: const AppText(
                        text: 'العربية',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftSide(BuildContext context) => const Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppLogo(),
          ],
        ),
      );
}
