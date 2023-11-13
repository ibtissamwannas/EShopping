import 'package:get/get.dart';

import '../core/classes/status_request.dart';

abstract class addAddressTwoController extends GetxController {}

class addAddressTwoControllerImp extends addAddressTwoController {
  StatusRequest statusRequest = StatusRequest.none;
  String? lat;
  String? long;

  @override
  void onInit() {
    lat = Get.arguments["lat"];
    long = Get.arguments["long"];
    super.onInit();
  }
}
