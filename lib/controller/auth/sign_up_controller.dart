import 'package:e_shopping/core/constants/router_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToLogin();
  goToForgetPassword();
}
class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController password;
  @override
  signUp() {
    Get.offNamed(AppRoutes.checkEmail);
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }
}