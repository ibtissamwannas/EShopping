import 'package:e_shopping/data/datasource/remote/get_address_controller.dart';
import 'package:get/get.dart';
import '../core/classes/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/my_services.dart';
import '../data/model/address_model.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressModelData> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getAddressData(
      myServices.sharedPreferences.getInt("id").toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List d = response["data"];
        data.addAll(d.map((e) => AddressModelData.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(id) async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.deleteAddressData(
      id,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.snackbar("deleted", "successfully deleted");
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    data.removeWhere((element) {
      return element.id.toString() == id.toString();
    });
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
