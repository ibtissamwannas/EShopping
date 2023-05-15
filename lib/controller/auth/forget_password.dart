import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/classes/status_request.dart';
import '../../core/constants/router_name.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/forgetpssword/check_email.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToForgetPassword();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkEmail() async {
    var formStateResp = formState.currentState;
    if (formStateResp!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoutes.verifyCode, arguments: {"email": email.text});
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
