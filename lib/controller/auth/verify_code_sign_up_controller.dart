import 'package:e_shopping/core/constants/router_name.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  checkCode();
  goToSuccessSignUp();
}
class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String verifyCode;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp() {
    Get.toNamed(AppRoutes.successSignUp);
  }

  @override
  void onInit() {
    super.onInit();
  }
}