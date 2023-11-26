import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/orders_details_controller.dart';
import '../../../core/constants/colors.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Order Details",
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
        body: GetBuilder<DetailsControllerImp>(
          builder: (controller) {
            return ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Table(
                  children: [
                    TableRow(children: [
                      Text(
                        "Type",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Quantity",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "price",
                        textAlign: TextAlign.center,
                      ),
                    ])
                  ],
                ),
                Text(
                  "Total Price :  200",
                  textAlign: TextAlign.center,
                ),
                Card(
                  child: ListTile(
                    title: Text("${controller.orderModel.city}"),
                    subtitle: Text("${controller.orderModel.name}"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
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
                )
              ],
            );
          },
        ));
  }
}
