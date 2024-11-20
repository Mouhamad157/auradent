import 'package:get/get.dart';
import '../../view/login_screen.dart';
import '../bindings/login_binding.dart';

class LoginPage {
  static const String name = '/';
  static GetPage page = GetPage(
    name: name,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  );
}
