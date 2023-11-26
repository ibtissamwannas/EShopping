import 'package:e_shopping/data/model/notification.dart';
import 'package:get/get.dart';

import '../core/classes/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/my_services.dart';
import '../data/datasource/remote/notificartion_data.dart';

abstract class notificationController extends GetxController {}

class notificationControllerImp extends notificationController {
  MyServices myServices = Get.find();
  NotificationData notificationData = NotificationData(Get.find());
  List<notificationModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData.NotificationDataFunc(
      myServices.sharedPreferences.getInt("id").toString(),
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List d = response["data"];
        data.addAll(d.map((e) => notificationModel.fromJson(e)));
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
