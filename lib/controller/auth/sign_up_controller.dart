import 'package:e_shopping/core/constants/router_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/classes/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/auth/sign_up.dart';

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
  SignUpData SignUpDataData = SignUpData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;

  @override
  showPass() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  signUp() async {
    var formStateResp = formState.currentState;
    if (formStateResp!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await SignUpDataData.postData(
          username.text, password.text, email.text, phoneNumber.text);
      print(response);
      statusRequest = handlingData(response);
      print(statusRequest);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          // data.addAll(response["data"]);
          print(response);
          Get.offNamed(AppRoutes.verifyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
            title: "warning",
            middleText: "Phone number or email has already taken",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
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
