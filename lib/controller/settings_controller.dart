import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../core/constants/router_name.dart';
import '../core/services/my_services.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  @override
  logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic(
        myServices.sharedPreferences.getInt("id").toString());
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
