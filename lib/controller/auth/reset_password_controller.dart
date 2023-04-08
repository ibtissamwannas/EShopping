import 'package:e_shopping/core/constants/router_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToSuccessResetPassword();
}
class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() {
    Get.toNamed(AppRoutes.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.dispose();
  }
}