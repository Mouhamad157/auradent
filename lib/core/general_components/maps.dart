import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../const/app_color.dart';
import '../const/map_theme.dart';
import '../general_controllers/google_map_controller.dart';
import '../utils/dimensions.dart';
import 'animate_widget.dart';

class AppGoogleMap extends GetView<AppGoogleMapController> {
  const AppGoogleMap({
    super.key,
    this.markers = const {},
    this.cameraPosition,
    this.height,
    this.width,
    this.onTap,
  });

  final Set<Marker> markers;
  final CameraPosition? cameraPosition;
  final double? width;
  final double? height;
  final Function(LatLng)? onTap;

  @override
  Widget build(BuildContext context) {
    Get.put(AppGoogleMapController());
    return AnimateWidget.withXOffset(
      x: 5,
      child: GetBuilder<AppGoogleMapController>(initState: (state) {

      }, builder: (_) {
        return Container(
          width: width ?? ScreenDimensions.screenWidth(context),
          height: height ?? ScreenDimensions.heightPercentage(context, 25),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 2)),
          child: GoogleMap(
            onMapCreated: (mapController) {
              controller.mapController = mapController;
              DefaultAssetBundle.of(context)
                  .loadString('assets/map_theme/night_theme.json')
                  .then((value) {
                controller.mapTheme = value;
                controller.mapController!.setMapStyle(controller.mapTheme);
                controller.moveCamera();
                controller.update();
              });
            },
            onTap: onTap,
            style: controller.mapTheme,
            gestureRecognizers: {
              Factory(
                () => EagerGestureRecognizer(
                    allowedButtonsFilter: (buttons) => true,
                    supportedDevices: {PointerDeviceKind.touch}),
              ),
            },
            initialCameraPosition:
                cameraPosition == null ? controller.position! : cameraPosition!,
            markers: markers,
          ),
        )
            .paddingSymmetric(
                vertical: ScreenDimensions.heightPercentage(context, 2))
            .animate(delay: const Duration(milliseconds: 250))
            .fadeIn()
            .slideX();
      }),
    );
  }
}
