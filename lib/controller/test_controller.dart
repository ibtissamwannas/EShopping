import 'package:get/get.dart';
import '../core/classes/status_request.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/test_data.dart.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.addAll(response["data"]);
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
