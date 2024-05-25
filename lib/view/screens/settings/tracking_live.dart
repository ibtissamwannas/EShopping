import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/live_tracking.dart';
import '../../../core/constants/colors.dart';

class TrackingLive extends StatelessWidget {
  const TrackingLive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Tracking());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Live Tracking",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.black,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
      ),
      body: GetBuilder<Tracking>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 300,
            child: GoogleMap(
              markers: controller.markers.toSet(),
              mapType: MapType.normal,
              initialCameraPosition: controller.kGooglePlex!,
              onMapCreated: (GoogleMapController controllerM) {
                controller.controllerMap?.complete(controllerM);
              },
            ),
          );
        },
      ),
    );
  }
}
