import 'package:get/get.dart';
import '../../view/register_screen.dart';
import '../bindings/register_binding.dart';

class RegisterPage {
  static const String name = '/register';

  static GetPage page = GetPage(
    name: name,
    page: () => const RegisterScreen(),
    binding: RegisterBinding(),
  );
}
