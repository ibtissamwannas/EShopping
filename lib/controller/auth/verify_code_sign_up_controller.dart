import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/data/datasource/remote/auth/verify_code_sign_up.dart';
import 'package:get/get.dart';

import '../../core/classes/status_request.dart';
import '../../core/functions/handling_data.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? verifyCode;
  String? email;
  VerifySignUpCodeData VerifyCodeData = VerifySignUpCodeData(Get.find());
  List data = [];
  StatusRequest? statusRequest;

  @override
  checkCode() async {
    print(email);
    var response = await VerifyCodeData.postData(email!, verifyCode!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // data.addAll(response["data"]);
        print(email);
        print(verifyCode);
        Get.toNamed(AppRoutes.successSignUp);
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
