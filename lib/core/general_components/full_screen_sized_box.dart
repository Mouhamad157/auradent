import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class FullScreenSizedBox extends StatelessWidget {
  const FullScreenSizedBox({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenDimensions.heightPercentage(context, 100),
      width: ScreenDimensions.widthPercentage(context, 100),
      child: child,
    );
  }
}
