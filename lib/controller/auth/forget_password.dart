import 'package:e_shopping/core/constants/router_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
  goToVerifyCode();
  goToForgetPassword();
}
class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  @override
  checkEmail() {}

  @override
  goToVerifyCode() {
    Get.offNamed(AppRoutes.verifyCode);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}