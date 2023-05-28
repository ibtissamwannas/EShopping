import 'package:e_shopping/core/services/my_services.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? id;
  String? username;
  String? email;
  String? phonenumber;

  @override
  initialData() {
    id = myServices.sharedPreferences.getString("id");
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    phonenumber = myServices.sharedPreferences.getString("phonenumber");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
