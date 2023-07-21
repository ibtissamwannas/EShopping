import 'package:e_shopping/core/services/my_services.dart';
import 'package:get/get.dart';

translateDBData(String ar, String en) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return ar;
  } else {
    return en;
  }
}
