import 'package:e_shopping/core/classes/crud.dart';
import 'package:get/get.dart';

import '../controller/auth/sign_up_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
