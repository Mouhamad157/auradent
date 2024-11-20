import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class ExpandedColumn extends StatelessWidget {
  const ExpandedColumn({
    super.key,
    this.children = const [],
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.columnKey,
  });

  final List<Widget> children;

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Key? columnKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: columnKey,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: [
        SizedBox(
          width: ScreenDimensions.screenWidth(context),
        ),
        ...children
      ],
    );
  }
}
