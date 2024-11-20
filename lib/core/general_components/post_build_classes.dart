import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../const/app_color.dart';
import '../const/app_images.dart';
import '../const/app_tags.dart';
import '../utils/app_fonts.dart';
import '../utils/dimensions.dart';
import 'app_network_image.dart';
import 'app_text.dart';
import 'interaction_card.dart';
import 'post_viewer.dart';

class PostOwnerRow extends StatelessWidget {
  const PostOwnerRow(
      {super.key, required this.postOwnerImage, required this.postOwnerName});

  final String postOwnerName;
  final String postOwnerImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: ScreenDimensions.heightPercentage(context, 0.5)),
      height: ScreenDimensions.heightPercentage(context, 9),
      width: ScreenDimensions.screenWidth(context),
      child: Row(
        children: [
          SizedBox(
            width: ScreenDimensions.widthPercentage(context, 15),
            height: ScreenDimensions.widthPercentage(context, 15),
            child: Center(
              child: AppNetworkImage(
                url: postOwnerImage,
                borderRadius:
                    BorderRadius.circular(ScreenDimensions.radius(context, 4)),
              ),
            ),
          ).marginSymmetric(
            horizontal: ScreenDimensions.widthPercentage(context, 3),
          ),
          AppText(
            text: postOwnerName,
            fontSize: AppFonts.subTitleFont(context),
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppSVGs.options,
                  width: ScreenDimensions.widthPercentage(context, 7.5))),
        ],
      ),
    );
  }
}

class PostMediaPreview extends StatelessWidget {
  const PostMediaPreview({super.key, required this.postMedia});

  final List<String> postMedia;

  @override
  Widget build(BuildContext context) {
    switch (postMedia.length) {
      case 1:
        return SingleImagePost(image: postMedia.first);
      case 2:
        return TwoImagePost(postMedia: postMedia);
      case 3:
        return ThreeImagePost(postMedia: postMedia);
      default:
        return MultipleImagePost(postMedia: postMedia);
    }
  }
}

class SingleImagePost extends StatelessWidget {
  const SingleImagePost({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            PostViewer(
              postMedia: [image],
            ),
            popGesture: true,
            transition: Transition.downToUp);
      },
      child: SizedBox(
        height: ScreenDimensions.heightPercentage(context, 35),
        width: ScreenDimensions.screenWidth(context),
        child: Hero(
          tag: image,
          child: AppNetworkImage(
            url: image,
          ),
        ),
      ),
    );
  }
}

class TwoImagePost extends StatelessWidget {
  const TwoImagePost({super.key, required this.postMedia});

  final List<String> postMedia;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            PostViewer(
              postMedia: postMedia,
            ),
            popGesture: true,
            transition: Transition.downToUp);
      },
      child: SizedBox(
        height: ScreenDimensions.heightPercentage(context, 35),
        width: ScreenDimensions.screenWidth(context),
        child: Row(
          children: [
            Expanded(
                child: Hero(
              tag: postMedia.first,
              child: AppNetworkImage(
                url: postMedia.first,
              ),
            )),
            Expanded(
                child: Hero(
              tag: postMedia[1],
              child: AppNetworkImage(
                url: postMedia[1],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class ThreeImagePost extends StatelessWidget {
  const ThreeImagePost({super.key, required this.postMedia});

  final List<String> postMedia;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            PostViewer(
              postMedia: postMedia,
            ),
            popGesture: true,
            transition: Transition.downToUp);
      },
      child: SizedBox(
        height: ScreenDimensions.heightPercentage(context, 35),
        width: ScreenDimensions.screenWidth(context),
        child: Row(
          children: [
            Expanded(
                child: Hero(
              tag: postMedia.first,
              child: AppNetworkImage(
                url: postMedia.first,
              ),
            )),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Hero(
                      tag: postMedia[1],
                      child: AppNetworkImage(
                        url: postMedia[1],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Hero(
                      tag: postMedia[2],
                      child: AppNetworkImage(
                        url: postMedia[2],
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
}

class MultipleImagePost extends StatelessWidget {
  const MultipleImagePost({super.key, required this.postMedia});

  final List<String> postMedia;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            PostViewer(
              postMedia: postMedia,
            ),
            popGesture: true,
            transition: Transition.downToUp);
      },
      child: SizedBox(
        height: ScreenDimensions.heightPercentage(context, 35),
        width: ScreenDimensions.screenWidth(context),
        child: Row(
          children: [
            Expanded(
              child: Hero(
                tag: postMedia.first,
                child: AppNetworkImage(
                  url: postMedia.first,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Hero(
                      tag: postMedia[1],
                      child: AppNetworkImage(
                        url: postMedia[1],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Hero(
                          tag: postMedia[2],
                          child: AppNetworkImage(
                            url: postMedia[2],
                          ),
                        ),
                        AppText(
                          text: '${postMedia.length - 3}+',
                          fontSize: AppFonts.largeTitleFont(context),
                          color: AppColors.white,
                          shadows: const [
                            Shadow(color: AppColors.black, blurRadius: 5)
                          ],
                        )
                      ],
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
}

class PostInteractiveRow extends StatelessWidget {
  const PostInteractiveRow({
    super.key,
    required this.postAcceptDeclineCounts,
    required this.postSendCounts,
    required this.postRatingCounts,
    required this.postLikeCounts,
    required this.postCommentCounts,
    required this.isLiked,
  });

  final int postLikeCounts;
  final int postRatingCounts;
  final int postSendCounts;
  final int postCommentCounts;
  final int postAcceptDeclineCounts;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenDimensions.screenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InteractionCard(
            icon: AppSVGs.like,
            count: postLikeCounts.toString(),
          ),
          InteractionCard(
            icon: AppSVGs.rating,
            count: postRatingCounts.toString(),
          ),
          InteractionCard(
            icon: AppSVGs.send,
            count: postSendCounts.toString(),
          ),
          InteractionCard(
            icon: AppSVGs.comment,
            count: postCommentCounts.toString(),
          ),
          InteractionCard(
            icon: AppSVGs.check,
            count: postAcceptDeclineCounts.toString(),
            secondIcon: AppSVGs.close,
          ),
        ],
      ),
    ).marginSymmetric(
        vertical: ScreenDimensions.heightPercentage(context, 1.5));
  }
}
