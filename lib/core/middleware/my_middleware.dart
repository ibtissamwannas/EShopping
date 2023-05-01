import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
