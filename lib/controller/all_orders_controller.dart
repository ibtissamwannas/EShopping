import 'package:e_shopping/data/datasource/remote/cart/all_orders_data.dart';
import 'package:get/get.dart';
import 'package:e_shopping/core/services/my_services.dart';
import '../../core/classes/status_request.dart';
import '../core/functions/handling_data.dart';
import '../data/model/all_orders_model.dart';

abstract class AllOrdersController extends GetxController {}

class AllOrdersControllerImp extends AllOrdersController {
  MyServices myServices = Get.find();
  AllOrdersData allOrdersData = AllOrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<AllOrderModel> data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await allOrdersData.allOrderdData(
      myServices.sharedPreferences.getInt("id").toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.clear();
        List d = response["data"];
        data.addAll(d.map((e) => AllOrderModel.fromJson(e)));
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
