import 'animate_widget.dart';
import 'app_text.dart';
import 'package:get/get.dart';
import 'post_build_classes.dart';
import '../utils/dimensions.dart';
import 'package:flutter/material.dart';
import '../general_entities/post_entity.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return AnimateWidget.withXOffset(
      x: 100,
      duration:const Duration(milliseconds: 50),
      child: SizedBox(
        width: ScreenDimensions.screenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostOwnerRow(
              postOwnerImage: post.postOwnerImage,
              postOwnerName: post.postOwnerName,
            ),
            if (post.postDescription != null)
              AppReadMoreText(text: post.postDescription!),
            if (post.postMedia != null)
              PostMediaPreview(postMedia: post.postMedia!),
            PostInteractiveRow(
              postAcceptDeclineCounts: post.postAcceptDeclineCounts,
              postSendCounts: post.postSendCounts,
              postRatingCounts: post.postRatingCounts,
              postLikeCounts: post.postLikeCounts,
              postCommentCounts: post.postCommentCounts,
              isLiked: post.isLiked,
            ),
          ],
        ),
      ).marginOnly(bottom: ScreenDimensions.heightPercentage(context, 1.5)),
    );
  }
}
