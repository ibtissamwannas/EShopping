import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/data/datasource/remote/forgetpssword/verify_code_forget_password.dart';
import 'package:get/get.dart';

import '../../core/classes/status_request.dart';
import '../../core/functions/handling_data.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? verifyCode;
  String? email;
  VerifyCodeForgetPasswordData VerifyCodeData =
      VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode(verifyCode) async {
    var response = await VerifyCodeData.postData(email!, verifyCode!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
          title: "warning",
          middleText: "wrong code",
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
