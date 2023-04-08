import 'package:e_shopping/core/constants/router_name.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{
  goToLogin();
}
class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {

  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    super.onInit();
  }
}