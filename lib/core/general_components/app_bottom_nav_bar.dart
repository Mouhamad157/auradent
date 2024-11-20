import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../const/app_color.dart';
import '../const/app_images.dart';
import '../words/words.dart';

class AppBottomNavBar extends GetView<AppBottomNavBarController> {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBottomNavBarController>(
        builder: (_) {
      return SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.rectangle,
        snakeViewColor: AppColors.primary.withOpacity(0.1),
        selectedItemColor: AppColors.black,
        currentIndex: controller.pageIndex,
        onTap:controller.changePage,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSVGs.homeUs),
            label: AppWord.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSVGs.searchUs),
            label: AppWord.search,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSVGs.chatUs),
            label: AppWord.chat,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSVGs.notificationUs),
            label: AppWord.notification,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSVGs.profileUs),
            label: AppWord.profile,
          ),
        ],
      );
    });
  }
}

class AppBottomNavBarController extends GetxController {
  int pageIndex = 0;

  void changePage(int newIndex) {
    pageIndex = newIndex;
    update();
    // switch (pageIndex) {
    //   case 0:
    //     Get.offAllNamed(HomePage.name);
    //     break;
    //   case 1:
    //     Get.offAllNamed(HomePage.name);
    //     break;
    //   case 2:
    //     Get.offAllNamed(HomePage.name);
    //     break;
    //   case 3:
    //     Get.offAllNamed(HomePage.name);
    //     break;
    //   case 4:
    //     Get.offAllNamed(ProfilePage.name);
    //     break;
    //
    // }
  }
}
