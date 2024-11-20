import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/app_tags.dart';
import '../utils/dimensions.dart';
import 'app_network_image.dart';

class PostViewer extends StatelessWidget {
  const PostViewer({super.key, required this.postMedia});

  final List<String> postMedia;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          itemCount: postMedia.length,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: ScreenDimensions.heightPercentage(context, 1),
              width: ScreenDimensions.screenWidth(context),
            );
          },
          itemBuilder: (context, index) {
            return Hero(
              tag: postMedia[index],
              child: ImagerBuildRow(
                image: postMedia[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ImagerBuildRow extends StatelessWidget {
  const ImagerBuildRow({super.key, required this.image,});

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenDimensions.screenWidth(context),
      height: ScreenDimensions.heightPercentage(context, 40),
      child: GestureDetector(
        onTap: () {
          Get.dialog(
              GestureDetector(
                onTap: Get.back,
                child : SizedBox(
                  width: ScreenDimensions.screenWidth(context),
                  height: ScreenDimensions.heightPercentage(context, 100),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
                    child: InteractiveViewer(
                      child: AppNetworkImage(
                        url: image,
                        boxFit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
              useSafeArea: true,
              barrierDismissible:false ,
              transitionCurve: Curves.easeInQuad);
        },
        child: AppNetworkImage(
          url: image,
          boxFit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
