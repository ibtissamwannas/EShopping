import 'dart:convert';

import 'package:e_shopping/data/datasource/remote/cart/all_orders_data.dart';
import 'package:get/get.dart';
import 'package:e_shopping/core/services/my_services.dart';
import '../../core/classes/status_request.dart';
import '../core/functions/handling_data.dart';
import '../data/model/all_orders_model.dart';

abstract class ArchieveController extends GetxController {}

class ArchieveControllerImp extends ArchieveController {
  MyServices myServices = Get.find();
  AllOrdersData allOrdersData = AllOrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<AllOrderModel> data = [];

  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await allOrdersData.archieveOrdersData(
      myServices.sharedPreferences.getInt("id").toString(),
    );

    print(response);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List d = response["data"];
        myServices.sharedPreferences.setString("data", jsonEncode(d));
        data.clear();
        data.addAll(d.map((e) => AllOrderModel.fromJson(e)));
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
