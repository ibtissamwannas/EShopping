import 'package:e_shopping/core/constants/router_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
  goToForgetPassword();
  showPass();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController password;
  bool isShowPass = true;

  @override
  showPass() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  signUp() {
    var formStateResp = formState.currentState;
    if (formStateResp!.validate()) {
      Get.offNamed(AppRoutes.verifyCodeSignUp);
    } else {
      print("not valid");
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
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
