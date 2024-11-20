import 'package:get/get.dart';
import 'ar_sa/ar_sa.dart';
import 'en_us/en_us.dart';

class Dictionary extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : enUS,
    'ar_sa' : arSA,
  };
}