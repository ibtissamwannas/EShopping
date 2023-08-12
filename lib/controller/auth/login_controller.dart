import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/core/services/my_services.dart';
import 'package:e_shopping/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/classes/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../view/widgets/snackbars/snackbar.dart';

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
  MyServices myServices = Get.find();

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
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          // data.addAll(response["data"]);
          myServices.sharedPreferences
              .setInt("id", response['data']["users_id"]);
          myServices.sharedPreferences
              .setString("username", response['data']["users_name"]);
          myServices.sharedPreferences
              .setString("email", response['data']["users_email"]);
          myServices.sharedPreferences
              .setString("phonenumber", response['data']["users_phone"]);
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoutes.home);
        } else {
          Get.showSnackbar(
            SnackBarUI.ErrorSnackbar(
              message: 'Invalid email or password',
            ),
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
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });
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
