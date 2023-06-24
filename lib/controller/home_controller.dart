import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/core/services/my_services.dart';
import 'package:e_shopping/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';
import '../core/classes/status_request.dart';
import '../core/functions/handling_data.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  onPageChanged(int index);
  goToSpecificItem(List categories, int selectedCat);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  int? id;
  String? username;
  String? email;
  String? phonenumber;
  int current_slider = 0;
  HomeData homeData = HomeData(Get.find());
  List items = [];
  List categories = [];
  late StatusRequest statusRequest;

  @override
  initialData() {
    id = myServices.sharedPreferences.getInt("id");
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    phonenumber = myServices.sharedPreferences.getString("phonenumber");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        categories.addAll(response["categories"]);
        items.addAll(response["items"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToSpecificItem(List categories, int selectedCat) {
    Get.toNamed(AppRoutes.items,
        arguments: {"categories": categories, "selectedCat": selectedCat});
  }

  @override
  onPageChanged(int index) {
    current_slider = index;
    update();
  }

  @override
  void onInit() {
    initialData();
    getData();
    print(statusRequest);
    super.onInit();
  }
}
