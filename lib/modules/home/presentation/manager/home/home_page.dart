import 'package:auradent/modules/home/presentation/manager/home/home_bindings.dart';
import 'package:auradent/modules/home/presentation/view/home_screen.dart';
import 'package:get/get.dart';

class HomePage {
  static const String name = '/home';
  static GetPage page = GetPage(
    name: name,
    page: () => const HomeScreen(),
    binding: HomeBindings(),
  );
}
