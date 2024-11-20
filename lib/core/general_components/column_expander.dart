import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColumnExpander extends StatelessWidget {
  const ColumnExpander({
    super.key,
    this.height
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: height,
    );
  }
}