import 'package:get/get.dart';

class HomeController extends GetxController {
  final dentistName = RxString('Dr. John Smith');
  final patientName = RxString('John Doe');
  final orderNumber = RxInt(00000);
}
