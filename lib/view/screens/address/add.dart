import 'package:e_shopping/controller/add_address_controller.dart';
import 'package:e_shopping/core/classes/handling_data_view.dart';
import 'package:e_shopping/core/constants/router_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/constants/colors.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(addAddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Address",
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
      body: GetBuilder<addAddressControllerImp>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.kGooglePlex != null
                  ? Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        GoogleMap(
                          markers: controller.markers.toSet(),
                          mapType: MapType.normal,
                          onTap: (LatLng) {
                            controller.addMarkers(LatLng);
                          },
                          initialCameraPosition: controller.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllerM) {
                            controller.controllerMap?.complete(controllerM);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            child: ElevatedButton(
                              child: Text("Complete address"),
                              onPressed: () {
                                Get.toNamed(AppRoutes.addAddressTwo,
                                    arguments: {
                                      "lat": controller.lat,
                                      "long": controller.long
                                    });
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  : Container());
        },
      ),
    );
  }
}
