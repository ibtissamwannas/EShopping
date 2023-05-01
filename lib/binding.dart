import 'package:e_shopping/controller/auth/sign_up_controller.dart';
import 'package:get/get.dart';

// to delete text when go to different page
class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}
