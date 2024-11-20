
import 'package:auradent/core/general_components/animate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const/app_images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.height,
    this.width,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AnimateWidget(
      child: SvgPicture.asset(
        AppSVGs.appLogo,
        width: width,
        height: height,
      ),
    );
  }
}