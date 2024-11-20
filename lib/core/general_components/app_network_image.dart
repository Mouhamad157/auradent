import '../const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:extended_image/extended_image.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(
      {super.key, required this.url, this.borderRadius, this.maxByte,this.boxFit = BoxFit.cover});
  final String url;
  final int? maxByte;
  final BorderRadius? borderRadius;
  final BoxFit boxFit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ExtendedImage.network(
          url,
          fit: boxFit,
          cache: true,
          maxBytes: maxByte ?? 10000000,
          loadStateChanged: (state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                return Shimmer.fromColors(
                    baseColor: AppColors.appGrey,
                    highlightColor: AppColors.white,
                    child: Container(
                      color: AppColors.white,
                    ));
              case LoadState.failed:
                return const Icon(Icons.report_gmailerrorred);
              default:
                return null;
            }
          },
        ),
      ),
    );
  }
}
