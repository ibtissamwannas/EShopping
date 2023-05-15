import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/data/datasource/remote/forgetpssword/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/classes/status_request.dart';
import '../../core/functions/handling_data.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();
  showPass();
  showRePass();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;
  String? email;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  bool isShowPass = true;
  bool isShowRePass = true;

  @override
  showPass() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  showRePass() {
    isShowRePass = isShowRePass == true ? false : true;
    update();
  }

  @override
  goToSuccessResetPassword() async {
    var formStateResp = formState.currentState;
    if (formStateResp!.validate()) {
      if (password.text != rePassword.text) {
        return Get.defaultDialog(
          title: "warning",
          middleText: "password not match",
        );
      } else {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPasswordData.postData(email!, password.text);
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response["status"] == "success") {
            Get.offNamed(AppRoutes.successResetPassword);
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
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
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
