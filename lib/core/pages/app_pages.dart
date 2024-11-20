import 'package:get/get.dart';
import '../../modules/home/presentation/manager/home/home_page.dart';
import '../const/navigate_const.dart';
import '../../modules/authentication/presentation/manager/pages/login_page.dart';
import '../../modules/authentication/presentation/manager/pages/register_page.dart';

List<GetPage> get appPages => [
      LoginPage.page,
      RegisterPage.page,
      HomePage.page,
    ].map((e) {
      return e.applyConsts;
    }).toList();
