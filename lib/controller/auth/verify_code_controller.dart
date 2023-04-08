import 'package:e_shopping/core/constants/router_name.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword();
}
class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifyCode;

  @override
  checkCode() {}

  @override
  goToResetPassword() {
    Get.toNamed(AppRoutes.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }
}