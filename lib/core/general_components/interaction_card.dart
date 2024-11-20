import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/app_fonts.dart';
import '../utils/dimensions.dart';
import 'app_text.dart';

class InteractionCard extends StatelessWidget {
  const InteractionCard(
      {super.key, required this.count, required this.icon, this.secondIcon});

  final String count;
  final String icon;
  final String? secondIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: secondIcon == null ? ScreenDimensions.widthPercentage(context, 15) : ScreenDimensions.widthPercentage(context, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                icon,
                width: ScreenDimensions.widthPercentage(context, 5),
              ),
              AppText(
                text: count,
                fontSize: AppFonts.smallTitleFont(context) + 4,
              ),
              if(secondIcon != null)
                SvgPicture.asset(
                  secondIcon!,
                  width: ScreenDimensions.widthPercentage(context, 5),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
