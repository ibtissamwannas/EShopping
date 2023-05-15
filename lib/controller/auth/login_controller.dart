import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/data/datasource/remote/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/classes/status_request.dart';
import '../../core/functions/handling_data.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showPass();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPass = true;
  LogInData LogInDataData = LogInData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;

  @override
  showPass() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  login() async {
    var formStateResp = formState.currentState;
    if (formStateResp!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await LogInDataData.postData(email.text, password.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          // data.addAll(response["data"]);
          Get.offNamed(AppRoutes.home);
        } else {
          Get.defaultDialog(
            title: "warning",
            middleText: "${response["message"]}",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoutes.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
