import 'package:e_shopping/core/constants/router_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController{
  checkEmail();
  goToverifyCodeSignUp();
}
class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;
  @override
  checkEmail() {}

  @override
  goToverifyCodeSignUp() {
    Get.offNamed(AppRoutes.verifyCodeSignUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email = TextEditingController();
    super.dispose();
  }
}