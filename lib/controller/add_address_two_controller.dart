import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/data/datasource/remote/get_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/classes/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/my_services.dart';

abstract class addAddressTwoController extends GetxController {}

class addAddressTwoControllerImp extends addAddressTwoController {
  StatusRequest statusRequest = StatusRequest.none;
  double? lat;
  double? long;
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  List data = [];
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  addAddress() async {
    var response = await addressData.addAddressData(
        myServices.sharedPreferences.getInt("id").toString(),
        name.text,
        city.text,
        street.text,
        lat.toString(),
        long.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.snackbar("added", "address added succesfully");
        Get.offAllNamed(AppRoutes.home);
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    lat = Get.arguments["lat"];
    long = Get.arguments["long"];
    print(lat);
    print(long);
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }
}
