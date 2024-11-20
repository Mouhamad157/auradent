import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/app_color.dart';
import '../utils/app_fonts.dart';
import '../utils/dimensions.dart';
import '../words/words.dart';
import 'animate_widget.dart';
import 'app_button.dart';
import 'app_network_image.dart';
import 'app_text.dart';

class FriendRequestCard extends StatelessWidget {
  const FriendRequestCard(
      {super.key,
      required this.image,
      required this.name,
      required this.mutualFriendsCount,
      required this.date});

  final String image;
  final String name;
  final int mutualFriendsCount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return AnimateWidget.withXOffset(
      x: 5,
      child: Container(
        color: AppColors.transparent,
        width: ScreenDimensions.screenWidth(context),
        height: ScreenDimensions.heightPercentage(context, 12),
        margin: EdgeInsets.only(top: ScreenDimensions.heightPercentage(context, 2),right: ScreenDimensions.widthPercentage(context, 2),left: ScreenDimensions.widthPercentage(context, 2)),
        child: Row  (
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: AppColors.white,
                child: SizedBox(
                  child: AppNetworkImage(
                    url:image,
                    borderRadius: BorderRadius.circular(
                        ScreenDimensions.radius(context, 1000)),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText(
                          text: name,
                          fontSize: AppFonts.smallTitleFont(context) + 5,
                          color: AppColors.black,
                        ),
                        const Spacer(),
                        AppText(
                          text: date,
                          fontSize: AppFonts.smallTitleFont(context),
                          color: AppColors.black,
                        ),
                      ],
                    ),
                    AppText(
                      text: '$mutualFriendsCount ${AppWord.mutualFriend}',
                      fontSize: AppFonts.smallTitleFont(context),
                      color: AppColors.appFontBlack,
                      fontWeight: FontWeight.w300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton(
                          width: ScreenDimensions.widthPercentage(context, 30),
                          height: ScreenDimensions.heightPercentage(context, 4),
                          style: AppFonts.style(
                              fontSize: AppFonts.smallTitleFont(context)),
                          label: AppWord.addFriend,
                        ),
                        AppButton(
                          label: AppWord.delete,
                          textColor: AppColors.black,
                          color: AppColors.appButtonsGrey,
                          width: ScreenDimensions.widthPercentage(context, 30),
                          height: ScreenDimensions.heightPercentage(context, 4),
                          style: AppFonts.style(
                              fontSize: AppFonts.smallTitleFont(context)),
                        ),
                      ],
                    ),
                  ],
                ).marginSymmetric(
                    horizontal: ScreenDimensions.widthPercentage(context, 3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
