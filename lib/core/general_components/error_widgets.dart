import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../const/app_color.dart';
import '../words/words.dart';

class TryAgain extends StatelessWidget {
  const TryAgain({Key? key, required this.error, required this.onTap}) : super(key: key);
  final String error;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 75.w,
      padding: EdgeInsets.all(2.5.w),
      margin: EdgeInsets.symmetric(horizontal: 17.5.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(2.5.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.error),
          Text(
            error,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 40.w,
              height: 12.5.w,
              margin: EdgeInsets.all(2.5.w),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(2.5.w),
              ),
              alignment: Alignment.center,
              child: Text(
                ErrorWords.tryAgain,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
    return Column(
      children: [
        Container(
          width: 65.w,
          height: 75.w,
          padding: EdgeInsets.all(2.5.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(2.5.w),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.error),
              Text(
                error,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 40.w,
                  height: 12.5.w,
                  margin: EdgeInsets.all(2.5.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(2.5.w),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    ErrorWords.tryAgain,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(error)
      ],
    );
  }
}
