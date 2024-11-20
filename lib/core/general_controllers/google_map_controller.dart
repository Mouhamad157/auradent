import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class AppGoogleMapController extends GetxController {
  bool hasPermission = false;
  CameraPosition? position;
  GoogleMapController? mapController;

  String mapTheme = '';
  Position? userPosition;

  void _checkPermission() async {
    Get.log('check permission');
    await Geolocator.checkPermission().then((value) async {
      hasPermission = value.name == 'whileInUse'
          ? true
          : value.name == 'always'
              ? true
              : false;
      if (hasPermission) return;
      await Geolocator.requestPermission();
    });
  }

  void _getLatLong() async {
    Get.log('check location');
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    Get.log('check location result : $isLocationServiceEnabled');
    if (isLocationServiceEnabled) {
      Get.log('getting location');
      userPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Get.log(
          'getting location result : ${userPosition!.latitude} - ${userPosition!.longitude}');
      mapController!.moveCamera(CameraUpdate.newLatLng(
          LatLng(userPosition!.latitude, userPosition!.longitude)));
      update();
      return;
    } else {
      Get.snackbar('ops', 'please enable location service in settings');
    }
  }

  void moveCamera() {
    _checkPermission();
    _getLatLong();
  }

  @override
  void onInit() {
    position =
        const CameraPosition(target: LatLng(24.470901, 39.612236), zoom: 10);
    super.onInit();
  }
}
