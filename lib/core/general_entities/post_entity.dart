import 'package:equatable/equatable.dart';

abstract class Post extends Equatable {
  final List<String>? postMedia;
  final String? postDescription;
  final String postOwnerName;
  final String postOwnerImage;
  final int postLikeCounts;
  final int postRatingCounts;
  final int postSendCounts;
  final int postCommentCounts;
  final int postAcceptDeclineCounts;
  final bool isLiked;

  const Post(
      {this.postMedia,
      this.postDescription,
      required this.postOwnerName,
      required this.postOwnerImage,
      required this.postLikeCounts,
      required this.postRatingCounts,
      required this.postSendCounts,
      required this.postCommentCounts,
      required this.isLiked,
      required this.postAcceptDeclineCounts});

  @override
  List<Object?> get props => [
        postMedia,
        postDescription,
        postOwnerName,
        postOwnerImage,
        postLikeCounts,
        postRatingCounts,
        postCommentCounts,
        postSendCounts,
        isLiked,
        postAcceptDeclineCounts
      ];
}

class MediaPost extends Post {
  const MediaPost(
      {super.postDescription,
      required super.postMedia,
      required super.postOwnerName,
      required super.postOwnerImage,
      required super.postLikeCounts,
      required super.postCommentCounts,
      required super.postRatingCounts,
      required super.postSendCounts,
      required super.isLiked,
      required super.postAcceptDeclineCounts});
}

class TextPost extends Post {
  const TextPost(
      {required super.postDescription,
      required super.postOwnerName,
      required super.postOwnerImage,
      required super.postLikeCounts,
      required super.postCommentCounts,
      required super.postRatingCounts,
      required super.postSendCounts,
      required super.isLiked,
      required super.postAcceptDeclineCounts});
}
